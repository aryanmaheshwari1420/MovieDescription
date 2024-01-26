
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moviedescription/frontend/utils/text.dart';

class TrendingDescription extends StatelessWidget {
  final String name,Description, banner_url, poster_url, vote, launch_on;
  const TrendingDescription(
      {Key ?key,
      required this.name,
      required this.Description,
      required this.banner_url,
      required this.poster_url,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(banner_url,fit: BoxFit.cover,),
                )),
                Positioned(
                  bottom: 10,
                  child: modified_text(text: '  ⭐ Average Rating : '+ vote,size: 18,color: Colors.white60,))
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(padding: EdgeInsets.all(10),
          // ignore: unnecessary_null_comparison
          child: modified_text(text: name!=null?name:'Not available',size: 24,color: Colors.white,
          ),
          ),
          Container(padding: EdgeInsets.only(left:10),
          child: modified_text(text: "Released On  :"+launch_on,size: 14,color: Colors.white,),),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(poster_url),
              ),
              Flexible(
                child: Container(
                  child: modified_text(text:"Overview :\n"+ Description,size: 17,color: Colors.white,),
                ),
              )
            ],
          )
        

        ],
        ),
      ),
    );
  }
}
