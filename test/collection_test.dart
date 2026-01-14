import 'dart:convert';

import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_test/flutter_test.dart';

final jsonData = """
[
  {
    "상호명": "진미평양냉면",
    "주소": "서울특별시 강남구 학동로 305-3",
    "평점": "4.5"
  },
  {
    "상호명": "우래옥",
    "주소": "서울특별시 중구 창경궁로 62-29",
    "평점": "4.8"
  },
  {
    "상호명": "툇마루",
    "주소": "강원도 강릉시 난설헌로 232",
    "평점": "4.3"
  }
]
""";

void main() {
  test('컬렉션 메서드 테스트', () {
    // 1. Map으로 바꿔줌
    List<dynamic> box = jsonDecode(jsonData);

    // 2. 객체로 바꾸기
    List<Matzip> matzipList = [];
    for (var i = 0; i < box.length; i++) {
      Map<String, dynamic> e = box[i];
      Matzip m = convertMatzip(e);
      matzipList.add(m);
    }
    print(matzipList.length);
    // collection 메서드
    List<Matzip> matzipList2 = box.map((e) {
      return Matzip.fromJson(e);
    }).toList();
  });
}

Matzip convertMatzip(dynamic e) {
  Matzip m = Matzip.fromJson(e);
  return m;
}
