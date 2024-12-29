part of 'update_tags_imports.dart';

@RoutePage()
class UpdateTags extends StatefulWidget {
  const UpdateTags({super.key, required this.tag});

  final Tag tag;

  @override
  State<UpdateTags> createState() => _UpdateTagsState();
}

class _UpdateTagsState extends State<UpdateTags> {
  late UpdateTagsViewModel updateTagsViewModel;

  @override
  void initState() {
    updateTagsViewModel =
        UpdateTagsViewModel(repository: context.read<Repository>());

    updateTagsViewModel.textEditingController.text =
        widget.tag.title.toString();
    super.initState();
  }

  @override
  void dispose() {
    updateTagsViewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Update Tags".text.size(16.sp).make(),
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
                controller: updateTagsViewModel.textEditingController,
              ),
              30.h.verticalSpace,
              VxTextField(
                fillColor: MyColors.transparentColor,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10.r,
                hint: "Slug",
                controller: updateTagsViewModel.textEditingController,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: updateTagsViewModel.isLOadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                    title: "Update Tag",
                    isLoading: state.data,
                    onPressed: () => updateTagsViewModel.updateTags(
                        context, widget.tag.id.toString()),
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
