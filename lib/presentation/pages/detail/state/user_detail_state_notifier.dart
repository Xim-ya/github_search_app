import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/helper/extension/list_extension.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/detail/detail_view_model.dart';
import 'package:github_search_app/presentation/pages/home/state/favorite_user_state_notifier.dart';
import 'package:provider/provider.dart';

class UserDetailStateNotifier extends BaseStateNotifier {
  UserDetailStateNotifier(
      this._routeArg, this._userRepository, this._favoriteFriendStateNotifier);

  ///
  /// 레포지터리 모듈
  ///
  final UserRepository _userRepository;

  ///
  /// 즐겨찾는 친구 State Notifier
  ///
  final FavoriteFriendStateNotifier _favoriteFriendStateNotifier;

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final DetailPageRouteArg _routeArg;

  ///
  /// 유저 상세 정보
  ///
  Ds<UserDetailInfoModel> userDetailInfo = Loading();

  ///
  /// 즐겨찾기된 유저 목록
  ///
  List<UserBox> get favoriteUsers =>
      _favoriteFriendStateNotifier.favoriteUserList.value;

  ///
  /// 유저 상세 정보 호출
  ///
  Future<void> _fetchUserDetailInfo() async {
    final passedUserLoginName = _routeArg.extra as String;
    final response =
        await _userRepository.loadUserDetailInfo(passedUserLoginName);

    response.fold(
      onSuccess: (userInfo) {
        userDetailInfo = Fetched(userInfo);
        _handleUiStateOnFetched();
      },
      onFailure: (e) {
        userDetailInfo = Failed(e);
      },
    );

    notifyListeners();
  }

  ///
  /// 유저 정보 호출 시 [ViewModel] ui state을 설정
  ///
  void _handleUiStateOnFetched() {
    final vm = context.read<DetailViewModel>();

    vm.setFavoriteBtnAvailable();
    final confirmedUserOrNull = favoriteUsers.firstWhereOrNull(
        (user) => user.loginName == userDetailInfo.value.loginName);

    if (confirmedUserOrNull != null) {
      vm.toggleFavoriteBtnState();
    }
  }

  ///
  /// 즐겨찾기에 유저가 추가 되었을 때
  ///
  void onAddUser() {
    final user = userDetailInfo.value;
    final userBox = UserBox(
      nodeId: user.nodeId,
      loginName: user.loginName,
      profileImgUrl: user.profileImgUrl,
      bio: user.bio,
      location: user.location,
      followersCount: user.followersCount,
      followingCount: user.followingCount,
      exploreDate: user.exploreDate,
      categoryTag: GithubElementCategory.user.tag,
    );
    _favoriteFriendStateNotifier.addUserToFavoriteList(userBox);
  }

  ///
  /// 즐겨찾기에 유저가 삭제 되었을 때
  ///
  void onDeleteUser() {
    _favoriteFriendStateNotifier
        .removeUserFromFavorites(userDetailInfo.value.loginName);
  }

  @override
  void onInit() {
    super.onInit();
    _fetchUserDetailInfo().then(
      (_) {
        // 탐색기록 업데이트
        context.read<DetailViewModel>().updateUserExploreHistory(
              item: UserDetailInfoModel.toBox(userDetailInfo.value),
              category: GithubElementCategory.user,
            );
      },
    );
  }
}
