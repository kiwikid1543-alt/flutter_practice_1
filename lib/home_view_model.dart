import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  // 여기에 맛집 리스트
  final List<Matzip> matzipList;
  HomeState({required this.matzipList});
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    // 작동하는 지 확인
    print('뷰모델 빌드 호출됨');
    return HomeState(matzipList: []);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
