import 'package:flutter/material.dart';
import 'package:flutter_practice_1/big_album.dart';
import 'package:flutter_practice_1/mini_album.dart';
import 'package:flutter_practice_1/rounded_image.dart';
import 'package:flutter_practice_1/title_row.dart';
// 1. 일단 'Scaffold' 안에서 작업
// 2. 완성되면 위젯클래스로 분리
// 3. 위젯클래스를 별도의 파일로 분리
// 4. Scaffold에 위젯 배치
// 5. 변경되어야 하는 부분들 속성으로 정의해서 수정!

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            // 상단이미지
            //
            AspectRatio(
              // 가로크기 / 세로크기
              aspectRatio: 2.5 / 1,
              child: RoundedImage(imageUrl: 'https://picsum.photos/300/200'),
            ),
            // 제목행
            TitleRow(title: "New Albums"),
            Row(
              children: [
                BigAlbum(
                  imageUrl: 'https://picsum.photos/id/98/200/200',
                  title: 'Open',
                  artist: 'Silk sonic',
                ),
                BigAlbum(
                  imageUrl: 'https://picsum.photos/id/190/200/200',
                  title: 'PPIP',
                  artist: '파인애플',
                ),
                BigAlbum(
                  imageUrl: 'https://picsum.photos/id/980/200/200',
                  title: 'NO Pain',
                  artist: '실리카겔',
                ),
              ],
            ),
            // 제목행
            TitleRow(title: "Song List"),
            //  작은앨범들어가는 로우
            MiniAlbum(
              imageUrl: 'https://picsum.photos/id/222/200/200',
              title: 'fufu UUJ',
              artist: 'Fifi',
            ),
            MiniAlbum(
              imageUrl: 'https://picsum.photos/id/223/200/200',
              title: 'Ohoh',
              artist: 'Nono',
            ),
            MiniAlbum(
              imageUrl: 'https://picsum.photos/id/211/200/200',
              title: 'dodi',
              artist: 'opio',
            ),
          ],
        ),
      ),
      //
    );
  }

  AppBar homeAppBar() {
    return AppBar(
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
    );
  }
}

extension DoubleExt on double {
  //
  Widget get w {
    return SizedBox(width: this);
  }

  Widget get h {
    return SizedBox(height: this);
  }
}

extension IntExt on double {
  // getter => 파라미터 없는 함수에서 괄호 생략!
  Widget get w {
    return SizedBox(width: this);
  }

  Widget get h {
    return SizedBox(height: this);
  }
}
