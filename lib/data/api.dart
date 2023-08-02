import 'package:image_viewer_ca/data/result.dart';
import 'package:image_viewer_ca/model/photo.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class PixabayApi {
  final String baseURL = 'https://pixabay.com/api/';
  final String apiKey = '28767423-2c8cd254bff6a105688b5fb1b';

  Future<Result<List<Photo>>> fetch(String query) async {
    try {
      final response =
          await dio.get('$baseURL?key=$apiKey&image_type=photo&q=$query');

      if (response.statusCode == 200) {
        Map<String, dynamic> result = response
            .data; // if http library called => response.body(type is String)

        Iterable hits = result['hits'];
        return Result.success(hits.map((e) => Photo.fromJson(e)).toList());
      } else {
        return Result.error('사진 로드 실패');
      }
    } catch (e) {
      return Result.error('인터넷 환경이 좋지 않음');
    }
  }
}
