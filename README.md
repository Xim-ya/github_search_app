

# 목차
- [요약](#요약)
- [구현 결과](#구현-결과)
- [폴더 구조](#폴더-구조)
- [프로젝트 구조](#프로젝트-구조)
- [코드](#특징)



# 요약

| Index       | Detail                                                                                                                                                              |  
|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|  
| 구현 기간       | **2023.12.02~ 2023.12.09**                                                                                                                                          |
| 기여       | 기획, 디자인, 개발 (100%)                                                                                                                                                  |
| 사용된 핵심 패키지  | provider(상태관리), go_Router(라우팅), hive(로컬 데이터베이스)                                                                                                                     |  
| IDE         | IntelliJ IDEA 2022.3.3                                                                                                                                              
| Flutter SDK | 3.10.6(stable)                                                                                                                                                      
| Dart SDK    | 3.0.6                                                                                                                                                               |  
| DevTools    | 2.23.1                                                                                                                                                              
| 디바이스        | iphone 12mini(iOS 16.2), SM A908N(Android 12)                                                                                                                       
| 테스트 환경      | macOS Monterey(12.6.3)                                                                                                                                              
| 기능          | - 깃허브 검색 항목 제공 (유저, 리포지토리, 이슈, PR)<br/> - 깃허브 항목 통합 검색<br/>- 검색 결과 호출 (페이지네이션)<br/>- 검색 결과 항목의 상세 화면 진입 및 호출 로직<br/>- 즐겨찾는 유저 등록<br/>- 탐색 항목 저장 및 최신화 (최대 10개)<br/> |  



# 구현 결과

|                                               홈 페이지(데이터 X)                                                |                                                   홈 페이지                                                   |                                               검색 페이지(입력 전)                                                |
|:---------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------:|
| <img src="https://velog.velcdn.com/images/ximya_hf/post/d9570ca8-b31b-4715-9138-8fd87fc3c959/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/55e420f4-e099-45cb-bf2b-cf6a5baab030/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/4a252263-0e2e-447f-a492-594b54838958/image.png">  |  
|                                              검색 페이지 (검색어 입력)                                              |                                            검색 결과 페이지 (검색된 결과X)                                            |                                               검색 결과 페이지(유저)                                               |
| <img src="https://velog.velcdn.com/images/ximya_hf/post/8e386475-2452-4bcc-8806-b328f6b4de1e/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/95b7b3d5-06c7-44ed-b83c-80f08b6bf5b0/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/6eb99564-64cb-43bd-8643-ab922c6c22bd/image.png">  |
|                                             검색 결과 페이지 (리포지토리)                                             |                                              검색 결과 페이지 (이슈)                                               |                                              검색 결과 페이지 (PR)                                               |
| <img src="https://velog.velcdn.com/images/ximya_hf/post/21fc4145-c5b2-4ba5-8081-8b96b4167c16/image.png" > | <img src="https://velog.velcdn.com/images/ximya_hf/post/9b60b8fc-5db9-499e-9ea7-ef996b71c2dc/image.png" > | <img src="https://velog.velcdn.com/images/ximya_hf/post/e5f9f6fa-d150-4c12-bdca-2996110ad915/image.png" > |
|                                                 통합 검색 페이지                                                 |                                              통합 검색 페이지 (에러)                                               |                                           검색 결과 페이지 (페이지네이션 오류)                                           |
| <img src="https://velog.velcdn.com/images/ximya_hf/post/28d6f593-b926-4ff2-b40c-a423df96e0bb/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/289b0eb1-d863-489f-a755-59f33efe2194/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/d6f5fc5d-f6b7-4ca2-a561-d79558432cc7/image.png">  |
|                                                 유저 상세 페이지                                                 |                                               리포지토리 상세 페이지                                                |                                                 이슈 상세 페이지                                                 |
| <img src="https://velog.velcdn.com/images/ximya_hf/post/7bfaf9c9-f105-4658-ba48-c76675e235af/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/8b7d7965-2599-461d-b0a4-3f25abb0f2e2/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/e96d1c44-8ab0-41fc-98e5-7dbffddc3358/image.png">  |
|                                                 PR 상세 페이지                                                 |                                              즐겨 찾는 유저 상세 페이지                                              |
| <img src="https://velog.velcdn.com/images/ximya_hf/post/e62d796c-1cfe-441a-bfdf-eab4a1afdcbf/image.png">  | <img src="https://velog.velcdn.com/images/ximya_hf/post/ddde7250-d053-4b5b-ad23-88c2089c898b/image.png">  |




# 폴더 구조

```bash
 |-- lib
     |-- app
     |   |-- config
     |   |-- constants
     |   |-- helper
     |   |-- modules
     |   |  
     |-- features
     |   |-- shared
     |   |   |--- box
     |   |   |--- models    
     |   |   |--- responses    
     |   |-- (feature)
     |   |    |-- api
	 |   |    |   |-- response
     |   |    |-- data_source
     |   |    |-- repository
	 |   |    |   |-- model
     |   |    |-- local
     |   |        |-- box
     |   |        |-- dao
     |   | 
     |-- presentaion
     |   |-- common
     |   |   |-- base
     |   |-- pages
     |   |-- (section)
     |   |   |-- local_widgets
     |   |   |-- state
     |   |   |-- event    
     |
 | 
```
  
# 프로젝트 구조  
  
<img src ="https://velog.velcdn.com/images/ximya_hf/post/8bf86281-256d-47da-aced-6b3bf839aa63/image.png">  
  
MVVM 아키텍처 적용  
- 모듈 간에 레이어 간 참조가 필요한 경우 의존성 역전 원칙에 따라 모듈의 상위 요소로 참조를 할 수 있도록 함.  
- Data, Domain, Presentation 레이어 간 명확한 역할 분리  
- [DataSource]  
    - 원격 또는 내부 로컬 스토리지를 통해 데이터를 요청하고 반환.  
  - 캐싱 로직 처리.  
  - 네트워크 예외처리 및 Network Exception 매핑.  
- [Repository]  
    - DataSource로부터 전달받은 데이터를 Presentation에서 사용되는 모델로 모델링.  
  - 에러 핸들링 타입 적용 (result 또는 either).  
- [StateNotifier]  
    - 각 도메인별로 구분되는 상태를 개별 모듈(State Notifier)에서 관리하고 관련 비즈니스 로직을 처리.  
  - View 또는 ViewModel에 바인딩되어 Presentation 모듈에 필요한 상태를 전달하거나 이벤트를 전달 받음.  
- [ViewModel]  
    - UI에 영향을 주는 상태와 인터랙션 로직을 관리.  
  - View 라이프사이클을 관리.  
  
  
  
  
  
# 특징
## 비동기 데이터를 효과적으로 처리  
비동기 데이터를 효과적으로 처리하기 위해 데이터 상태를 타입으로 정의하는 모듈을 구현했습니다. 서버로부터 데이터를 받아올 때 로딩, 실패, 성공 등의 상태에 따라 적절한 UI를 표시할 수 있도록 도와줍니다. 아래는 해당 모듈의 구현입니다.  
###### [Ds](./lib/app/modules/data_handling/data_state.dart)  
  
```dart  
sealed class Ds<T> {    
  Ds({required this.state, this.error, this.valueOrNull});    
    
  T? valueOrNull;    
  Object? error;    
  DataState state;    
    
  T get value => valueOrNull!;    
    
  R onState<R>({    
    required R Function(T data) fetched,    
    required R Function(Object error) failed,    
    required R Function() loading,    
  }) {    
    if (state.isFailed) {    
      return failed(error!);    
    } else if (state.isLoading) {    
      return loading();    
    } else {    
      return fetched(valueOrNull as T);    
    }    
}  }    
    
class Fetched<T> extends Ds<T> {    
  final T data;    
    
Fetched(this.data) : super(state: DataState.fetched, valueOrNull: data);  }    
    
class Loading<T> extends Ds<T> {    
Loading() : super(state: DataState.loading);  }    
    
class Failed<T> extends Ds<T> {    
  final Object error;    
    
Failed(this.error) : super(state: DataState.failed, error: error);  }    
    
enum DataState {    
  fetched,    
  loading,    
  failed;    
    
  bool get isFetched => this == DataState.fetched;    
    
  bool get isLoading => this == DataState.loading;    
    
bool get isFailed => this == DataState.failed;  }  
```  

##### [UserDetailStateNotifier](./lib/presentation/pages/detail/state/user_detail_state_notifier.dart)

```dart  
///  /// 유저 상세 정보  ///  Ds<UserDetailInfoModel> userDetailInfo = Loading(); // -> 초기 타입 선언  
  
///  /// 유저 상세 정보 호출  ///  Future<void> _fetchUserDetailInfo() async {    
  final passedUserLoginName = _routeArg.extra as String;    
  final response =    
      await _userRepository.loadUserDetailInfo(passedUserLoginName);    
    
  response.fold(    
    onSuccess: (userInfo) {    
userDetailInfo = Fetched(userInfo);  // -> 성공 타입으로 변경  
      _handleUiStateOnFetched();    },    
    onFailure: (e) {    
userDetailInfo = Failed(e);   // -> 실패 타입으로 변경  
    },  );    
    
notifyListeners();  }  
```  

이렇게 하면 별도의 멤버 변수를 만들지 않고도 쉽게 비동기 데이터 상태를 관리할 수 있습니다.

<br/>

## 테스트하기 용이한 구조

### 의존성 역전

데이터 레이어(DataSource, Repository)의 모듈들을 추상 인터페이스와 실제 구현체로 명확히 구분했습니다. 이로써 모듈 간 의존 관계가 형성될 때 직접 클래스를 참조하는 것이 아니라 추상 인터페이스를 참조하게 되어, 테스트 모듈로 간단하게 교체할 수 있는 구조를 만들었습니다.
###### [RepoDataSource](./lib/feature/repo/data_source/repo_data_source.dart)

```dart  
abstract interface class RepoDataSource {    
/// 검색된 레포지터리 리스트 호출    
  Future<SearchedRepoResponse> loadSearchedRepositories({    
    required String query,    
    required int perPage,    
    required int page,    
  });    
    
/// 레포 리드미 호출    
  Future<RepoReadMeResponse> loadRepoReadMe(    
{required String userLoginName, required String repoTitle});  }  
```  

예를 들어, Repository 모듈이 DataSource 추상 클래스를 참조하는 경우 테스트를 위해 다음과 같은 Fake 클래스를 사용할 수 있습니다.

###### [RepoDataSourceFake](./lib/feature/repo/data_source/repo_data_source_fake.dart)
```dart  
final class RepoDataSourceFake implements RepoDataSource {    
  @override    
  Future<RepoReadMeResponse> loadRepoReadMe(    
      {required String userLoginName, required String repoTitle}) {    
// Mock 데이터  
  }    
  @override    
  Future<SearchedRepoResponse> loadSearchedRepositories(    
      {required String query, required int perPage, required int page}) {    
// Mock 데이터 반환;    
}  }  
  
```  

이와 같이 DataSource 추상 클래스를 구현하는 Fake 클래스를 만들어서 Repository 모듈이 이를 참조하도록 함으로써, 간편하게 테스트를 수행할 수 있게 되었습니다.


### Event Mixin Class
각 사용자 이벤트 동작을 효율적으로 추적하고 관리하기 위해 각 페이지 섹션마다 Event Mixin 클래스를 구현했습니다.

###### [SearchMixin](./lib/presentation/pages/search/event/search_event.dart)
```dart  
abstract class _SearchEvent {    
  ///    
/// 앱바 '취소' 버튼이 클릭 되었을 때    
  ///    
  void onCancelBtnTapped(BuildContext context);    
    
  ///    
  /// [TextField]에 검색어가 입력 되었을 때    
  ///    
  void onInputChanged(BuildContext context, {required String input});    
    
  ///    
/// 검색 카테고리 옵션 클릭되었을 때    
  ///    
  void onSearchOptionTapped(    
    BuildContext context, {    
    required GithubElementCategory selectedCategory,    
    required String keyword,    
});  }  
```  

이렇게 구현된 mixin 클래스는 다음과 같이 각 페이지 위젯 또는 페이지의 하위 클래스에 mixin되어, 위젯이 이벤트 메소드를 실행할 수 있습니다.

###### [FavoriteUserPage](./lib/presentation/pages/favorite_users/favorite_users_page.dart)
```dart  
class FavoriteUsersPage extends BasePage<FavoriteUsersViewModel>    
    with FavoriteUsersEvent {    
  const FavoriteUsersPage({Key? key}) : super(key: key);    
    
  @override    
  Widget buildPage(BuildContext context) {  
```  
앱의 규모가 커지고 관리해야 하는 사용자 이벤트들이 더 많아진다면, Event Mixin 모듈을 사용하여 이벤트 메소드를 중앙 집중화하여 추적과 관리를 용이하게 할 수 있습니다. 또한, 해당 Event Mixin은 테스트 클래스와 연동하여 테스트 범위를 구체화할 수 있는 이점이 있습니다.


<br/>

## 유지보수와 가독성일 높이는 UI 코드

###  Factory 생성자로 유연하게 위젯을 모듈화
<img src="https://velog.velcdn.com/images/ximya_hf/post/2d5e62bf-65e1-4056-8062-4c09a9fee94a/image.png">  

비슷한 특성을 가진 UI이지만 약간의 차이가 있는 경우, Factory 생성자를 활용하여 위젯을 모듈화했습니다.


###### [RoundedButton](./lib/presentation/common/button/rounded_button.dart)
```dart  
// 배경이 안채워진 버튼  
RoundedButton.outline(    
  text: '상세페이지로 이동',    
  onTap: () {    
    routeToUserDetail(context, item.loginName);    
},  ),  
  
  
// 배경이 채워진 버튼  
RoundedButton.filled(    
  text: '${users.length}개 더 보기',    
  onTap: () {    
    routeToFavoriteUsers(context);    
},  ),  
```  

하나의 위젯 클래스에 두 개 이상의 Factory 생성자 구문을 구성하여, 위젯을 생성할 때 생성자로 전달된 인자값을 기준으로 유연하게 필요한 UI를 반환받을 수 있습니다. 이로써 디자인 통일성을 유지하면서 동시에 작업자의 생산성을 높일 수 있습니다.

### 구조화된 UI 코드

###### [HomePage](./lib/presentation/pages/home/home_page.dart)
```dart  
class HomePage extends BasePage<HomeViewModel> {    
  const HomePage({Key? key}) : super(key: key);    
    
  @override    
  Widget buildPage(BuildContext context) {    
    return const _Scaffold(    
      searchBar: _SearchBar(),    
      collapsibleHeader: _CollapsibleHeader(),    
      animatedAppBar: _AnimatedAppBar(),    
      favoriteUserCard: _FavoriteUserCard(),    
      exploreHistoryCard: _ExploreHistoryCard(),    
    );    
  }    
    
  @override    
bool get wrapWithSafeArea => false;  }  
```  
화면 페이지를 구성할 때 각 섹션별로 UI를 구조화하여 코드를 보고도 대략적인 UI 구조를 유추할 수 있도록 설계했습니다. 이로써 화면의 구성 요소들을 각각의 섹션으로 나누어 관리하고 추적할 수 있어, 시각적인 디자인이 없어도 코드만으로도 UI 구조를 쉽게 파악할 수 있습니다. 이는 유지보수를 용이하게 하며 코드를 이해하기 쉽게 만들어줍니다.


### 직관적인 UI 분기처리

enum 값에 따라 UI를 분기하기 위해서는 일반적으로 switch-case 문을 사용합니다. 그러나 enum 값이 많아질수록 일일이 case 구문을 작성하는 것은 번거로울 뿐만 아니라 boilerplate 코드가 늘어나는 단점이 있습니다.

###### [GithubElementCategory](./lib/app/constant/enum/github_element_category.dart)
```dart  
enum GithubElementCategory {    
  user('user', AppAssets.userIcon, '유저', '이(가) 이름에 포함된 사람'),    
  repository('repo', AppAssets.repoIcon, '리포지토리', '이(가) 포함된 리포지토리'),    
  issue('issue', AppAssets.issueIcon, 'Issue', '이(가) 포함된 Issue'),  pr('pr', AppAssets.prOpen, 'Pull Request', '이(가) 포함된 Pul Request'),  total('total', AppAssets.longArrowRightIcon, '통합', '통합검색');    
    
    
  static R branch<R>({    
    required GithubElementCategory targetCategory,    
    required R Function(GithubElementCategory) user,    
    required R Function(GithubElementCategory) repository,    
    required R Function(GithubElementCategory) issue,    
    required R Function(GithubElementCategory) pr,    
  }) {    
    switch (targetCategory) {    
      case GithubElementCategory.user:    
        return user(targetCategory);    
      case GithubElementCategory.repository:    
        return repository(targetCategory);    
      case GithubElementCategory.issue:    
        return issue(targetCategory);    
      case GithubElementCategory.pr:    
        return pr(targetCategory);    
    
      default:    
        throw Exception('잘못된 카테고리입니다: $targetCategory');    
    }    
  }  
```  
이를 개선하기 위해 각 enum 값에 따라 적절한 함수를 인자로 받고 그 결과를 반환할 수 있도록 도와주는 메소드를 enum 내에 추가했습니다.

###### [GithubElementCategory](./lib/presentation/pages/total_searched_list/total_searched_list_page.dart)
```dart  
class TotalSearchedListPage extends BasePage<TotalSearchedViewModel> {    
  const TotalSearchedListPage({Key? key}) : super(key: key);    
    
  @override    
  Widget buildPage(BuildContext context) {     
    return GithubElementCategory.branch(    
        targetCategory: vm(context).selectedCategory,    
        user: (_) => PagedUserListView(vm(context).singletonInstanceName),    
        repository: (_) =>    
            PagedRepositoryListView(vm(context).singletonInstanceName),    
        issue: (_) => PagedIssueListView(vm(context).singletonInstanceName),    
        pr: (_) => PagedPrListView(vm(context).singletonInstanceName));    
  }    
    
  @override    
  PreferredSizeWidget? buildAppBar(BuildContext context) => BackButtonAppBar(    
        title: vm(context).routeArg.selectedCategory.name,    
      );    
    
  @override    
bool get wrapWithSafeArea => false;  }  
```  
이렇게 하면 긴 switch-case 문을 사용하지 않고도 enum 값에 따라 UI를 조건부로 분기할 수 있어 코드가 직관적이고 간결해집니다.


<br/>

## 상태 관리


### Provider를 Riverpod처럼
<img src="https://velog.velcdn.com/images/ximya_hf/post/06b6f88a-1d4a-455a-8d72-564373801d9b/image.png">  

해당 프로젝트에서 검색된 키워드를 기반으로 4가지 유형(유저, 리포지토리, 이슈, PR)의 데이터를 호출하고 화면에 표시하고 있습니다. 하나의 컨트롤러에 이 4가지 유형의 데이터를 저장하고 관리하는 것은 컨트롤러를 무겁게 만들 수 있습니다. 또한, 각 유형에 따라 별도의 페이지를 만드는 것도 효율적이지 않다고 생각했습니다.

그래서 Riverpod와 같이 각 유형의 State을 분리하고 UI 위젯에서 특정 state이 사용될 때 컨트롤러가 초기화되는 방식이 좋다고 생각했습니다. Riverpod의 Provider를 사용하면 해결이 가능하지만, 컨트롤러를 전역으로 관리하고 import만으로 종속성 없이 UI 위젯에서 사용할 수 있다는 점이 불편했습니다.

이러한 문제를 해결하기 위해 Provider 패키지를 사용하여 각 유형의 state을 분리하고, UI 위젯에서 state이 사용될 때 초기화되는 모듈을 만들었습니다.



###### [RepoDetailStateNotifier](./lib/presentation/pages/detail/state/repo_detail_state_notifier.dart)
```dart
class RepoDetailStateNotifier extends BaseStateNotifier {    
  RepoDetailStateNotifier(this._routeArg, this._repoRepository);    
    
  ///    
  /// 레포지터리 모듈    
  ///    
  final RepoRepository _repoRepository;    
    
  ///    
  /// 이전화면으로 전달받은 인자    
  ///    
  final DetailPageRouteArg _routeArg;    
    
  ///    
  /// 레포 리드미 정보     
  ///    
  Ds<String> readMeContent = Loading();    
    
  ///    
  /// 레포 정보    
  ///    
  RepoBasicInfoModel get repoInfo => _routeArg.extra as RepoBasicInfoModel;    
    
  ///    
/// 레포지터리 리드미 데이터 호출    
  ///    
  Future<void> _getRepoReadMe() async {    
    final response = await _repoRepository.loadReadMeContent(    
      userLoginName: repoInfo.userLoginName,    
      repoTitle: repoInfo.title,    
    );    
    
    response.fold(    
      onSuccess: (content) {    
        final decodedContent = _getDecodedContent(content);    
        readMeContent = Fetched(decodedContent);    
      },    
      onFailure: (e) {    
        readMeContent = Failed(e);    
      },    
    );    
    
    notifyListeners();    
  }    
    
  ///    
/// 깃허브 리드미 콘텐츠 디코딩    
  ///    
  String _getDecodedContent(String content) {    
    final filteredContent = content.replaceAll(RegExp(r'\s+'), '');    
    List<int> decodedBytes = base64.decode(filteredContent);    
    String decodedContent = utf8.decode(decodedBytes);    
    
    return decodedContent;    
  }    
    
  @override    
  void onInit() {    
    super.onInit();    
// 탐색기록 업데이트    
    WidgetsBinding.instance.addPostFrameCallback((_) async {    
      context.read<DetailViewModel>().updateUserExploreHistory(    
            item: RepoBasicInfoModel.toBox(repoInfo),    
            category: GithubElementCategory.repository,    
          );    
    });    
    
    _getRepoReadMe();    
}  }  
```  

위 코드는 레포지토리의 상세 정보를 관리하는 StateNotifier(컨트롤러)입니다. StateNotifier은 Riverpod의 Provider와 비슷한 개념으로 이해할 수 있습니다. 서버로부터 데이터를 받아와 상태를 업데이트하고 필요한 비즈니스 로직들을 관리합니다.

###### [_RepoDetailView](./lib/presentation/pages/detail/local_widgets/repo_detail_view.dart)

```dart  
class _RepoDetailView     
    extends BaseNoViewModelStateNotifierView<RepoDetailStateNotifier> {    
  const _RepoDetailView({Key? key}) : super(key: key);    
    
  @override    
  Widget buildView(BuildContext context) {  
...      
}  
```  
StateNotifier는 Riverpod의 Provider과 달리 특정 뷰 위젯에 바인딩되어 사용됩니다. View와 화면이 노출되면 직접 해당 StateNotifier가 생성되어 상태를 해당 뷰 위젯에 전달하는 형태입니다. 이로 인해 Riverpod처럼 state이 사용되는 UI가 노출될 때 컨트롤러가 생성되어 상태를 전달하고 관리할 수 있게 됩니다.

그러나 이러한 구조는 다음과 같은 이유로 좋은 구조가 아닌 것으로 판단했습니다.

- StateNotifier의 종속성을 설정하기 위해 많은 boilerplate 코드가 필요
- 여러 StateNotifier가 서로 의존하는 상태를 관리하기 어려움
- 한 화면에서 여러 StateNotifier를 사용할 때 코드가 굉장히 복잡해짐
- Riverpod와 비교했을 때 컨트롤러의 라이프 사이클을 관리하기 어려움

현재 진행 중인 프로젝트가 비교적 간단하기 때문에 이러한 상태 관리 구조를 사용하더라도 무리가 없었지만, 앱이 복잡해지면 채택하기 어려울 것으로 판단됩니다.


### Provider를 Getx처럼

Getx처럼 직관적이고 단순한 상태 접근 구문을 작성하기 위해 BasePage, BaseViewModel 모듈을 구현하였습니다. BasePage & BaseViewModel 모듈을 사용하면 아래와 같이 간단한 코드로 상태에 접근할 수 있게 됩니다. GetX처럼 직관적이고 간단한 상태 접근 구문을 사용하기 위해 BasePage 및 BaseViewModel 모듈을 구현했습니다. BasePage 및 BaseViewModel 모듈을 사용하면 다음과 같이 간단한 코드로 상태에 접근할 수 있습니다.

###### [BasePage](./lib/presentation/base/base_page.dart)
###### [BaseViewModel](./lib/presentation/base/base_view_model.dart)

```dart  
class CustomViewModel extends BaseViewModel {
  final String userName =  "Ximya";
}

class CustomScreen extends BasePage<CustomViewModel> {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 기존 Provider접근 방식
            Text(context.read<CounterViewModel>().userName),
            Text(context.watch<CounterViewModel>().userName),
            Text(context.select<CounterViewModel, String>((value) => value.userName)),

            // 새로운 접근 방식
            Text(vm(context).userName),
            Text(vmW(context).userName),
            Text(vmS(context, (value) => value.userName)),

          ],
        ),
      ),
    );
  }
}
```  

UI 컨트롤러의 타입이 BasePage 자체에 전달되어 있기 때문에 상태에 접근하기 위해 별도의 타입을 선언하지 않아도 돼 상태 접근 구문이 조금 더 간단해졌습니다.

```dart  
class CustomViewModel extends BaseViewModel {

  @override
  void onInit() {
    super.onInit();
    // 필요한 초기화 작업을 수행
  }

  @override
  void onDispose() {
    super.onDispose();
    // 필요한 dispose 작업을 수행
  }
}


```  
또한, GetX와 유사하게 컨트롤러의 생성 및 해제 시점에 특정 이벤트를 실행할 수 있는 오버라이드 메소드가 존재하여 라이프사이클을 간편하게 관리할 수 있습니다.