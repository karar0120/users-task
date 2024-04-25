import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:users_tasks/core/helper/shared_preferences.dart';
import 'package:users_tasks/core/networking/api_error_handler.dart';
import 'package:users_tasks/core/networking/api_result.dart';
import 'package:users_tasks/core/networking/api_service.dart';
import 'package:users_tasks/core/networking/netwotk_info.dart';
import 'package:users_tasks/features/login/data/models/login_request_body.dart';
import 'package:users_tasks/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;
  LoginRepo(this._apiService, this._appPreferences, this._networkInfo);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<ApiResult<User?>?> loginWithGoogle() async {
    if (await _networkInfo.isConnected) {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          final UserCredential authResult =
              await _auth.signInWithCredential(credential);
          final User? user = authResult.user;
          print('User ${user?.displayName} logged in with google');
          return ApiResult.success(user);
        }
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
    return null;
  }

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.login(
          LoginRequestBody(
              name: loginRequestBody.name, job: loginRequestBody.job),
        );
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }
}
