class Urls {
  static const _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String sendEmailOtp(email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(email, otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static const readProfile = '$_baseUrl/ReadProfile';
  static const completeProfile = '$_baseUrl/CreateProfile';
}
