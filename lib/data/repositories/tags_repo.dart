import 'package:blogapp/data/models/message_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/tags/tags_model.dart';
import '../data_sources/remote/api_client.dart';
import '../data_sources/remote/api_endpoint_urls.dart';

class TagsRepo extends ApiClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.tags);

      if (response.statusCode == 200) {
        ////first solution
        // final responseData = tagsModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);

        ///second solution
        final responseData = TagsModel.fromJson(response.data);
        return responseData;
      } else {
        TagsModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      TagsModel();
    }
    return TagsModel();
  }

  Future<MessageModel> addNewTags(String title, String slug) async {
    Map body = {
      "title": title,
      "slug": slug,
    };
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.addTags, body: body, isTokenRequired: true);

      if (response.statusCode == 200) {
        ////first solution
        // final responseData = MessageModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);

        ///second solution
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }
    return MessageModel();
  }

  Future<MessageModel> updateTags(String id, String title, String slug) async {
    Map body = {
      "id": id,
      "title": title,
      "slug": slug,
    };
    try {
      final response = await postRequest(
          path: ApiEndpointUrls.updateTags, body: body, isTokenRequired: true);

      if (response.statusCode == 200) {
        ////first solution
        // final responseData = MessageModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);

        ///second solution
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }
    return MessageModel();
  }

  Future<MessageModel> deleteTags(String id) async {
    try {
      final response = await postRequest(
          path: "${ApiEndpointUrls.deleteTags}/$id", isTokenRequired: true);

      if (response.statusCode == 200) {
        ////first solution
        // final responseData = MessageModelFromJson(jsonEncode(response.data));
        // Vx.log(responseData);

        ///second solution
        final responseData = MessageModel.fromJson(response.data);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      Vx.log(e);
      MessageModel();
    }
    return MessageModel();
  }
}
