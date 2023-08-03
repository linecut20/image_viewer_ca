import 'package:image_viewer_ca/data/api.dart';
import 'package:image_viewer_ca/data/result.dart';
import 'package:image_viewer_ca/model/photo.dart';

class GetPhotosUseCase {
  late final PixabayApi api;

  GetPhotosUseCase(this.api);

  Future<Result<List<Photo>>> execute(String query) async {
    return await api.fetch(query);
  }
}
