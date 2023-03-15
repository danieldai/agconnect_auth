/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */


enum AuthExceptionCode {
  /// AccessToken为空;建议重新登录
  nullToken,

  /// 未登录时获取AccessToken信息
  notSignIn,

  /// 用户已经关联此Provider
  userLinked,

  /// 用户未关联此Provider
  userUnlinked,

  /// 已经登录过一个用户，在未登出情况登录账户
  alreadySignInUser,

  /// 邮件验证码为空
  emailVerificationIsEmpty,

  /// 电话验证码为空
  phoneVerificationIsEmpty,

  /// 输入的邮件地址不合法
  invalidEmail,

  /// 输入的手机号码不合法
  invalidPhone,

  /// 获取用户id失败
  getUidError,

  /// 用户id和产品id不匹配
  uidProductIDNotMatch,

  /// 获取用户信息失败
  getUserInfoError,

  /// 当前Auth微服务部署了4个局点，每个局点支持的认证方式不同
  authMethodNotSupport,

  /// 产品没有开通认证服务
  productStatusError,

  /// 密码验证码次数超过限制
  passwordVerificationCodeOverLimit,

  /// Client Token 不可用
  invalidToken,

  /// Access Token 不可用
  invalidAccessToken,

  /// Refresh Token 不可用
  invalidRefreshToken,

  /// Token和Product Id不匹配
  /// 建议检查agconnect-services文件是否与平台上申请的信息一致
  tokenAndProductIdNotMatch,

  /// 不支持的认证方式
  /// 建议检查平台是否开启对应认证方式，例如检查是否开启支持Facebook登录
  authMethodIsDisabled,

  /// 获取第三方用户信息失败
  failToGetThirdUserInfo,

  /// 获取第三方Union id失败
  failToGetThirdUserUnionId,

  /// AccessToken数量超过了限定数量
  accessTokenOverLimit,

  /// link用户失败
  failToUserLink,

  /// unlink用户失败
  failToUserUnlink,

  /// 匿名用户登录超过限制
  anonymousSigninOverLimit,

  /// appid 不可用
  invalidAppID,

  /// app secret 不可用
  invalidAppSecret,

  /// 获取qq 第三方用户信息失败
  getQQUserInfoError,

  /// 获取QQInfo 返回为空
  qqInfoResponseIsNull,

  /// 获取QQ uid 返回为空
  getQQUidError,

  /// 密码和验证码错误
  passwordVerifyCodeError,

  /// GOOGLE返回信息与appid不匹配
  GoogleResponseNotEqualAppID,

  /// 用户被CP停用
  signInUserStatusError,

  /// 用户密码错误
  signInUserPasswordError,

  /// 提供者已经被其他用户绑定
  providerUserHaveBeenLinked,

  /// 账号中该提供者类型已经被绑定过
  providerHaveLinkedOneUser,

  /// 获取提供者用户失败
  FailGetProviderUser,

  /// 不能对单一的提供者做unlink操作
  CannotUnlinkOneProviderUser,

  /// 在发送间隔内发送验证码
  verifyCodeIntervalLimit,

  /// 验证码为空
  verifyCodeEmpty,

  /// 验证码发送语言为空
  verifyCodeLanguageEmpty,

  /// 验证码接收器为空
  verifyCodeReceiverEmpty,

  /// 验证码类型为空
  verifyCodeActionError,

  /// 验证码发送次数超过限制;建议一个小时后在尝试
  verifyCodeTimeLimit,

  /// 用户名密码一致
  accountPasswordSame,

  /// 密码强度太低
  passwordStrengthLow,

  /// 更新密码失败
  updatePasswordError,

  /// 密码与老密码相同
  passwordSameAsBefore,

  /// 密码为空
  passwordIsEmpty,

  /// 密码太长
  passwordTooLong,

  /// 敏感操作的最近登录时间超时
  sensitiveOperationTimeout,

  /// 账号已经被注册
  accountHaveBeenRegistered,

  /// 更新账号失败
  updateAccountError,

  /// 用户没有注册
  userNotRegistered,

  /// 验证码错误
  verifyCodeError,

  /// 用户已经被注册
  userHaveBeenRegistered,

  /// 注册账号为空
  registerAccountIsEmpty,

  /// 验证码格式错误
  verifyCodeFormatError,

  /// 验证码和密码都为空
  verifyCodeAndPasswordBothNull,

  /// 发送邮件失败
  sendEmailFail,

  /// 发送短信失败
  sendMessageFail,

  /// 配置密码/验证码最大尝试次数/冻结时常错误
  configLockTimeError,
}

class AGCAuthException implements Exception {
  AGCAuthException(int? code, int? exceptionCode, String? message) {
    this.code = code;
    if (exceptionCode != null &&
        exceptionCode >= 0 &&
        exceptionCode < AuthExceptionCode.values.length) {
      this.exceptionCode = AuthExceptionCode.values[exceptionCode];
    }
    this.message = message;
  }

  /// 错误码
  int? code;

  /// 错误码枚举
  AuthExceptionCode? exceptionCode;

  /// 错误描述
  String? message;

  @override
  String toString() {
    return "AGCAuthException code: ${exceptionCode != null ? exceptionCode : code}, message: $message.";
  }
}
