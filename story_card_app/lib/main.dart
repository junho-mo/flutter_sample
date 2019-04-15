import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'data.dart';
import 'cardScroll.dart';

void main() => runApp(MaterialApp(
  home:MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;    // data.dart 배열

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
       currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(    // 배경색 지정
        gradient: LinearGradient(
          colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(            // 상단 1번째 
                padding: const EdgeInsets.only(
                  left: 12.0, right:12.0, top:30.0,bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(           // [좌측] 햄버거 아이콘
                        icon: Icon(
                          CustomIcons.menu,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(       // [우측] 검색 아이콘
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
              ),
              Padding(            // 상단 2번째
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Frameworks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                      IconButton(       // [우측] ... 아이콘
                        icon: Icon(
                          CustomIcons.option,
                          size: 12.0,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                  ],
                ),
              ),
              Padding(          // 상단 3번째
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                            child: Text("Lunched",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Text("25+ Companies",
                      style: TextStyle(color: Colors.blueAccent,))
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),    // cardScroll.dart 
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context,index) {
                        return Container();
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      
      
    );
  }
}