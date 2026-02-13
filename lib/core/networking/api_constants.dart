class ApiConstants {
  static const String baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent";
  static const String apiKey = "AIzaSyDeF_TLFDJzo6IlO-I_7NilBq7GK7gBeYQ";
  static const String key = "x-goog-api-key";

}




class ApiErrors {
  // Client Side / Request Errors
  static const String badRequestError = "badRequestError"; // 400
  static const String unauthorizedError = "unauthorizedError"; // 401
  static const String forbiddenError = "forbiddenError"; // 403
  static const String notFoundError = "notFoundError"; // 404
  static const String conflictError = "conflictError"; // 409

  // Gemini Specific Errors
  static const String rateLimitError = "rateLimitError"; // 429
  static const String safetyBlockError = "safetyBlockError";
  static const String invalidSignature = "invalidSignature";

  // Server Side Errors
  static const String internalServerError = "internalServerError"; // 500
  static const String serviceUnavailable = "serviceUnavailable"; // 503: Model overloaded

  // Connectivity & App Errors
  static const String noInternetError = "noInternetError";
  static const String timeoutError = "timeoutError";
  static const String cacheError = "cacheError";
  static const String unknownError = "unknownError";
  static const String defaultError = "defaultError";

  // UI States
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
  static const String noContent = "noContent";
}