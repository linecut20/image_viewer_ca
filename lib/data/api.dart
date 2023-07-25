import 'package:image_viewer_ca/model/photo.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class PixabayApi {
  static const String baseURL = 'https://pixabay.com/api/';
  static const String apiKey = '28767423-2c8cd254bff6a105688b5fb1b';

  static Future<List<Photo>> photoCardFetch(String query) async {
    final response =
        await dio.get('$baseURL?key=$apiKey&image_type=photo&q=$query');

    if (response.statusCode == 200) {
      Map<String, dynamic> result = response
          .data; // if http library called => response.body(type is String)

      Iterable hits = result['hits'];
      return hits.map((e) => Photo.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
