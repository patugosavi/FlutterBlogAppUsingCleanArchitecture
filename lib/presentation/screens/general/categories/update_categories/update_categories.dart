part of 'update_categories_imports.dart';

@RoutePage()
class UpdateCategories extends StatefulWidget {
  const UpdateCategories({super.key, required this.category});

  final Category category;

  @override
  State<UpdateCategories> createState() => _UpdateCategoriesState();
}

class _UpdateCategoriesState extends State<UpdateCategories> {
  late UpdateCategoriesViewModel updateCategoriesViewModel;

  @override
  void initState() {
    updateCategoriesViewModel =
        UpdateCategoriesViewModel(repository: context.read<Repository>());

    updateCategoriesViewModel.textEditingController.text =
        widget.category.title.toString();
    super.initState();
  }

  @override
  void dispose() {
    updateCategoriesViewModel.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Update Categories".text.size(16.sp).make(),
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
                controller: updateCategoriesViewModel.textEditingController,
              ),
              30.h.verticalSpace,
              VxTextField(
                fillColor: MyColors.transparentColor,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10.r,
                hint: "Slug",
                controller: updateCategoriesViewModel.textEditingController,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: updateCategoriesViewModel.isLOadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                    title: "Update Category",
                    isLoading: state.data,
                    onPressed: () => updateCategoriesViewModel.updateCategories(
                        context, widget.category.id.toString()),
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
