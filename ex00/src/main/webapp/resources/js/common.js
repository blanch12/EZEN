document.addEventListener('DOMContentLoaded', () => {
    // 헤더
    const header = document.querySelector('.header');
    const mHeader = document.querySelector('.header-contents__Mobile');

    window.addEventListener('scroll', () => {
        if (window.scrollY > 0) { 
            header.classList.add('header-scroll'); 
            mHeader.classList.add('header-Mobile-scroll');
        } else {
            header.classList.remove('header-scroll'); 
            mHeader.classList.remove('header-Mobile-scroll');
        }
    });

    // m-footer__contenttitle 클릭
    const titles = document.querySelectorAll('.m-footer__contenttitle');

    titles.forEach(title => {
        title.addEventListener('click', () => {
            const parent = title.closest('.m-footer-infolist');
            const content = parent.querySelector('.m-footer__contentinner');

            document.querySelectorAll('.m-footer-infolist.open').forEach(openParent => {
                if (openParent !== parent) { 
                    openParent.classList.remove('open');
                    openParent.querySelector('.m-footer__contentinner').style.maxHeight = null;
                }
            });

            if (parent.classList.contains('open')) {
                content.style.maxHeight = null;
            } else {
                content.style.maxHeight = content.scrollHeight + 'px';
            }

            parent.classList.toggle('open');
        });
    });

// 모바일 메뉴박스 토글((데스크탑 ~1024px도 해야함 ㅜㅜ))
    const headerMobile = document.querySelector('.header-contents__Mobile');
    const menuBox = document.querySelector('.menubox')

    const handleMenuClick = (event) => {
        if (event.target.closest('.menu-button')) {
            console.log('Mobile menu button clicked!');
            menuBox.classList.toggle('open');
        }
    };

    headerMobile.addEventListener('click', handleMenuClick);
});
