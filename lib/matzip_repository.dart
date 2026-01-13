import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_practice_1/matzip.dart';

class MatzipRepository {
  // 파이어스토어에서 맛집 가져와서 맛집리스트로 변환해서 전달
  // 데이터 가져올 때는 비동기 사용
  Future<List<Matzip>> getAllMatzip() async {
    print('겓올맛집 호출됨');

    // 컬렉션 모든 문서들 가져오기
    final colRef = FirebaseFirestore.instance.collection('matjip');

    // List -> Map
    // 맛집리스트로 변환??
    // 맛집리스트 반환
    return [];
  }
}
