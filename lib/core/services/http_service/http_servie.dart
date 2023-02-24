import 'package:http/http.dart' as http;
import 'package:pockdex/core/services/http_service/http_service_interface.dart';

class HttpService implements IHttpService {
  final client = http.Client();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));

    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
