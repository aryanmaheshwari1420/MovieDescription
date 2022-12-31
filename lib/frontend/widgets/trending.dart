
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/frontend/description/description.dart';
import 'package:moviedescription/frontend/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key ?key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Trending Movies",
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrendingDescription(
                            name: trending[index]['title'],
                            banner_url: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            poster_url: 'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            Description: trending[index]['overview'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_on: trending[index]['release_date'],
                          ),
                        ));
                  },
                  child:

                   trending[index]['title'] !=null?Container(
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: modified_text(
                            text: trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'loading',
                            color: Color.fromARGB(255, 190, 213, 55), size: 10,
                          ),
                        )
                      ],
                    ),
                  ):Container(
                    child: Center(child: Text("Not available")),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
