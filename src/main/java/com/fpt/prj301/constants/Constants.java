package com.fpt.prj301.constants;

public class Constants {

    // RECAPTCHA
    public static final String SITE_KEY = "6Ldo9BwpAAAAAJUTRGZleZKbWtZk4p0u8JrbFEcl";

    public static final String SECRET_KEY = "6Ldo9BwpAAAAADZ6VFGWLhwe_vC1l66lT4oThmWA";

    // ------------------------------------------------------------------------------------------ // 
    
    // LOGIN GOOGLE
    public static String GOOGLE_CLIENT_ID = "677531895603-bm3l892pu6nl9lgoup30u547625oag4q.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/zaystore/login-google";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";

    // ---------------------------------------------------------------------------------------- //
    
    // LOGIN FACEBOOK
    public static String FACEBOOK_APP_ID = "855894835999423";
    
    public static String FACEBOOK_APP_SECRET = "e178eaef6367845152af49043bd9da7b";
    
    public static String FACEBOOK_REDIRECT_URL = "https://localhost:8080/zaystore/login-facebook";
    
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
    
    // ---------------------------------------------------------------------------------------- //
    
    // LOGIN LINKEDIN
    public static String LINKED_CLIENT_ID = "86mmx4v08rl8r7";

    public static String LINKED_CLIENT_SECRET = "RMIXhkVRpIuK7E2L";

    public static String LINKED_REDIRECT_URI = "http://localhost:8080/zaystore/login-linkedin";
}
