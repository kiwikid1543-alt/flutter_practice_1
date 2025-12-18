import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

///- ListView
///SingleChildScrollView => 자녀 위젯이 많으면 사용 X
///    - ClipRRect : 자녀위젯 그냥 잘라줌
///        - Image
///    - Row (제목행 이라고 부르자!)(TODO 간격 구현하면서 고민!)
///        - Text
///        - Text
///
///    - Row
///        - Column (큰앨법 이라고 부르자!)
///            - ClipRRect
///                - Image
///            - Text
///            - Text
///        - 큰앨범
///        - 큰앨범
///    - 제목행
///    - Row (작은앨범 이라고 부르자!)
///        - ClipRRect
///            - Image
///        - Column
///            - Text
///            - Text
///        - Icon
///    - 작은앨범
///    - 작은앨범

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 40,
            height: 40,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // 컨테이너 사용시 컬러와 데코레이션 동시에 사용x, 데코레이션 안에 컬러를 넣거나?,
              color: Colors.black,
            ),
            child: Icon(Icons.search, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
        // title 속성은 안드로이들에서 왼쪽 기본
        // 아이폰에서는 가운데 기본
        // 그걸 하나로 통일시켜주는게 centerTitle 속성
        // actions에 위젯 배치되면 왼쪽으로 바뀜
        // centerTitle: false, 주게되면 왼쪽으로 가지만
        // title이 Column 을 배치하면 Column 크기가 앱바 영역전체를
        // 차지하기 때문에 무용지물
        // 이럴 땐 Column의 CrossAixsAlignment 속성으로 조정
        // Column과 Row의 CrossAixsAlignment 기본값은 가운데
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Music",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: 3),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      //
    );
  }
}
