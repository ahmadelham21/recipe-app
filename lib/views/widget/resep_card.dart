import 'package:flutter/material.dart';
import 'package:flutter_resep_app/views/detail_video.dart';

class ResepCard extends StatelessWidget {
  final String title;
  final String rating;
  final String coookctime;
  final String thumbnailUrl;
  final String videoUrl;

  const ResepCard(
      {required this.title,
      required this.rating,
      required this.coookctime,
      required this.thumbnailUrl,
      required this.videoUrl  
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.9),
                offset: Offset(0.0, 0.10),
                blurRadius: 10.0,
                spreadRadius: -6.0)
          ],
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.multiply),
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 19),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: videoUrl != 'Video Not Found' ? true : false,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: 
                          (context) => DetailVideo(videoUrl: videoUrl,)
                        ))
                      },
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow, color: Colors.yellowAccent, size: 20),
                          SizedBox(width: 8),
                          Text("Play Video")
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.timelapse_rounded, color: Colors.yellowAccent, size: 20),
                      SizedBox(width: 8),
                      Text(coookctime)
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          )
        ],
      ),
    );
  }
}
