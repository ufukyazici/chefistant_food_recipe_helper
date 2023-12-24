import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  OnBoardCubit() : super(OnBoardInitial());
}
