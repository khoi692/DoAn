package utils;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author Administrator
 */
public class PasswordUtils {

    public static String MD5(String s) throws Exception {
        MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(s.getBytes(), 0, s.length());
        return new BigInteger(1, m.digest()).toString(16);
    }

    public static void main(String args[]) throws Exception {
        //Encode     
        String md5 = MD5("123");
        System.out.println("MD5 hash: " + md5);
    }

}
