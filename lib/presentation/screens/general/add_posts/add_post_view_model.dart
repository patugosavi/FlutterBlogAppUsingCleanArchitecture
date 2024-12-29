part of 'add_post_imports.dart';

class AddPostViewModel {
  final Repository repository;
  AddPostViewModel({required this.repository});

  final ImagePicker picker = ImagePicker();
  final QuillController _controller = QuillController.basic();
  final TextEditingController textEditingController = TextEditingController();

  final VelocityBloc<XFile?> selectedImageBloc = VelocityBloc<XFile?>(null);
  final VelocityBloc<Tag?> selectedTagBloc = VelocityBloc<Tag?>(null);
  final VelocityBloc<Category?> selectedCategoriesBloc =
      VelocityBloc<Category?>(null);

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);

  pickImage(context) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImageBloc.onUpdateData(image);
    } else {
      VxToast.show(context, msg: "No image selected");
    }
  }

  clear() {
    selectedImageBloc.onUpdateData(null);
    selectedCategoriesBloc.onUpdateData(null);
    selectedTagBloc.onUpdateData(null);
    textEditingController.clear();
    _controller.clear();
  }

  addPost(context,String userId) async {
    isLoadingBloc.onUpdateData(true);
    var data = await repository.postsRepo.addNewPosts(
        textEditingController.text,
        textEditingController.text.toLowerCase().replaceAll("", ""),
        selectedCategoriesBloc.state.data!.id.toString(),
        selectedTagBloc.state.data!.id.toString(),
        _controller.document.toPlainText(),
        userId,
        selectedImageBloc.state.data!.path,
        selectedImageBloc.state.data!.path.split("/").last);

    if (data.status == 1) {
      isLoadingBloc.onUpdateData(false);
      clear();
      VxToast.show(context, msg: data.message.toString());
    }
  }
}
