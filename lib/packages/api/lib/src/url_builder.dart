class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://favqs.com/api';

  final String _baseUrl;

  String buildSignInUrl() {
    return '$_baseUrl/sign_in';
  }

  String buildSignOutUrl() {
    return '$_baseUrl/sign_out';
  }

  String buildSignUpUrl() {
    return '$_baseUrl/sign_up';
  }

  String buildUpdateProfileUrl(String username) {
    return '$_baseUrl/users/$username';
  }

  String buildRequestPasswordResetEmailUrl() {
    return '$_baseUrl/users/forgot_password';
  }
}
