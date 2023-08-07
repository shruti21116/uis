import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/profile_response_model.dart';

class GetProfileRepo {
  static Future<ProfileResponseModel> getProfileRepo(String userid) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aGet, url: "${ApiRoutes.getupdate}/$userid");
    ProfileResponseModel profileResponseModel =
        ProfileResponseModel.fromJson(response);
    return profileResponseModel;
  }
}
