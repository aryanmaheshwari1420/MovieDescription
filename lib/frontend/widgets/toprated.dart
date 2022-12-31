
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/frontend/description/description2.dart';
import 'package:moviedescription/frontend/utils/text.dart';

class TopratedMovies extends StatelessWidget {
  final List toprated;
  const TopratedMovies({Key ?key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Top rated Movies",color: Colors.white,
            size: 26,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopratedDescription(
                            name: toprated[index]['original_name'],
                            banner_url: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['backdrop_path'],
                            poster_url: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['poster_path'],
                            Description: toprated[index]['overview'],
                            vote: toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'],
                          ),
                        ));
                    
                  },
                  child: Container(
                    width: 150,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: NetworkImage(

                              'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']

                            ))
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: modified_text(text: toprated[index]['title']!=null?toprated[index]['title']:'loading',color: Color.fromARGB(255, 190, 213, 55), size: 10,
                          ),

                        )
                      ],
                    ),
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
