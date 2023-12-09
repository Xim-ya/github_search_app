import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';
import 'package:github_search_app/feature/shared/response/user_item_response.dart';

class UserBasicInfoModel extends GithubElementModel {
  final String loginName; // 유저 이름
  final String profileImgUrl; // 유저 프로필 이미지

  UserBasicInfoModel({
    required this.loginName,
    required this.profileImgUrl,
    required String nodeId,
  }) : super(DateTime.now(), GithubElementCategory.user.tag, nodeId);

  factory UserBasicInfoModel.fromResponse(UserItemResponse response) {
    return UserBasicInfoModel(
      loginName: response.login,
      profileImgUrl: response.avatarUrl,
      nodeId: response.nodeId,
    );
  }
}
