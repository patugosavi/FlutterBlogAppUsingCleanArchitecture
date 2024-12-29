import 'package:blogapp/data/models/message_model.dart';
import 'package:blogapp/presentation/screens/auth/login/login_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModel> userLogin(String email, String password, context) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.login, body: body);

      if (response.statusCode == 200) {
        ////first solution
        // final responseData = tagsModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);

        ///second solution
        final responseData = LoginModel.fromJson(response.data);
        return responseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      LoginModel();
    }
    return LoginModel();
  }

  Future<MessageModel> userLogout(context) async {
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.logout, isTokenRequired: true);

      if (response.statusCode == 200) {
        ////first solution
        // final responseData = tagsModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);

        ///second solution
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
      MessageModel();
    }
    return MessageModel();
  }
}
