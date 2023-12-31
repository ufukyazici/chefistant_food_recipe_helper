import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  OnBoardCubit() : super(const OnBoardState());
  void incrementPageIndex() {
    if (!_isLastIndex) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1));
    } else {
      emit(state.copyWith(pageIndex: state.pageIndex + 1, isLastIndex: true));
    }
  }

  bool get _isLastIndex => state.pageIndex + 1 == 2;
}
