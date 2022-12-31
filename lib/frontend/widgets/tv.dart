
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/frontend/description/description3.dart';
import 'package:moviedescription/frontend/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key ?key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Popular TV shows",color: Colors.white,
            size: 26,
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TvDescription(
                            name: tv[index]['name'],
                            banner_url: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                            poster_url: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['poster_path'],
                            Description: tv[index]['overview'],
                            vote: tv[index]['vote_average'].toString(),
                            popularity: tv[index]['popularity'].toString(),
                          ),
                        ));
                    
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height:140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(

                              'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path']

                            ),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: modified_text(text: tv[index]['original_name']!=null?tv[index]['original_name']:'loading',color: Color.fromARGB(255, 190, 213, 55), size: 10,
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
