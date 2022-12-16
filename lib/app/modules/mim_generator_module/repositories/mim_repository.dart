import 'package:dio/dio.dart';
import 'package:mim_generator/app/data/models/mim_model.dart';
import 'package:mim_generator/app/data/providers/api.dart';
import 'package:mim_generator/app/data/services/http_request.dart';

class MimRepository {
  late Response response;
  HttpRequest request = HttpRequest();
  
  Future<MimModel> getList () async {
    try {
      response = await request.dio.get(
        '/get_memes',
      );
      MimModel mimModel = MimModel.fromJson(response.data);
      return mimModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> postMim (String filePath) async {
    try {
      response = await request.dio.post(
        '/1/upload?key=${Api.imgbbKey}',
        options: Options(
          headers: {
            "customUrl": Api.baseUrlImgbb,
          },
        ),
        data: FormData.fromMap({
          "image": await MultipartFile.fromFile(filePath),
        }),
      );
      return response.data["data"]["url_viewer"];
    } catch (e) {
      rethrow;
    }
  }
}