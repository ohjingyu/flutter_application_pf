import 'package:flutter/material.dart';
import 'package:flutter_application_pf/movie_detail.dart';

class Movie_Form extends StatelessWidget {
  Map<String, dynamic> movie;

  Movie_Form({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    /* var posters = movie['posters'].toString().isEmpty
        ? Image.asset('assets/images/no_image.png')
        : Image.network(movie['posters'].split('|')[0]); */
    var movieTitle = movie['movieNm'];
    var movieAmt = movie['salesAmt'];
    var movieRan2 = movie['rankOldAndNew'];
    var movieCt = movie['showCnt'];
    var movieDt = movie['openDt'];

    //MovieApi movieApi = MovieApi();
    //var movies = movieApi.searchDetail(moviecode: movie['movieCd'].toString());
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetail(movieCd: movie['movieCd'].toString())));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          width: double.infinity,
          height: 200,
          child: Row(
            children: [
              const SizedBox(
                width: 200,
                //"http://file.koreafilm.or.kr/thm/02/00/03/23/tn_DPF010774.JPG"
                child: SizedBox(
                  child: Text('그림을 찾을수 없습니다.'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$movieTitle',
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                    Text(
                        '$movieDt'
                            .toString()
                            .split(' ')[0]
                            .replaceAll('-', '/'),
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    Text('신규개봉 or 옛날영화 : $movieRan2',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    Text('영화 상영횟수 : $movieCt 번',
                        style: TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
