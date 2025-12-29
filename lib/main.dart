import 'package:flutter/material.dart';
import 'package:flutter_practice_1/my_text_box.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

// SingleChhildScrollview +Column
// ListView 기본 생성자
// ListView.builder 네임드 생성자

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < 100; i++) {
      children.add(MyTextBox(text: "$i번째 박스"));
    }

    return Scaffold(
      appBar: AppBar(title: Text("리스트뷰 스터디")),
      // SingleChildScrollView : 생성자 100번 호출, 빌드 100번 호출
      // SingleChildScrollView(child: Column(children: children)),
      //
      // ListView 기본생성자 : 생성자 100번 호출, 빌드 10번 호출  (빌드:위젯 그리는 연산 )
      // 보여지는 것만 그림! 스크롤했을 때 즉각 보일 수 있게 보이는 거 + 몇개 더 그림!
      //
      // body: ListView(children: children),
      // ListView.builder 생서자 : 생성자 10번 호출, 빌드 10번 호출
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          //
          return MyTextBox(text: "$index번째 박스");
        },
      ),
    );
  }
}
