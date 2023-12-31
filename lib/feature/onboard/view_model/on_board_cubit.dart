import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  OnBoardCubit() : super(const OnBoardState());
  void incrementPageIndex() {
    _isLastIndex(state.pageIndex + 1);
  }

  void _isLastIndex(int index) {
    if (index < 2) {
      emit(state.copyWith(pageIndex: index));
    } else if (index == 2) {
      emit(state.copyWith(pageIndex: index, isLastIndex: true));
    }
  }
}
