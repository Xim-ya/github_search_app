import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/base/base_page.dart';
import 'package:github_search_app/presentation/common/index.dart';
import 'package:github_search_app/presentation/pages/favorite_users/index.dart';

class FavoriteUsersPage extends BasePage<FavoriteUsersViewModel>
    with FavoriteUsersEvent {
  const FavoriteUsersPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return ListView.builder(
      itemCount: vm(context).favoriteUsers.length,
      itemBuilder: (context, index) {
        return HookBuilder(
          builder: (BuildContext context) {
            final item = vm(context).favoriteUsers[index];
            final isSetToFavorite = useState(true);
            return Stack(
              children: [
                UserListTile(
                  item: UserBasicInfoModel(
                    loginName: item.loginName,
                    nodeId: item.nodeId,
                    profileImgUrl: item.profileImgUrl,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 36,
                    child: ToggledStarButton(
                      isFilled: isSetToFavorite.value,
                      onTap: () {
                        onFavoriteBtnTapped(
                          context,
                          isFilled: isSetToFavorite.value,
                          user: item,
                        );
                        isSetToFavorite.value = !isSetToFavorite.value;
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) =>
      const BackButtonAppBar(title: '즐겨찾는 유저');

  @override
  bool get wrapWithSafeArea => false;
}
