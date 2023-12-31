part of 'on_board_cubit.dart';

class OnBoardState extends Equatable {
  const OnBoardState({this.pageIndex = 0, this.isLastIndex = false});
  final int pageIndex;
  final bool isLastIndex;

  @override
  List<Object> get props => [pageIndex, isLastIndex];

  OnBoardState copyWith({
    int? pageIndex,
    bool? isLastIndex,
  }) {
    return OnBoardState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLastIndex: isLastIndex ?? this.isLastIndex,
    );
  }
}
