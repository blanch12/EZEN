package org.zerock.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.kakao.service.KakaoService;
import org.zerock.kakao.vo.KakaoUser;
import org.zerock.member.service.AddrService;
import org.zerock.member.service.MemberService;
import org.zerock.member.vo.AddrVO;
import org.zerock.member.vo.LoginVO;
import org.zerock.naver.service.NaverService;
import org.zerock.naver.vo.NaverUser;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {

    @Autowired
    @Qualifier("memberServiceImpl")
    private MemberService service;

    @Autowired
    private KakaoService kakaoService;

    @Autowired
    private NaverService naverService;
    
    // AddressService 주입
    @Autowired
    private AddrService addrService;

    private static final String KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/authorize";
    private static final String CLIENT_ID = "500f97700c324d62a552a79bdbf68945"; // 카카오 REST API 키
    private static final String REDIRECT_URI = "http://localhost/member/kakao/callback"; // 카카오 리디렉트 URI

    private static final String NAVER_AUTH_URL = "https://nid.naver.com/oauth2.0/authorize";
    private static final String NAVER_CLIENT_ID = "Ge_8IR6KHMov_RVNL60u"; // 네이버 Client ID
    private static final String NAVER_REDIRECT_URI = "http://localhost/member/naver/callback"; // 네이버 리디렉트 URI

    // 로그인 폼
    @GetMapping("/loginForm.do")
    public String loginForm() {
        log.info("========= loginForm.do ============");
        return "member/loginForm";
    }

    // 일반 로그인 처리
    @PostMapping("/login.do")
    public String login(LoginVO vo, HttpSession session, RedirectAttributes rttr) {
        log.info("========= login.do =============");

        LoginVO loginVO = service.login(vo);

        if (loginVO == null) {
            rttr.addFlashAttribute("msg", "로그인 정보가 맞지 않습니다.<br>정보를 확인하시고 다시 시도해 주세요");
            return "redirect:/member/loginForm.do";
        }
        
        // 로그인 성공 시 memberId를 세션에 저장
        session.setAttribute("memberId", loginVO.getId());
        
        session.setAttribute("login", loginVO);
        rttr.addFlashAttribute("msg", loginVO.getName() + "님은 " + loginVO.getGradeName() + "(으)로 로그인 되었습니다.");

        // 이전 페이지로 리다이렉트
        String redirectUrl = (String) session.getAttribute("redirectUrl");
        if (redirectUrl != null) {
            session.removeAttribute("redirectUrl"); // 세션에서 URL 제거
            return "redirect:" + redirectUrl;
        }

        // redirectUrl이 없는 경우 메인 페이지로 이동
        return "redirect:/main/main.do";
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session, RedirectAttributes rttr) {
        log.info("========= logout.do =============");

        session.removeAttribute("login");

        rttr.addFlashAttribute("msg", "로그 아웃이 되었습니다.<br>불편한 사항은 질문 답변 게시판을 이용해 주세요");
        return "redirect:/main/main.do";
    }

    @GetMapping("/writeForm.do")
    public String writeForm() {
        log.info("writeForm()-------------------");
        return "member/writeForm";
    }

    @PostMapping("/write.do")
    public String write(LoginVO vo, RedirectAttributes rttr) {
        service.write(vo);
        rttr.addFlashAttribute("msg", "회원가입 완료");
        return "redirect:/main/main.do";
    }

    @GetMapping("/list.do")
	public String list(Model model, HttpServletRequest request) {
		
		log.info("list() =======");
		
		// 페이지 처리를 위한 객체 생성
		PageObject pageObject = PageObject.getInstance(request);
		// 1.
		//request.setAttribute("list", service.list());
		// 2. 처리된 데이터를 model 저장해서 넘긴다.
		// model에 담으면 request에 자동으로 담긴다.
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "member/list";
	}

    @GetMapping("/view.do")
    public String view(Model model, String id, HttpSession session, RedirectAttributes rttr) {
        log.info("view() ======");

        // 로그인 여부 확인
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            // 로그인되지 않은 경우 로그인 폼으로 리다이렉트하고, 이전 URL 저장
            session.setAttribute("redirectUrl", "/member/view.do");
            rttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
            return "redirect:/member/loginForm.do";
        }

        // 로그인된 상태에서 id 값이 null인 경우 세션에서 id 가져오기
        if (id == null) {
            id = loginVO.getId();
        }

        model.addAttribute("vo", service.view(id));
        return "member/view";
    }
    


    // 주소 관리 페이지를 보여주고, 등록된 주소 목록을 전달
    @GetMapping("/addr.do")
    public String addrManagement(HttpSession session, Model model) {
        // 로그인 세션에서 memberId를 가져옴
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            return "redirect:/member/loginForm.do"; // 로그인되지 않은 경우
        }

        String memberId = loginVO.getId();
        model.addAttribute("addrs", addrService.getAllAddrs(memberId));
        return "member/addr";
    }



    // 주소 등록 폼 페이지 이동
    @GetMapping("/addrForm.do")
    public String showAddrForm() {
        return "member/addrForm"; // 주소 등록 폼 페이지 뷰 이름
    }
    
    // 주소 등록 처리 메서드
    @PostMapping("/addr/register.do")
    public String registerAddress(AddrVO addrVO, HttpSession session, RedirectAttributes rttr) {
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
            return "redirect:/member/loginForm.do";
        }

        // Boolean 값에 따라 isDefault를 Y 또는 N으로 설정
        addrVO.setIsDefaultFromBoolean("true".equals(addrVO.getIsDefault()));

        String memberId = loginVO.getId();
        addrVO.setMemberId(memberId);

        // 기본 주소 설정 시 기존 기본 주소 해제 로직
        if ("Y".equals(addrVO.getIsDefault())) {
            addrService.updateExistingDefault(memberId);
        }

        boolean isInserted = addrService.insertAddr(addrVO);
        rttr.addFlashAttribute("msg", isInserted ? "주소가 성공적으로 등록되었습니다." : "주소 등록에 실패했습니다.");
        return "redirect:/member/addr.do";
    }




    
    // 주소 수정 폼 이동
    @GetMapping("/addr/edit")
    public String editAddress(@RequestParam("id") int id, Model model) {
        AddrVO addr = addrService.getAddrById(id); // 주소 정보를 불러오기
        model.addAttribute("addr", addr);
        return "member/addrEdit"; // 수정 페이지로 이동
    }

    @PostMapping("/addr/update.do")
    public String updateAddress(AddrVO addrVO, HttpSession session, RedirectAttributes rttr) {
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
            return "redirect:/member/loginForm.do";
        }

        addrVO.setIsDefaultFromBoolean("true".equals(addrVO.getIsDefault())); // 여기서 Boolean 값을 Y/N으로 설정

        String memberId = loginVO.getId();
        addrVO.setMemberId(memberId);

        if ("Y".equals(addrVO.getIsDefault())) {
            addrService.updateExistingDefault(memberId);
        }

        boolean isUpdated = addrService.updateAddr(addrVO);
        rttr.addFlashAttribute("msg", isUpdated ? "주소가 성공적으로 수정되었습니다." : "주소 수정에 실패했습니다.");
        return "redirect:/member/addr.do";
    }

    @PostMapping("/addr/delete")
    public String deleteAddress(@RequestParam("id") String id, HttpSession session, RedirectAttributes rttr) {
        // 로그인 정보 확인
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            rttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
            return "redirect:/member/loginForm.do";
        }

        // 로그인된 사용자 ID
        String memberId = loginVO.getId();

        try {
            // ID를 정수로 변환 후 삭제 요청
            boolean isDeleted = addrService.deleteAddr(Integer.parseInt(id), memberId);
            rttr.addFlashAttribute("msg", isDeleted ? "주소가 성공적으로 삭제되었습니다." : "주소 삭제에 실패했습니다.");
        } catch (NumberFormatException e) {
            rttr.addFlashAttribute("msg", "잘못된 요청입니다.");
        }

        // 주소 관리 페이지로 리다이렉트
        return "redirect:/member/addr.do";
    }

    @GetMapping("/update.do")
    public String update(Model model, String id, HttpSession session, RedirectAttributes rttr) {
        log.info("update() ======");

        // 로그인 여부 확인
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            // 로그인되지 않은 경우 로그인 폼으로 리다이렉트하고, 이전 URL 저장
            session.setAttribute("redirectUrl", "/member/view.do");
            rttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
            return "redirect:/member/loginForm.do";
        }

        // 로그인된 상태에서 id 값이 null인 경우 세션에서 id 가져오기
        if (id == null) {
            id = loginVO.getId();
        }

        model.addAttribute("vo", service.view(id));
        return "member/update";
    }
    
    @PostMapping("/update.do")
    public String updateMember(
            @RequestParam("id") String id,
            @RequestParam("name") String name,
            @RequestParam("gender") String gender,
            @RequestParam("birth") String birth,
            @RequestParam("tel") String tel,
            @RequestParam("email") String email,
            @RequestParam("pw") String password, // 비밀번호 확인용
            HttpSession session,
            RedirectAttributes rttr
    ) {
        log.info("updateMember() - 수정 요청 처리 시작");

        // 로그인된 사용자 정보 가져오기
        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        // 비밀번호 확인 로직 (예시로 서비스에서 비밀번호 확인 메서드를 사용)
        boolean isPasswordCorrect = service.checkPassword(id, password);
        if (!isPasswordCorrect) {
            rttr.addFlashAttribute("msg", "비밀번호가 올바르지 않습니다. 다시 입력해주세요.");
            return "redirect:/member/updateForm.do";
        }

        // 업데이트 로직 호출
        LoginVO updatedMember = new LoginVO();
        updatedMember.setId(id);
        updatedMember.setName(name);
        updatedMember.setGender(gender);
        try {
            // String 타입의 birth를 Date 타입으로 변환
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthDate = dateFormat.parse(birth);  // 변환 시도
            updatedMember.setBirth(birthDate);         // Date로 변환 후 설정
        } catch (Exception e) {
            log.error("생년월일 변환 오류: " + e.getMessage());
            rttr.addFlashAttribute("msg", "잘못된 생년월일 형식입니다.");
            return "redirect:/member/updateForm.do";
        }
        updatedMember.setTel(tel);
        updatedMember.setEmail(email);

        boolean isUpdated = service.updateMember(updatedMember);

        // 수정 성공 여부에 따른 리다이렉트
        if (isUpdated) {
            rttr.addFlashAttribute("msg", "회원 정보가 성공적으로 수정되었습니다.");
            return "redirect:/member/update.do";
        } else {
            rttr.addFlashAttribute("msg", "회원 정보 수정에 실패했습니다.");
            return "redirect:/member/updateForm.do";
        }
    }

    
    @GetMapping("/updateForm.do")
    public String updateForm(Model model, String id, HttpSession session, RedirectAttributes rttr) {
        log.info("update() ======");

        // 로그인 여부 확인
        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        if (loginVO == null) {
            // 로그인되지 않은 경우 로그인 폼으로 리다이렉트하고, 이전 URL 저장
            session.setAttribute("redirectUrl", "/member/view.do");
            rttr.addFlashAttribute("msg", "로그인 후 이용할 수 있습니다.");
            return "redirect:/member/loginForm.do";
        }

        // 로그인된 상태에서 id 값이 null인 경우 세션에서 id 가져오기
        if (id == null) {
            id = loginVO.getId();
        }

        model.addAttribute("vo", service.view(id));
        return "member/updateForm";
    }

    @PostMapping("/delete.do")
    public String deleteMember(
            @RequestParam("id") String id,
            @RequestParam("pw") String password,
            HttpSession session,
            RedirectAttributes rttr) {

        // 로그인된 사용자 정보를 가져옴
        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        // 로그인된 사용자와 삭제하려는 ID가 일치하는지 확인
        if (loginVO == null || !loginVO.getId().equals(id)) {
            rttr.addFlashAttribute("msg", "잘못된 접근입니다.");
            return "redirect:/member/view.do"; // 잘못된 접근일 경우 돌아감
        }

        // 비밀번호 확인
        if (!service.checkPassword(id, password)) {
            rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/view.do"; // 비밀번호가 틀리면 돌아감
        }

        // 탈퇴 처리
        boolean isDeleted = service.deleteMember(id);

        if (isDeleted) {
            session.invalidate(); // 세션을 무효화하여 로그아웃 처리
            rttr.addFlashAttribute("msg", "성공적으로 탈퇴되었습니다.");
            return "redirect:/main/main.do"; // 메인 페이지로 리다이렉트
        } else {
            rttr.addFlashAttribute("msg", "탈퇴 처리에 실패했습니다.");
            return "redirect:/member/view.do";
        }
    }


    
    @GetMapping("/changeStatus.do")
    public String changeStatus(Model model, HttpServletRequest request, LoginVO vo, RedirectAttributes rttr) throws Exception {
        PageObject pageObject = PageObject.getInstance(request);
        model.addAttribute("vo", service.changeStatus(vo));

        rttr.addFlashAttribute("msg", "회원 상태 변경 성공");

        return "redirect:list.do?" + pageObject.getPageQuery();
    }

    @GetMapping("/changeGradeNo.do")
    public String changeGradeNo(Model model, HttpServletRequest request, LoginVO vo, RedirectAttributes rttr) throws Exception {
        PageObject pageObject = PageObject.getInstance(request);
        model.addAttribute("vo", service.changeGradeNo(vo));

        rttr.addFlashAttribute("msg", "회원 등급 변경 성공");

        return "redirect:list.do?" + pageObject.getPageQuery();
    }

    // 1. 카카오 로그인 페이지로 리다이렉트
    @GetMapping("/kakao/login")
    public String kakaoLogin() {
        String kakaoLoginUrl = KAKAO_AUTH_URL + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&response_type=code"
                + "&prompt=login"; // 동의 화면 강제 표시
        return "redirect:" + kakaoLoginUrl;
    }

    // 2. 카카오 로그인 콜백 처리
    @GetMapping("/kakao/callback")
    public String kakaoCallback(@RequestParam("code") String code, HttpSession session, RedirectAttributes rttr) {
        try {
            // 1. 인증 코드로 액세스 토큰 요청
            String accessToken = kakaoService.getAccessToken(code);

            // 2. 액세스 토큰으로 사용자 정보 가져오기
            KakaoUser kakaoUser = kakaoService.getUserInfo(accessToken);
            log.info("KakaoUser 정보: " + kakaoUser);

            // 3. 카카오 사용자 정보로 DB에서 로그인 정보 조회 또는 신규 사용자 추가
            LoginVO loginVO = service.findByKakaoId(String.valueOf(kakaoUser.getId()));

            if (loginVO == null) {
                // 신규 사용자 등록
                loginVO = new LoginVO();
                loginVO.setId(String.valueOf(kakaoUser.getId())); // ID 설정
                loginVO.setName(kakaoUser.getNickname());
                loginVO.setEmail(kakaoUser.getEmail() != null ? kakaoUser.getEmail() : "unknown@unknown.com"); // 기본값 설정
                loginVO.setGender(kakaoUser.getGender() != null ? kakaoUser.getGender() : "U"); // 기본값 설정
                loginVO.setBirth(new SimpleDateFormat("yyyy-MM-dd").parse("1900-01-01"));
                loginVO.setLoginType("kakao");

                service.saveKakaoUser(loginVO); // 신규 사용자 저장
                log.info("새로운 카카오 사용자 정보를 저장했습니다.");
            }

            // 4. 세션에 로그인 정보 저장
            session.setAttribute("login", loginVO);
            // 로그인 성공 시 memberId를 세션에 저장
            session.setAttribute("memberId", loginVO.getId());
            rttr.addFlashAttribute("msg", kakaoUser.getNickname() + "님이 카카오로 로그인 되었습니다.");
            
            // 이전 페이지로 리다이렉트
            String redirectUrl = (String) session.getAttribute("redirectUrl");
            session.removeAttribute("redirectUrl"); // 세션에서 URL 제거
            return "redirect:" + (redirectUrl != null ? redirectUrl : "/main/main.do");
            

        } catch (Exception e) {
            log.error("카카오 로그인 실패 - 오류 메시지: " + e.getMessage(), e);
            rttr.addFlashAttribute("msg", "카카오 로그인에 실패하였습니다. 다시 시도해 주세요.");
            return "redirect:/member/loginForm.do";
        }
    }


    // 네이버 로그인 페이지로 리다이렉트
    @GetMapping("/naver/login")
    public String naverLogin() {
        String naverLoginUrl = NAVER_AUTH_URL + "?client_id=" + NAVER_CLIENT_ID
                + "&redirect_uri=" + NAVER_REDIRECT_URI
                + "&response_type=code&state=STATE_STRING";
        return "redirect:" + naverLoginUrl;
    }

    // 네이버 로그인 콜백 처리
    @GetMapping("/naver/callback")
    public String naverCallback(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session, RedirectAttributes rttr) {
        try {
            // 1. 네이버로부터 액세스 토큰 요청
            String accessToken = naverService.getAccessToken(code, state);
            
            // 2. 액세스 토큰을 이용해 사용자 정보 조회
            NaverUser naverUser = naverService.getUserInfo(accessToken);
            log.info("NaverUser 정보: " + naverUser);
            
            // 3. 데이터베이스에서 해당 네이버 사용자 확인
            LoginVO loginVO = service.findByNaverId(naverUser.getId());

            if (loginVO == null) {
                // 4. 새 사용자일 경우 회원 가입 처리
                loginVO = new LoginVO();
                loginVO.setId(naverUser.getId());
                loginVO.setName(naverUser.getNickname());
                loginVO.setEmail(naverUser.getEmail() != null ? naverUser.getEmail() : "unknown@unknown.com"); // 기본 이메일 설정
                loginVO.setGender(naverUser.getGender() != null ? naverUser.getGender() : "U"); // 기본값 설정
                loginVO.setBirth(new SimpleDateFormat("yyyy-MM-dd").parse("1900-01-01"));
                loginVO.setLoginType("naver");
                
                // 서비스 레이어를 통해 새 회원 정보 저장
                service.saveNaverUser(loginVO);
                log.info("새로운 네이버 사용자 정보를 저장했습니다.");
            }
            
            // 5. 세션에 로그인 정보 저장
            session.setAttribute("login", loginVO);
            // 로그인 성공 시 memberId를 세션에 저장
            session.setAttribute("memberId", loginVO.getId());
            rttr.addFlashAttribute("msg", naverUser.getNickname() + "님이 네이버로 로그인 되었습니다.");
            
            // 이전 페이지로 리다이렉트
            String redirectUrl = (String) session.getAttribute("redirectUrl");
            session.removeAttribute("redirectUrl"); // 세션에서 URL 제거
            return "redirect:" + (redirectUrl != null ? redirectUrl : "/main/main.do");

        } catch (Exception e) {
            log.error("네이버 로그인 실패 - 오류 메시지: " + e.getMessage(), e);
            rttr.addFlashAttribute("msg", "네이버 로그인에 실패하였습니다. 다시 시도해 주세요.");
            return "redirect:/member/loginForm.do";
        }
    }

}
