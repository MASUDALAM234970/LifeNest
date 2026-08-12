class Endpoints {
  Endpoints._();

  // base url
  //static const baseUrl = "192.168.0.109:8000";
  //static const baseUrl = "http://192.168.0.103:8000";
  static const baseUrl = "https://lifenestbackend-production.up.railway.app";

  // ---------------- Auth ----------------
  static const signup = "/api/users/signup/";
  static const login = "/api/users/login/";
  static const firebaseAuth = "/api/users/firebase-auth/";
  static const logout = "/api/users/logout/";

  // ---------------- Tokens ----------------
  static const tokenRefresh = "/api/users/token/refresh/";
  static const tokenVerify = "/api/users/token/verify/";

  // ---------------- Profile ----------------
  static const profile = "/api/users/profile/";

  // ---------------- Password ----------------
  static const passwordChange = "/api/users/password-change/";
  static const passwordReset = "/api/users/password-reset/";
  static const passwordResetOtpVerify = "/api/users/password-reset-otp-verify/";
  static const passwordResetConfirm = "/api/users/password-reset-confirm/";

  // ---------------- OTP ----------------
  static const resendOtp = "/api/users/resend-otp/";
  static const verifyOtp = "/api/users/verify-otp/";

  // ---------------- Account ----------------
  static const accountDelete = "/api/users/account-delete/";

  // ---------------- Schema ----------------
  static const schema = "/api/schema/";

  //--------------Chat api views----------------

  static const chatbot = "/api/chatbot/chat/";

  //----------------- music-----------------
  static const musicList = "/api/music/list/";
  static const musicById = "/api/music";

  //google In

}
