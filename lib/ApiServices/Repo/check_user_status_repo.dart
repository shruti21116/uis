import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/check_user_response_model.dart';


class GetUserStatusRepo {
  static Future<CheckUserResponseModel> getUserStaus(String userid) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aGet, url: '${ApiRoutes.checkUserStatus}/$userid',);

    CheckUserResponseModel checkUserResponseModel =CheckUserResponseModel.fromJson(response);
    return checkUserResponseModel;
  }
}
