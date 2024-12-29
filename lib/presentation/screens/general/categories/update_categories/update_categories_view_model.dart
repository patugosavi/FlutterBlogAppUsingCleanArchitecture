part of 'update_categories_imports.dart';

class UpdateCategoriesViewModel {
  final Repository repository;

  UpdateCategoriesViewModel({required this.repository});

  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<bool> isLOadingBloc = VelocityBloc<bool>(false);

  updateCategories(context, String id) async {
    isLOadingBloc.onUpdateData(true);
    var data = await repository.categoriesRepo.updateCategories(
        id,
        textEditingController.text,
        textEditingController.text.toLowerCase().replaceAll(" ", "-"));

    if (data.status == 1) {
      VxToast.show(context, msg: data.message.toString());
      var newData = await repository.categoriesRepo.getAllCategories();
      isLOadingBloc.onUpdateData(false);
      AutoRouter.of(context).maybePop<CategoriesModel>(newData);
    }
  }
}
