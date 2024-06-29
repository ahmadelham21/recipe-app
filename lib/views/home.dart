import 'package:flutter/material.dart';
import 'package:flutter_resep_app/model/resep.api.dart';
import 'package:flutter_resep_app/model/resep.dart';
import 'package:flutter_resep_app/views/detail_resep.dart';
import 'package:flutter_resep_app/views/widget/resep_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ambil data
  late List<Resep> _resep;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getResep();
  }

  Future<void> getResep() async {
      
    _resep = await ResepApi.getResep();
    if(mounted){
    setState(() {
      _isLoading = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(Icons.restaurant),
        //       SizedBox(width: 10),
        //       Text("Resep Makanan")
        //     ],
        //   ),
        // ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _resep.length,
                itemBuilder: (content, index) {
                  return GestureDetector(
                    child: ResepCard(
                      title: _resep[index].name,
                      coookctime: _resep[index].totalTime,
                      rating: _resep[index].rating.toString(),
                      thumbnailUrl: _resep[index].images,
                      videoUrl: _resep[index].videoUrl,
                      ),
                      onTap: () => {
                        Navigator.push(
                          context, MaterialPageRoute(builder: 
                            (context) => DetailResep(
                              name: _resep[index].name,
                              totalTime: _resep[index].totalTime,
                              rating: _resep[index].rating.toString(),
                              images: _resep[index].images,
                              description: _resep[index].description,
                              videoUrl: _resep[index].videoUrl,
                              instructions: _resep[index].instructions,
                              sections: _resep[index].sections,
                              ),
                            ),)
                      },
                    
                  );
                },
              ));
  }
}
