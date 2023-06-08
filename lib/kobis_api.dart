import 'dart:convert';
import 'package:http/http.dart' as http;

class KobisApi {
  var key = '883d6f8d0a2cc7e4c4f3af62430196be';
  dynamic getMovie({required String toDate}) async {
    String site =
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$key&targetDt=$toDate';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      try {
        var movies = jsonDecode(response.body)['boxOfficeResult']
            ['dailyBoxOfficeList'] as List<dynamic>;
        return movies;
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}
