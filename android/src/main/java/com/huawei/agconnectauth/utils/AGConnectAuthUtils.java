/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

package com.huawei.agconnectauth.utils;

import static com.huawei.agconnect.auth.AGCAuthException.ACCESS_TOKEN_OVER_LIMIT;
import static com.huawei.agconnect.auth.AGCAuthException.ACCOUNT_HAVE_BEEN_REGISTERED;
import static com.huawei.agconnect.auth.AGCAuthException.ACCOUNT_PASSWORD_SAME;
import static com.huawei.agconnect.auth.AGCAuthException.ALREADY_SIGN_IN_USER;
import static com.huawei.agconnect.auth.AGCAuthException.ANONYMOUS_SIGNIN_OVER_LIMIT;
import static com.huawei.agconnect.auth.AGCAuthException.AUTH_METHOD_IS_DISABLED;
import static com.huawei.agconnect.auth.AGCAuthException.AUTH_METHOD_NOT_SUPPORT;
import static com.huawei.agconnect.auth.AGCAuthException.CANNOT_UNLINK_ONE_PROVIDER_USER;
import static com.huawei.agconnect.auth.AGCAuthException.CONFIG_LOCK_TIME_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.EMAIL_VERIFICATION_IS_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.FAIL_GET_PROVIDER_USER;
import static com.huawei.agconnect.auth.AGCAuthException.FAIL_TO_GET_THIRD_USER_INFO;
import static com.huawei.agconnect.auth.AGCAuthException.FAIL_TO_GET_THIRD_USER_UNION_ID;
import static com.huawei.agconnect.auth.AGCAuthException.FAIL_TO_USER_LINK;
import static com.huawei.agconnect.auth.AGCAuthException.FAIL_TO_USER_UNLINK;
import static com.huawei.agconnect.auth.AGCAuthException.GET_QQ_UID_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.GET_QQ_USERINFO_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.GET_UID_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.GET_USER_INFO_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.GOOGLE_RESPONSE_NOT_EQUAL_APPID;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_ACCESS_TOKEN;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_APPID;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_APPSECRET;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_EMAIL;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_PHONE;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_REFRESH_TOKEN;
import static com.huawei.agconnect.auth.AGCAuthException.INVALID_TOKEN;
import static com.huawei.agconnect.auth.AGCAuthException.NOT_SIGN_IN;
import static com.huawei.agconnect.auth.AGCAuthException.NULL_TOKEN;
import static com.huawei.agconnect.auth.AGCAuthException.PASSWORD_IS_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.PASSWORD_SAME_AS_BEFORE;
import static com.huawei.agconnect.auth.AGCAuthException.PASSWORD_STRENGTH_LOW;
import static com.huawei.agconnect.auth.AGCAuthException.PASSWORD_TOO_LONG;
import static com.huawei.agconnect.auth.AGCAuthException.PASSWORD_VERIFICATION_CODE_OVER_LIMIT;
import static com.huawei.agconnect.auth.AGCAuthException.PASSWORD_VERIFY_CODE_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.PHONE_VERIFICATION_IS_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.PRODUCT_STATUS_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.PROVIDER_HAVE_LINKED_ONE_USER;
import static com.huawei.agconnect.auth.AGCAuthException.PROVIDER_USER_HAVE_BEEN_LINKED;
import static com.huawei.agconnect.auth.AGCAuthException.QQINFO_RESPONSE_IS_NULL;
import static com.huawei.agconnect.auth.AGCAuthException.REGISTER_ACCOUNT_IS_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.SEND_EMAIL_FAIL;
import static com.huawei.agconnect.auth.AGCAuthException.SEND_MESSAGE_FAIL;
import static com.huawei.agconnect.auth.AGCAuthException.SENSITIVE_OPERATION_TIMEOUT;
import static com.huawei.agconnect.auth.AGCAuthException.SIGNIN_USER_PASSWORD_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.SIGNIN_USER_STATUS_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.TOKEN_AND_PRODUCTID_NOT_MATCH;
import static com.huawei.agconnect.auth.AGCAuthException.UID_PRODUCTID_NOT_MATCH;
import static com.huawei.agconnect.auth.AGCAuthException.UPDATE_ACCOUNT_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.UPDATE_PASSWORD_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.USER_HAVE_BEEN_REGISTERED;
import static com.huawei.agconnect.auth.AGCAuthException.USER_LINKED;
import static com.huawei.agconnect.auth.AGCAuthException.USER_NOT_REGISTERED;
import static com.huawei.agconnect.auth.AGCAuthException.USER_UNLINKED;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_ACTION_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_AND_PASSWORD_BOTH_NULL;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_FORMAT_ERROR;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_INTERVAL_LIMIT;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_LANGUAGE_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_RECEIVER_EMPTY;
import static com.huawei.agconnect.auth.AGCAuthException.VERIFY_CODE_TIME_LIMIT;

import com.huawei.agconnect.auth.AGConnectAuthCredential;
import com.huawei.agconnect.auth.AGConnectUser;
import com.huawei.agconnect.auth.EmailAuthProvider;
import com.huawei.agconnect.auth.FacebookAuthProvider;
import com.huawei.agconnect.auth.GoogleAuthProvider;
import com.huawei.agconnect.auth.GoogleGameAuthProvider;
import com.huawei.agconnect.auth.HWGameAuthProvider;
import com.huawei.agconnect.auth.HwIdAuthProvider;
import com.huawei.agconnect.auth.PhoneAuthProvider;
import com.huawei.agconnect.auth.QQAuthProvider;
import com.huawei.agconnect.auth.SelfBuildProvider;
import com.huawei.agconnect.auth.TwitterAuthProvider;
import com.huawei.agconnect.auth.VerifyCodeSettings;
import com.huawei.agconnect.auth.WeiboAuthProvider;
import com.huawei.agconnect.auth.WeixinAuthProvider;
import com.huawei.agconnect.exception.AGCException;
import com.huawei.hmf.tasks.OnFailureListener;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel.Result;

public class AGConnectAuthUtils {

    /**
     * authFailureListener.
     *
     * @param result: FlutterResult.
     * @return result/
     */
    public static OnFailureListener authFailureListener(final Result result) {
        return e -> {
            Map<String, Object> map = new HashMap<>();
            if (e instanceof AGCException) {
                int code = ((AGCException) e).getCode();
                map.put("exceptionCode", AGConnectAuthUtils.getAuthExceptionCode(code));
                result.error(String.valueOf(code), ((AGCException) e).getErrMsg(), map);
            } else {
                result.error("", e.getMessage(), map);
            }
        };
    }

    /**
     * Converts a AGConnectUser into a Map.
     *
     * @param user: AGConnectUser.
     * @return map
     */
    public static Map<String, Object> mapFromUser(AGConnectUser user) {
        if (user != null) {
            Map<String, Object> res = new HashMap<>();
            res.put("isAnonymous", user.isAnonymous());
            res.put("uid", user.getUid());
            res.put("email", user.getEmail());
            res.put("phone", user.getPhone());
            res.put("displayName", user.getDisplayName());
            res.put("photoUrl", user.getPhotoUrl());
            res.put("providerId", Integer.valueOf(user.getProviderId()));
            res.put("providerInfo", user.getProviderInfo());
            res.put("emailVerified", user.getEmailVerified());
            res.put("passwordSet", user.getPasswordSetted());
            return res;
        } else {
            return null;
        }
    }

    /**
     * Converts a Map into a VerifyCodeSettings.
     *
     * @param arguments: map.
     * @return VerifyCodeSettings.
     */
    public static VerifyCodeSettings getSettingsFromArguments(Map arguments) {
        Map map = (Map) arguments.get("settings");
        if (map != null) {
            int action = (int) map.get("action") == 0
                ? VerifyCodeSettings.ACTION_REGISTER_LOGIN
                : VerifyCodeSettings.ACTION_RESET_PASSWORD;
            Locale locale = getLocaleFromArguments(map);
            int interval = (int) map.get("sendInterval");
            return new VerifyCodeSettings.Builder().action(action).locale(locale).sendInterval(interval).build();
        }
        return null;
    }

    /**
     * Converts a Map into a Locale.
     *
     * @param arguments: map.
     * @return locale
     */
    public static Locale getLocaleFromArguments(Map arguments) {
        Locale locale = null;
        if (arguments != null) {
            String localeLanguage = (String) arguments.get("localeLanguage");
            String localeCountry = (String) arguments.get("localeCountry");
            if (localeLanguage != null && localeCountry != null) {
                locale = new Locale(localeLanguage, localeCountry);
            }
        }
        return locale;
    }

    /**
     * Converts a Map into a AGConnectAuthCredential.
     *
     * @param credential: map.
     * @return AGConnectAuthCredential
     */
    public static AGConnectAuthCredential getCredentialFromArguments(Map credential, Result result) {
        int provider = ValueGetter.getInteger("provider", credential);
        boolean autoCreateUser = true;
            switch (provider) {
                case AGConnectAuthCredential.SelfBuild_Provider:
                    String selfBuildToken = ValueGetter.getString("token", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return SelfBuildProvider.credentialWithToken(selfBuildToken, autoCreateUser);

                case AGConnectAuthCredential.Email_Provider:
                    String email = ValueGetter.getString("email", credential);
                    String password = (String) credential.get("password");
                    String verifyCode = (String) credential.get("verifyCode");
                    return EmailAuthProvider.credentialWithVerifyCode(email, password, verifyCode);

                case AGConnectAuthCredential.Phone_Provider:
                    String countryCode = ValueGetter.getString("countryCode", credential);
                    String phoneNumber = ValueGetter.getString("phoneNumber", credential);
                    String phonePassword = (String) credential.get("password");
                    String phoneVerifyCode = (String) credential.get("verifyCode");
                    return PhoneAuthProvider.credentialWithVerifyCode(countryCode, phoneNumber, phonePassword,
                        phoneVerifyCode);
                case AGConnectAuthCredential.HMS_Provider:
                    String accessToken = ValueGetter.getString("accessToken", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return HwIdAuthProvider.credentialWithToken(accessToken, autoCreateUser);
                case AGConnectAuthCredential.HWGame_Provider:
                    HWGameAuthProvider.Builder builder = new HWGameAuthProvider.Builder();
                    if (credential.get("playerSign") != null) {
                        String playerSign = ValueGetter.getString("playerSign", credential);
                        builder.setPlayerSign(playerSign);
                    }
                    if (credential.get("playerId") != null) {
                        String playerId = ValueGetter.getString("playerId", credential);
                        builder.setPlayerId(playerId);
                    }
                    if (credential.get("displayName") != null) {
                        String displayName = ValueGetter.getString("displayName", credential);
                        builder.setDisplayName(displayName);
                    }
                    if (credential.get("imageUrl") != null) {
                        String imageUrl = ValueGetter.getString("imageUrl", credential);
                        builder.setImageUrl(imageUrl);
                    }
                    if (credential.get("playerLevel") != null) {
                        int playerLevel = ValueGetter.getInteger("playerLevel", credential);
                        builder.setPlayerLevel(playerLevel);
                    }
                    if (credential.get("signTs") != null) {
                        String signTs = ValueGetter.getString("signTs", credential);
                        builder.setSignTs(signTs);
                    }
                    if (credential.get("autoCreateUser") != null) {
                        autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                        builder.setAutoCreateUser(autoCreateUser);
                    }

                    return builder.build();
                case AGConnectAuthCredential.WeiXin_Provider:
                    String accessTokenWei = ValueGetter.getString("accessToken", credential);
                    String openId = ValueGetter.getString("openId", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);

                    return WeixinAuthProvider.credentialWithToken(accessTokenWei, openId, autoCreateUser);
                case AGConnectAuthCredential.Facebook_Provider:
                    String accessTokenFacebook = ValueGetter.getString("accessToken", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return FacebookAuthProvider.credentialWithToken(accessTokenFacebook, autoCreateUser);
                case AGConnectAuthCredential.Twitter_Provider:
                    String token = ValueGetter.getString("token", credential);
                    String secret = ValueGetter.getString("secret", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return TwitterAuthProvider.credentialWithToken(token, secret, autoCreateUser);
                case AGConnectAuthCredential.WeiBo_Provider:
                    String tokenWeibo = ValueGetter.getString("token", credential);
                    String uid = ValueGetter.getString("uid", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return WeiboAuthProvider.credentialWithToken(tokenWeibo, uid, autoCreateUser);
                case AGConnectAuthCredential.QQ_Provider:
                    String accessTokenQQ = ValueGetter.getString("accessToken", credential);
                    String openIdQQ = ValueGetter.getString("openId", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return QQAuthProvider.credentialWithToken(accessTokenQQ, openIdQQ, autoCreateUser);
                case AGConnectAuthCredential.Google_Provider:
                    String idToken = ValueGetter.getString("idToken", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return GoogleAuthProvider.credentialWithToken(idToken, autoCreateUser);
                case AGConnectAuthCredential.GoogleGame_Provider:
                    String serverAuthCode = ValueGetter.getString("serverAuthCode", credential);
                    autoCreateUser = ValueGetter.getBoolean("autoCreateUser", credential);
                    return GoogleGameAuthProvider.credentialWithToken(serverAuthCode, autoCreateUser);
                default:
                    result.error("","This provider is not supported", new HashMap<>());
                    return null;
            }
    }

    /**
     * Converts a code into a int.
     *
     * @param code: exception code.
     * @return int
     */
    public static int getAuthExceptionCode(int code) {
        switch (code) {
            case NULL_TOKEN:
                return 0;
            case NOT_SIGN_IN:
                return 1;
            case USER_LINKED:
                return 2;
            case USER_UNLINKED:
                return 3;
            case ALREADY_SIGN_IN_USER:
                return 4;
            case EMAIL_VERIFICATION_IS_EMPTY:
                return 5;
            case PHONE_VERIFICATION_IS_EMPTY:
                return 6;
            case INVALID_EMAIL:
                return 7;
            case INVALID_PHONE:
                return 8;
            case GET_UID_ERROR:
                return 9;
            case UID_PRODUCTID_NOT_MATCH:
                return 10;
            case GET_USER_INFO_ERROR:
                return 11;
            case AUTH_METHOD_NOT_SUPPORT:
                return 12;
            case PRODUCT_STATUS_ERROR:
                return 13;
            case PASSWORD_VERIFICATION_CODE_OVER_LIMIT:
                return 14;
            case INVALID_TOKEN:
                return 15;
            case INVALID_ACCESS_TOKEN:
                return 16;
            case INVALID_REFRESH_TOKEN:
                return 17;
            case TOKEN_AND_PRODUCTID_NOT_MATCH:
                return 18;
            case AUTH_METHOD_IS_DISABLED:
                return 19;
            case FAIL_TO_GET_THIRD_USER_INFO:
                return 20;
            case FAIL_TO_GET_THIRD_USER_UNION_ID:
                return 21;
            case ACCESS_TOKEN_OVER_LIMIT:
                return 22;
            case FAIL_TO_USER_LINK:
                return 23;
            case FAIL_TO_USER_UNLINK:
                return 24;
            case ANONYMOUS_SIGNIN_OVER_LIMIT:
                return 25;
            case INVALID_APPID:
                return 26;
            case INVALID_APPSECRET:
                return 27;
            case GET_QQ_USERINFO_ERROR:
                return 28;
            case QQINFO_RESPONSE_IS_NULL:
                return 29;
            case GET_QQ_UID_ERROR:
                return 30;
            case PASSWORD_VERIFY_CODE_ERROR:
                return 31;
            case GOOGLE_RESPONSE_NOT_EQUAL_APPID:
                return 32;
            case SIGNIN_USER_STATUS_ERROR:
                return 33;
            case SIGNIN_USER_PASSWORD_ERROR:
                return 34;
            case PROVIDER_USER_HAVE_BEEN_LINKED:
                return 35;
            case PROVIDER_HAVE_LINKED_ONE_USER:
                return 36;
            case FAIL_GET_PROVIDER_USER:
                return 37;
            case CANNOT_UNLINK_ONE_PROVIDER_USER:
                return 38;
            case VERIFY_CODE_INTERVAL_LIMIT:
                return 39;
            case VERIFY_CODE_EMPTY:
                return 40;
            case VERIFY_CODE_LANGUAGE_EMPTY:
                return 41;
            case VERIFY_CODE_RECEIVER_EMPTY:
                return 42;
            case VERIFY_CODE_ACTION_ERROR:
                return 43;
            case VERIFY_CODE_TIME_LIMIT:
                return 44;
            case ACCOUNT_PASSWORD_SAME:
                return 45;
            case PASSWORD_STRENGTH_LOW:
                return 46;
            case UPDATE_PASSWORD_ERROR:
                return 47;
            case PASSWORD_SAME_AS_BEFORE:
                return 48;
            case PASSWORD_IS_EMPTY:
                return 49;
            case PASSWORD_TOO_LONG:
                return 50;
            case SENSITIVE_OPERATION_TIMEOUT:
                return 51;
            case ACCOUNT_HAVE_BEEN_REGISTERED:
                return 52;
            case UPDATE_ACCOUNT_ERROR:
                return 53;
            case USER_NOT_REGISTERED:
                return 54;
            case VERIFY_CODE_ERROR:
                return 55;
            case USER_HAVE_BEEN_REGISTERED:
                return 56;
            case REGISTER_ACCOUNT_IS_EMPTY:
                return 57;
            case VERIFY_CODE_FORMAT_ERROR:
                return 58;
            case VERIFY_CODE_AND_PASSWORD_BOTH_NULL:
                return 59;
            case SEND_EMAIL_FAIL:
                return 60;
            case SEND_MESSAGE_FAIL:
                return 61;
            case CONFIG_LOCK_TIME_ERROR:
                return 62;

            default:
                return code;
        }
    }
}
