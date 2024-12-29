part of 'add_tags_imports.dart';

@RoutePage()
class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  late AddTagsViewModel addTagsViewModel;

  @override
  void initState() {
    addTagsViewModel = AddTagsViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  void dispose() {
    addTagsViewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Add Tags".text.size(16.sp).make(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              24.h.verticalSpace,
              VxTextField(
                fillColor: MyColors.transparentColor,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10.r,
                hint: "Title",
                controller: addTagsViewModel.textEditingController,
              ),
              30.h.verticalSpace,
              VxTextField(
                fillColor: MyColors.transparentColor,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10.r,
                hint: "Slug",
                controller: addTagsViewModel.textEditingController,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: addTagsViewModel.isLOadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                    title: "Add New Tag",
                    isLoading: state.data,
                    onPressed: () => addTagsViewModel.addNewTags(context),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
