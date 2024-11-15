// Source code is decompiled from a .class file using FernFlower decompiler.
package com.workflow.connection;

import java.security.spec.KeySpec;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import org.apache.commons.codec.binary.Base64;

public class TrippleDes {
    private static final String UNICODE_FORMAT = "UTF8";
    public static final String DESEDE_ENCRYPTION_SCHEME = "DESede";
    private KeySpec ks;
    private SecretKeyFactory skf;
    private Cipher cipher;
    byte[] arrayBytes;
    private String myEncryptionKey = "ThisIsSpartaThisIsSparta";
    private String myEncryptionScheme = "DESede";
    SecretKey key;

    public TrippleDes() throws Exception {
        this.arrayBytes = this.myEncryptionKey.getBytes("UTF8");
        this.ks = new DESedeKeySpec(this.arrayBytes);
        this.skf = SecretKeyFactory.getInstance(this.myEncryptionScheme);
        this.cipher = Cipher.getInstance(this.myEncryptionScheme);
        this.key = this.skf.generateSecret(this.ks);
    }

    public String encrypt(String unencryptedString) {
        String encryptedString = null;

        try {
            this.cipher.init(1, this.key);
            byte[] plainText = unencryptedString.getBytes("UTF8");
            byte[] encryptedText = this.cipher.doFinal(plainText);
            encryptedString = new String(Base64.encodeBase64(encryptedText));
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return encryptedString;
    }

    public String decrypt(String encryptedString) {
        String decryptedText = null;

        try {
            this.cipher.init(2, this.key);
            byte[] encryptedText = Base64.decodeBase64(encryptedString);
            byte[] plainText = this.cipher.doFinal(encryptedText);
            decryptedText = new String(plainText);
        } catch (Exception var5) {
            var5.printStackTrace();
        }

        return decryptedText;
    }
}
