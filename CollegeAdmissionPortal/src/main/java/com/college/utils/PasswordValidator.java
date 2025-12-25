package com.college.utils;

import java.util.regex.Pattern;

public class PasswordValidator {

    private static final String PASSWORD_REGEX =
            "^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$";

    private static final Pattern pattern =
            Pattern.compile(PASSWORD_REGEX);

    public static boolean isValid(String password) {
        return password != null && pattern.matcher(password).matches();
    }
}
