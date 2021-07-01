import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HakkimizdaScreen extends StatefulWidget {
  const HakkimizdaScreen({Key? key}) : super(key: key);

  @override
  _HakkimizdaScreenState createState() => _HakkimizdaScreenState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _HakkimizdaScreenState extends State<HakkimizdaScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: "1oF3pI5umck",
        flags: YoutubePlayerFlags(mute: true, autoPlay: false));

    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkımızda"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Container(
                  height: size.height * 0.27,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.18,
              width: size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
              child: Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text("Lorem Ipsum is simply dummy text",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source."),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text("Lorem Ipsum is simply dummy text",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }
}
