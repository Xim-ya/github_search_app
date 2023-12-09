import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:hive/hive.dart';

part 'user_list_box.g.dart';

@HiveType(typeId: 1)
class UserListBox extends HiveObject {
  @HiveField(0)
  final List<UserBox> users;

  UserListBox(this.users);
}
