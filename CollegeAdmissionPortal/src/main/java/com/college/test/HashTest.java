package com.college.test;

import com.college.utils.PasswordUtil;

public class HashTest {
    public static void main(String[] args) {
        System.out.println(PasswordUtil.hashPassword("Admin@2000"));
    }
}
