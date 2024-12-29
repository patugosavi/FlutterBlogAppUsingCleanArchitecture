import 'package:blogapp/data/repositories/categories_repo.dart';
import 'package:blogapp/data/repositories/posts_repo.dart';

import 'auth_repo.dart';
import 'tags_repo.dart';

class Repository {
  Repository(
      {required this.tagsRepo,
      required this.authRepo,
      required this.postsRepo,
      required this.categoriesRepo});

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final PostsRepo postsRepo;
  final CategoriesRepo categoriesRepo;
}
