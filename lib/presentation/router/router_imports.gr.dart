// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:blogapp/presentation/enums/navigate_type.dart' as _i19;
import 'package:blogapp/presentation/screens/auth/auth_imports.dart' as _i4;
import 'package:blogapp/presentation/screens/auth/login/login_imports.dart'
    as _i9;
import 'package:blogapp/presentation/screens/auth/register/register_imports.dart'
    as _i12;
import 'package:blogapp/presentation/screens/general/add_posts/add_post_imports.dart'
    as _i2;
import 'package:blogapp/presentation/screens/general/categories/add_categories/add_catgories_imports.dart'
    as _i1;
import 'package:blogapp/presentation/screens/general/categories/categories_imports.dart'
    as _i5;
import 'package:blogapp/presentation/screens/general/categories/categories_model.dart'
    as _i21;
import 'package:blogapp/presentation/screens/general/categories/update_categories/update_categories_imports.dart'
    as _i15;
import 'package:blogapp/presentation/screens/general/general_imports.dart'
    as _i6;
import 'package:blogapp/presentation/screens/general/home/home_imports.dart'
    as _i7;
import 'package:blogapp/presentation/screens/general/home/home_model.dart'
    as _i20;
import 'package:blogapp/presentation/screens/general/profile/profile_imports.dart'
    as _i11;
import 'package:blogapp/presentation/screens/general/tags/add_tags/add_tags_imports.dart'
    as _i3;
import 'package:blogapp/presentation/screens/general/tags/tags_imports.dart'
    as _i14;
import 'package:blogapp/presentation/screens/general/tags/tags_model.dart'
    as _i22;
import 'package:blogapp/presentation/screens/general/tags/update_tags/update_tags_imports.dart'
    as _i16;
import 'package:blogapp/presentation/screens/language/language_imports.dart'
    as _i8;
import 'package:blogapp/presentation/screens/onboard/onboard_imports.dart'
    as _i10;
import 'package:blogapp/presentation/screens/splash/splash_imports.dart'
    as _i13;
import 'package:flutter/material.dart' as _i18;

/// generated route for
/// [_i1.AddCategories]
class AddCategoriesRoute extends _i17.PageRouteInfo<void> {
  const AddCategoriesRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AddCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoriesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddCategories();
    },
  );
}

/// generated route for
/// [_i2.AddPost]
class AddPostRoute extends _i17.PageRouteInfo<void> {
  const AddPostRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AddPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddPost();
    },
  );
}

/// generated route for
/// [_i3.AddTags]
class AddTagsRoute extends _i17.PageRouteInfo<void> {
  const AddTagsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AddTagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTagsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddTags();
    },
  );
}

/// generated route for
/// [_i4.Auth]
class AuthRoute extends _i17.PageRouteInfo<void> {
  const AuthRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i4.Auth();
    },
  );
}

/// generated route for
/// [_i5.Categories]
class CategoriesRoute extends _i17.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i18.Key? key,
    required _i19.NavigateType navigateType,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(
            key: key,
            navigateType: navigateType,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>();
      return _i5.Categories(
        key: args.key,
        navigateType: args.navigateType,
      );
    },
  );
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({
    this.key,
    required this.navigateType,
  });

  final _i18.Key? key;

  final _i19.NavigateType navigateType;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, navigateType: $navigateType}';
  }
}

/// generated route for
/// [_i6.General]
class GeneralRoute extends _i17.PageRouteInfo<void> {
  const GeneralRoute({List<_i17.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i6.General();
    },
  );
}

/// generated route for
/// [_i7.Home]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.Home();
    },
  );
}

/// generated route for
/// [_i7.HomeDetails]
class HomeDetailsRoute extends _i17.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i18.Key? key,
    required _i20.Post post,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          HomeDetailsRoute.name,
          args: HomeDetailsRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDetailsRouteArgs>();
      return _i7.HomeDetails(
        key: args.key,
        post: args.post,
      );
    },
  );
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({
    this.key,
    required this.post,
  });

  final _i18.Key? key;

  final _i20.Post post;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i8.Language]
class LanguageRoute extends _i17.PageRouteInfo<void> {
  const LanguageRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.Language();
    },
  );
}

/// generated route for
/// [_i9.Login]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i9.Login();
    },
  );
}

/// generated route for
/// [_i10.OnBoard]
class OnBoardRoute extends _i17.PageRouteInfo<void> {
  const OnBoardRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnBoard();
    },
  );
}

/// generated route for
/// [_i11.Profile]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i11.Profile();
    },
  );
}

/// generated route for
/// [_i12.Register]
class RegisterRoute extends _i17.PageRouteInfo<void> {
  const RegisterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i12.Register();
    },
  );
}

/// generated route for
/// [_i13.Splash]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i13.Splash();
    },
  );
}

/// generated route for
/// [_i14.Tags]
class TagsRoute extends _i17.PageRouteInfo<TagsRouteArgs> {
  TagsRoute({
    _i18.Key? key,
    required _i19.NavigateType navigateType,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          TagsRoute.name,
          args: TagsRouteArgs(
            key: key,
            navigateType: navigateType,
          ),
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TagsRouteArgs>();
      return _i14.Tags(
        key: args.key,
        navigateType: args.navigateType,
      );
    },
  );
}

class TagsRouteArgs {
  const TagsRouteArgs({
    this.key,
    required this.navigateType,
  });

  final _i18.Key? key;

  final _i19.NavigateType navigateType;

  @override
  String toString() {
    return 'TagsRouteArgs{key: $key, navigateType: $navigateType}';
  }
}

/// generated route for
/// [_i15.UpdateCategories]
class UpdateCategoriesRoute
    extends _i17.PageRouteInfo<UpdateCategoriesRouteArgs> {
  UpdateCategoriesRoute({
    _i18.Key? key,
    required _i21.Category category,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          UpdateCategoriesRoute.name,
          args: UpdateCategoriesRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCategoriesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateCategoriesRouteArgs>();
      return _i15.UpdateCategories(
        key: args.key,
        category: args.category,
      );
    },
  );
}

class UpdateCategoriesRouteArgs {
  const UpdateCategoriesRouteArgs({
    this.key,
    required this.category,
  });

  final _i18.Key? key;

  final _i21.Category category;

  @override
  String toString() {
    return 'UpdateCategoriesRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i16.UpdateTags]
class UpdateTagsRoute extends _i17.PageRouteInfo<UpdateTagsRouteArgs> {
  UpdateTagsRoute({
    _i18.Key? key,
    required _i22.Tag tag,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          UpdateTagsRoute.name,
          args: UpdateTagsRouteArgs(
            key: key,
            tag: tag,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTagsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTagsRouteArgs>();
      return _i16.UpdateTags(
        key: args.key,
        tag: args.tag,
      );
    },
  );
}

class UpdateTagsRouteArgs {
  const UpdateTagsRouteArgs({
    this.key,
    required this.tag,
  });

  final _i18.Key? key;

  final _i22.Tag tag;

  @override
  String toString() {
    return 'UpdateTagsRouteArgs{key: $key, tag: $tag}';
  }
}
