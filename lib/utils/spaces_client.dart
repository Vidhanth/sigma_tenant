import 'package:dio/dio.dart';
import 'package:sigma_tenant/models/space.dart';

class SpacesClient {
  static const _api = 'https://sigmatenant.com/mobile/tags';

  static final _dio = Dio();

  static Future<List<Space>> getAllSpaces() async {
    List<Space> spacesList = [];

    final Response response = await _dio.get(_api);

    if (response.statusCode == 200) {
      for (var rawSpace in response.data['tags']) {
        Space space = Space(
          id: rawSpace['_id'],
          displayName: rawSpace['displayName'] ?? '',
          meta: rawSpace['meta'] ?? '',
          description: rawSpace['description'] ?? '',
        );
        spacesList.add(space);
      }
    } else {
      throw Exception('There was an error fetching the data.');
    }

    return spacesList;
  }
}
