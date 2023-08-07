import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/history_response_model.dart';

class GetHistory {
  static Future<HistoryResponseModel> getHistory(String userid) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aGet, url: "${ApiRoutes.history}/$userid");

    HistoryResponseModel historyResponseModel =
        HistoryResponseModel.fromJson(response);

    return historyResponseModel;
  }
}
