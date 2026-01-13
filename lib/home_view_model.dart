import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_practice_1/matzip_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  // 여기에 맛집 리스트
  final List<Matzip> matzipList;
  HomeState({required this.matzipList});
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  // 빌드 한번만 실행됨?
  HomeState build() {
    // 작동하는 지 확인
    print('뷰모델 빌드 호출됨');
    getData();
    return HomeState(matzipList: []);
  }

  void getData() async {
    // 여기서 Firestore 데이터 가져와서 Matzip리스트로 변환한 뒤
    // 상태 업데이트!
    final repo = MatzipRepository();
    final matzipList = await repo.getAllMatzip();
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
