// Source code is decompiled from a .class file using FernFlower decompiler.
package com.security;

import java.util.Base64;

public class Base64Decoder {
  public Base64Decoder() {
  }

  public static String decodeString(String encodedString) {
    byte[] bytes = Base64.getDecoder().decode(encodedString);
    return new String(bytes);
  }

  public static String encodeString(String plainString) {
    return Base64.getEncoder().encodeToString(plainString.getBytes());
  }
}
