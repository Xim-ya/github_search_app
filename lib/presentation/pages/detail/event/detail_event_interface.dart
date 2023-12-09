part of 'detail_event.dart';

abstract class _DetailEvent {
  /// 상단 즐겨찾기 버튼이 클릭되엇을 때
  Future<void> onFavoriteBtnTapped(
    BuildContext context,
  );
}
