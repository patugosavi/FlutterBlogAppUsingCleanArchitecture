part of 'add_catgories_imports.dart';

class AddCategoriesViewModel {
  final Repository repository;

  AddCategoriesViewModel({required this.repository});

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  addNewCategories(context) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.categoriesRepo.addNewCategories(
        textEditingController.text,
        textEditingController.text.toLowerCase().replaceAll(" ", "-"));
    if (data.status == 1) {
      VxToast.show(context, msg: data.message.toString());
      var newData = await repository.categoriesRepo.getAllCategories();
      isLoadingBloc.onUpdateData(false);
      AutoRouter.of(context).maybePop<CategoriesModel>(newData);
    }
  }
}
