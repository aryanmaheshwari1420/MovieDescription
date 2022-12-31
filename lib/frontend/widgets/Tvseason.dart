// // @dart = 2.9

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:movierecommend/description/description3.dart';
// import 'package:movierecommend/description/description4.dart';
// import 'package:movierecommend/utils/text.dart';

// class TVSeason extends StatelessWidget {
//   final List tvseason;
//   const TVSeason({Key key, this.tvseason}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           modified_text(
//             text: "Popular TVSeason shows",color: Colors.white,
//             size: 26,
//           ),
//           SizedBox(height: 10,),
//           Container(
//             height: 200,
//             child: 
//             ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                      Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TVSeasonDescription(
//                             name: tvseason[index]['name'],
//                             banner_url: 'https://image.tmdb.org/t/p/w500' +
//                                 tvseason[index]['backdrop_path'],
//                             poster_url: 'https://image.tmdb.org/t/p/w500' +
//                                 tvseason[index]['poster_path'],
//                             Description: tvseason[index]['overview'],
//                             vote: tvseason[index]['vote_average'].toString(),
//                             popularity: tvseason[index]['popularity'].toString(),
//                           ),
//                         ));
                    
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     width: 250,
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 250,
//                           height:140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             image: DecorationImage(
//                               image: NetworkImage(

//                               'https://image.tmdb.org/t/p/w500'+tvseason[index]['backdrop_path']

//                             ),fit: BoxFit.cover)
//                           ),
//                         ),
//                         SizedBox(height: 10,),
//                         Container(
//                           child: modified_text(text: tvseason[index]['original_name']!=null?tvseason[index]['original_name']:'loading',color: Color.fromARGB(255, 190, 213, 55),
//                           ),

//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
