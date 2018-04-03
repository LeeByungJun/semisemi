package function;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class EncryptPassword {
	// ��ȣȭ
	/*public static String encryptSHA256(String str) {

		String SHA = "";

		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes("utf-8"));
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			SHA = null;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return SHA;
	}*/
	public static String getSha512(String passwd) {
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
