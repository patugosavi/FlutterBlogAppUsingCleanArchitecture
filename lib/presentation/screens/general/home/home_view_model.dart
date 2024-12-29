part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;

  final PageController pageController = PageController();

  final VelocityBloc<HomeModel> postsBloc =
      VelocityBloc<HomeModel>(HomeModel());

  fetchAllPosts() async {
    var postsdata = await repository.postsRepo.getAllPosts();

    if (postsdata.status == 1) {
      postsBloc.onUpdateData(postsdata);
    }
  }

  HomeViewModel({required this.repository});
}
