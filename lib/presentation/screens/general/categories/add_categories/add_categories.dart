part of 'add_catgories_imports.dart';

@RoutePage()
class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  late AddCategoriesViewModel addCategoriesViewModel;

  @override
  void initState() {
    addCategoriesViewModel =
        AddCategoriesViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Add Categories".text.size(16.sp).make(),
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
                controller: addCategoriesViewModel.textEditingController,
              ),
              30.h.verticalSpace,
              VxTextField(
                fillColor: MyColors.transparentColor,
                borderColor: MyColors.primaryColor,
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10.r,
                hint: "Slug",
                controller: addCategoriesViewModel.textEditingController,
              ),
              const Spacer(),
              BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                bloc: addCategoriesViewModel.isLoadingBloc,
                builder: (context, state) {
                  return PrimaryButton(
                    title: "Add New Category",
                    isLoading: state.data,
                    onPressed: () =>
                        addCategoriesViewModel.addNewCategories(context),
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
