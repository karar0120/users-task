class ApiConstants {
  static const String baseUrl = "https://api.petfinder.com/v2/";
  static const String login = "oauth2/token";
  static const String animals = "animals";
  static const String animalsDetails = 'animals/{id}';

  static const String clientId =
      'JwsIhhsuzL7Ga4y7Hkx3YSAVHKzbqsxiHuiXrcHvGi87Vu05Gq';
  static const String clientSecret = 'NgYQmGhwAmD03y9gz4BGe7yxfo0a7zWXVxoYNCP6';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
