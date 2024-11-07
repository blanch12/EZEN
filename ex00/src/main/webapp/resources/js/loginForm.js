function showTab(tabId) {
			// 모든 탭 콘텐츠 숨기기
			document.querySelectorAll('.tab-content').forEach(
					function(content) {
						content.classList.remove('active');
					});

			// 모든 탭 버튼 비활성화
			document.querySelectorAll('.tab-buttons button').forEach(
					function(button) {
						button.classList.remove('active');
					});

			// 선택한 탭 콘텐츠 및 버튼 활성화
			document.getElementById(tabId).classList.add('active');
			document
					.querySelector(`.tab-buttons button[onclick="showTab('${tabId}')"]`).classList
					.add('active');
		}