part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;

  TagsViewModel({required this.repository});

  final VelocityBloc<TagsModel> tagsModelBolc =
      VelocityBloc<TagsModel>(TagsModel());

  fetchAllTags() async {
    var tagsData = await repository.tagsRepo.getAllTags();
    if (tagsData.status == 1) {
      tagsModelBolc.onUpdateData(tagsData);
    }
  }

  gotoAddTags(context) async {
    var addedData =
        await AutoRouter.of(context).push<TagsModel>(const AddTagsRoute());
    if (addedData != null) {
      tagsModelBolc.onUpdateData(addedData);
    }
  }

  gotoUpdateTags(context,Tag tag) async {
    var updatedData =
        await AutoRouter.of(context).push<TagsModel>(UpdateTagsRoute(tag: tag));
    if (updatedData != null) {
      tagsModelBolc.onUpdateData(updatedData);
    }
  }

  deleteTags(context, String id, int index) async {
    var data = await repository.tagsRepo.deleteTags(id);
    if (data.status == 1) {
      VxToast.show(context, msg: data.message!);
      tagsModelBolc.state.data.tags!.removeAt(index);
      tagsModelBolc.onUpdateData(tagsModelBolc.state.data);
    }
  }
}
