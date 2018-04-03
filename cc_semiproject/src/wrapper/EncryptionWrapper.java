package wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptionWrapper extends HttpServletRequestWrapper{

	public EncryptionWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String getParameter(String name) {
		String result = null; //암호화 처리할 녀석
		if(name != null && name.equals("userpwd")) {
			//패스워드 암호화 처리
			result = getSha512(super.getParameter("userpwd"));
		}else {
			//암호화 처리 x
			result = super.getParameter(name);
		}
		return result;
	}
	
	//암호화 처리용 메소드
	private static String getSha512(String passwd) {
		String encPwd = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] pwdBytes = passwd.getBytes(Charset.forName("UTF-8"));
			md.update(pwdBytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return encPwd;
	}
	
}
