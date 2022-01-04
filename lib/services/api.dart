import 'dart:convert';
import 'dart:io';

final String urlBase = "https://10.0.2.2:4001/";

class API {
  Future<String> sendRequestPost(String method, Map _body) async {
    var url = urlBase + method;

    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(_body)));
    HttpClientResponse response = await request.close();

    print("response ↓");
    print(response.statusCode);
    print(response.statusCode.runtimeType);

    String jsonStringResponse = await response.transform(utf8.decoder).join();
    print("jsonStringResponse ↓");

    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }

    return jsonStringResponse;
  }
}
