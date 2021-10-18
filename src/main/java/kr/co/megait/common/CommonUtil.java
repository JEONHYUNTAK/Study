package kr.co.megait.common;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class CommonUtil {

	/**
	 * AES 암호화 함수
	 * @param text
	 * @return
	 */
	public static String getEncrypt(String text) {
		
		String cryptoKey = "##megait1.test##";
		String encryptText = null;
		try {
			
			Key secureKey = new SecretKeySpec(cryptoKey.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, secureKey);
			byte[] encrypteData = cipher.doFinal(text.getBytes());
			encryptText = byteArrayToHex(encrypteData);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return encryptText;
	}

	/**
	 * AES 스트링 복호화
	 * @param text
	 * @return
	 */
	public static String getDecrypt(String encryptText) {
		
		String CryptoKey = "##megait1.test##";
		
	    String decryptText = null;

	    try {
	    	
	        Key secureKey = new SecretKeySpec(CryptoKey.getBytes(), "AES");
	        Cipher cipher = Cipher.getInstance("AES");
	        cipher.init(Cipher.DECRYPT_MODE, secureKey);
	        byte[] decryptedData = cipher.doFinal( hexToByteArray(encryptText) );
	        decryptText = new String(decryptedData);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return decryptText;

	}

	
	
	/**
	 * byte[] to hex
	 * @param ba
	 * @return
	 */
	public static String byteArrayToHex(byte[] ba){
		if(ba==null || ba.length ==0){
			return null;
		}
		
		StringBuffer sb= new StringBuffer(ba.length*2);
		String hexNumber;
		for(int x=0;x<ba.length;x++){
			hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
			sb.append(hexNumber.substring(hexNumber.length()-2));
		}
		
		return sb.toString();
	}
	
	
	/**
	 * hex to byte[]
	 * @param hex
	 * @return
	 */
	public static byte[] hexToByteArray(String hex){
		if(hex==null || hex.length()==0){
			return null;
		}
		
		byte[] ba= new byte[hex.length()/2];
		for(int i=0;i<ba.length;i++){
			ba[i]=(byte)Integer.parseInt(hex.substring(2*i,  2*i+2), 16);
		}
		
		return ba;
		
	}
	
	
}
