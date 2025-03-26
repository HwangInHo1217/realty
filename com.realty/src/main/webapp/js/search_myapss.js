/**
 * 
 */
// 세션에서 객체를 JSP로 전달 (예: 사용자 정보를 서버에서 직접 주입)
    var userInfo = ${dto};  // JSP에서 model의 userInfo 객체를 JavaScript 변수로 변환

    // 비밀번호 변경을 위한 PUT 요청 보내기
    function submitPasswordChange() {
        var newPassword = document.getElementById("mpass").value;
        var confirmPassword = document.getElementById("chkpass").value;

        if (newPassword !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        // PUT 요청 보내기
        fetch('/changePassword', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email: dto.m_email, // 이메일을 서버로 전송
                mpass: mpass // 새 비밀번호
            })
        })
        .then(response => {
            if (response.ok) {
                alert("비밀번호가 변경되었습니다.");
                window.location.href = '/login.jsp';  // 비밀번호 변경 후 리다이렉트
            } else {
                alert("비밀번호 변경에 실패했습니다.");
            }
        })
        .catch(error => {
            console.error("Error during PUT request:", error);
        });
    }