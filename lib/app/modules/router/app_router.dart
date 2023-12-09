import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/pages/detail/index.dart';
import 'package:github_search_app/presentation/pages/favorite_users/favorite_users_binding.dart';
import 'package:github_search_app/presentation/pages/favorite_users/favorite_users_page.dart';
import 'package:github_search_app/presentation/pages/home/index.dart';
import 'package:github_search_app/presentation/pages/search/index.dart';
import 'package:github_search_app/presentation/pages/searched_list/index.dart';
import 'package:github_search_app/presentation/pages/splash/index.dart';
import 'package:github_search_app/presentation/pages/total_searched_list/index.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppPages.splash,
    routes: [
      GoRoute(
        path: AppPages.splash,
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        path: AppPages.home,
        builder: (_, __) => const HomePage(),
        routes: [
          GoRouteWithBinding(
              path: AppPages.favoriteUsers,
              binding: FavoriteUsersBinding(),
              routeBuilder: (_, __) => const FavoriteUsersPage(),
              prevPath: const [
                AppPages.home,
              ],
              routes: [
                GoRouteWithBinding(
                  path: AppPages.detail,
                  binding: DetailBinding(),
                  routeBuilder: (_, __) => const DetailPage(),
                  prevPath: const [
                    '${AppPages.home}/${AppPages.favoriteUsers}',
                  ],
                ),
              ]),
          GoRouteWithBinding(
            path: AppPages.detail,
            binding: DetailBinding(),
            routeBuilder: (_, __) => const DetailPage(),
            prevPath: const [
              AppPages.home,
            ],
          ),
          GoRouteWithBinding(
            path: AppPages.search,
            binding: SearchBinding(),
            routeBuilder: (context, state) => const SearchPage(),
            prevPath: const [
              AppPages.home,
            ],
            routes: [
              GoRouteWithBinding(
                path: AppPages.searchedList,
                binding: SearchedListBinding(),
                routeBuilder: (_, __) => const SearchedListPage(),
                prevPath: const [
                  '${AppPages.home}/${AppPages.search}',
                ],
                routes: [
                  GoRouteWithBinding(
                    path: AppPages.detail,
                    binding: DetailBinding(),
                    routeBuilder: (_, __) => const DetailPage(),
                    prevPath: const [
                      '${AppPages.home}/${AppPages.search}/${AppPages.searchedList}',
                    ],
                  ),
                  GoRouteWithBinding(
                    path: AppPages.totalSearchedList,
                    binding: TotalSearchedListBinding(),
                    routeBuilder: (_, __) => const TotalSearchedListPage(),
                    prevPath: const [
                      '${AppPages.home}/${AppPages.search}/${AppPages.searchedList}',
                    ],
                    routes: [
                      GoRouteWithBinding(
                        path: AppPages.detail,
                        binding: DetailBinding(),
                        routeBuilder: (_, __) => const DetailPage(),
                        prevPath: const [
                          '${AppPages.home}/${AppPages.search}/${AppPages.searchedList}/${AppPages.totalSearchedList}',
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
