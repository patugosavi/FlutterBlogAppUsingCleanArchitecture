import 'package:blogapp/data/repositories/auth_repo.dart';
import 'package:blogapp/data/repositories/categories_repo.dart';
import 'package:blogapp/data/repositories/posts_repo.dart';
import 'package:blogapp/data/repositories/repository.dart';
import 'package:blogapp/data/repositories/tags_repo.dart';
import 'package:blogapp/presentation/screens/general/profile/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_bloc/velocity_bloc.dart';

import 'core/constants/my_strings.dart';
import 'core/themes/app_themes.dart';
import 'presentation/router/router_imports.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
      tagsRepo: TagsRepo(),
      authRepo: AuthRepo(),
      postsRepo: PostsRepo(),
      categoriesRepo: CategoriesRepo(),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => VelocityBloc<ProfileModel>(ProfileModel()),
            child: MaterialApp.router(
              title: MyStrings.appName,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              routerConfig: _appRouter.config(),
              // home: const MyHomePage(title: MyStrings.appName),
            ),
          );
        });
  }
}
