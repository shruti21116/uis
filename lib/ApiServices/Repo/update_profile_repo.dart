import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/update_profile_response_model.dart';

class UpdateProfileRepo {
  static Future<UpdateProfileResponseModel> updateProfileRepo(
      String userid, String formId,Map<String,dynamic> body) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: '${ApiRoutes.updateform}/$userid/$formId',body: body);

    UpdateProfileResponseModel updateProfileResponseModel =
        UpdateProfileResponseModel.fromJson(response);

    return updateProfileResponseModel;
  }
}
