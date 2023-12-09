import 'package:github_search_app/app/modules/alert/app_snack_bar.dart';
import 'package:github_search_app/app/modules/alert/app_toast.dart';
import 'package:github_search_app/app/modules/data_handling/data_state.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/base/base_state_notifier.dart';

class FavoriteFriendStateNotifier extends BaseStateNotifier {
  FavoriteFriendStateNotifier(this._userRepository);

  final UserRepository _userRepository;

  Ds<List<UserBox>> favoriteUserList = Loading();

  ///
  /// 즐겨찾는 유저 리스트 호출
  ///
  void fetchFavoriteUsers() {
    final response = _userRepository.getListOfUsers();

    response.fold(onSuccess: (users) {
      favoriteUserList = Fetched(users);
    }, onFailure: (e) {
      favoriteUserList = Failed(e);
      AppToast.errorToast(context, e, text: '즐겨찾는 유저 리스트를 불러오는데 실패했습니다.');
    });
    notifyListeners();
  }

  ///
  /// 즐겨찾는 유저에 추가
  ///
  Future<void> addUserToFavoriteList(UserBox user) async {
    final response = await _userRepository.addFavoriteUser(user);
    response.fold(
      onSuccess: (_) {
        AppSnackBar.showSnackBar(context, text: '즐겨찾기 목록에 추가되었습니다.');
        favoriteUserList.value.insert(0, user);
        notifyListeners();
      },
      onFailure: (e) {
        AppToast.errorToast(context, e, text: '유저를 즐겨찾기 목록에 추가하지 못하였습니다.');
      },
    );
  }

  ///
  /// 즐겨찾는 유저 목록에서 현재 유저를 삭제
  ///
  Future<void> removeUserFromFavorites(String loginName) async {
    final response = await _userRepository.deleteUserFromFavorites(loginName);
    response.fold(
      onSuccess: (_) {
        AppSnackBar.showSnackBar(context, text: '즐겨찾기 목록에서 삭제되었습니다.');
        favoriteUserList.value
            .removeWhere((user) => user.loginName == loginName);
        notifyListeners();
      },
      onFailure: (e) {
        AppToast.errorToast(context, e, text: '유저를 즐겨찾기 목록에 삭제하지 못하였습니다.');
      },
    );
  }

  @override
  void onInit() {
    super.onInit();

    fetchFavoriteUsers();
  }

  @override
  void onDispose() {
    super.onDispose();
  }
}
