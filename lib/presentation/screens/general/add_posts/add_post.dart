part of 'add_post_imports.dart';

@RoutePage()
class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late AddPostViewModel addPostViewModel;

  @override
  void initState() {
    addPostViewModel = AddPostViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  void dispose() {
    addPostViewModel.textEditingController.dispose();
    addPostViewModel._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Post".text.make(),
        backgroundColor: MyColors.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: addPostViewModel.isLoadingBloc,
            builder: (context, state) {
              return IconButton(
                  onPressed: () => addPostViewModel.addPost(
                      context,
                      context
                          .read<VelocityBloc<ProfileModel>>()
                          .state
                          .data
                          .userDetails!
                          .id
                          .toString()),
                  icon: state.data == true
                      ? const CircularProgressIndicator.adaptive(
                          backgroundColor: MyColors.whiteColor,
                        )
                      : const Icon(FeatherIcons.check));
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          20.h.heightBox,
          BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
            bloc: addPostViewModel.selectedImageBloc,
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  20.h.heightBox,
                  state.data != null
                      ? Image.file(
                          File(state.data!.path),
                          height: 250.h,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(20.r)
                      : Image.network(
                          "https://cdn.pixabay.com/photo/2018/01/12/14/24/night-3078326_1280.jpg",
                        ).cornerRadius(20.r),
                  IconButton(
                    onPressed: () => addPostViewModel.pickImage(context),
                    icon: Icon(
                      FeatherIcons.camera,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ],
              );
            },
          ),
          20.h.heightBox,
          VxTextField(
            fillColor: MyColors.transparentColor,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10.r,
            hint: "Title",
            controller: addPostViewModel.textEditingController,
          ),
          20.h.heightBox,
          VxTextField(
            fillColor: MyColors.transparentColor,
            borderColor: MyColors.primaryColor,
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10.r,
            hint: "Slug",
            controller: addPostViewModel.textEditingController,
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Tag?>, VelocityState<Tag?>>(
            bloc: addPostViewModel.selectedTagBloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data = await AutoRouter.of(context)
                      .push<Tag>(TagsRoute(navigateType: NavigateType.inner));
                  addPostViewModel.selectedTagBloc.onUpdateData(data);
                },
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.data != null
                          ? state.data!.title!.text.make()
                          : "Tags".text.make(),
                      const Icon(
                        FeatherIcons.chevronRight,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<Category?>, VelocityState<Category?>>(
            bloc: addPostViewModel.selectedCategoriesBloc,
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  var data = await AutoRouter.of(context).push<Category>(
                      CategoriesRoute(navigateType: NavigateType.inner));
                  addPostViewModel.selectedCategoriesBloc.onUpdateData(data);
                },
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.data != null
                          ? state.data!.title!.text.make()
                          : "Categories".text.make(),
                      const Icon(
                        FeatherIcons.chevronRight,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          20.h.heightBox,
          QuillSimpleToolbar(
            controller: addPostViewModel._controller,
            configurations: QuillSimpleToolbarConfigurations(
              sharedConfigurations: QuillSharedConfigurations(
                locale: I18n.locale,
              ),
            ),
          ),
          Expanded(
            child: QuillEditor.basic(
              controller: addPostViewModel._controller,
              configurations: QuillEditorConfigurations(
                sharedConfigurations: QuillSharedConfigurations(
                  locale: I18n.locale,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
