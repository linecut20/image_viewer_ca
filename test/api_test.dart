import 'package:flutter_test/flutter_test.dart';
import 'package:image_viewer_ca/data/api.dart';

void main() {
  test('Pixabay 데이터 호출 테스트', () async {
    final api = PixabayApi();

    final result = await api.fetch('bbc');

    expect(result.first.id, 410303);
  });
}
