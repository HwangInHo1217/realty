/**
 * 
 */

function all_chk(){
	if(document.getElementById('all').checked){
		document.getElementById('age_ck').checked=true;
		document.getElementById('m_tos').checked=true;
		document.getElementById('m_pic').checked=true;
		document.getElementById('m_ms').checked=true;
	}else{
		document.getElementById('age_ck').checked=false;
		document.getElementById('m_tos').checked=false;
		document.getElementById('m_pic').checked=false;
		document.getElementById('m_ms').checked=true;
	}
}
function joinOk(){

	  const formData = {
        age_ck: document.getElementById('age_ck').checked ? 'Y' : 'N',
        m_tos: document.getElementById('m_tos').checked ? 'Y' : 'N',
        m_pic: document.getElementById('m_pic').checked ? 'Y' : 'N',
		m_ms: document.getElementById('m_ms').checked ? 'Y' : 'N'
    };
	
	f.submit();
}