import 'package:get_storage/get_storage.dart';

class LanguageCacheDataSource {
  final box = GetStorage();
  final key = 'language';

  Future<void> setData(String value) {
    return box.write(key, value);
  }

  String? getData() {
    final data = box.read(key);
    return data;
  }
}