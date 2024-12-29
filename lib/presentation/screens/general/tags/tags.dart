part of 'tags_imports.dart';

@RoutePage()
class Tags extends StatefulWidget {
  const Tags({super.key, required this.navigateType});

  final NavigateType navigateType;

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;
  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: "Tags".text.size(16.sp).make(),
        automaticallyImplyLeading:
            NavigateType.outer == widget.navigateType ? false : true,
        actions: [
          IconButton(
              onPressed: () => tagsViewModel.gotoAddTags(context),
              icon: const Icon(FeatherIcons.plus))
        ],
      ),
      body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
        bloc: tagsViewModel.tagsModelBolc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return ListView.separated(
                itemCount: state.data.tags!.length,
                separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                itemBuilder: (context, index) {
                  var tagsData = state.data.tags![index];
                  return Card(
                    child: ListTile(
                      leading: "${index + 1}".text.size(16.sp).make(),
                      title: tagsData.title!.text.size(16.sp).make(),
                      trailing: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => tagsViewModel.gotoUpdateTags(
                                  context, tagsData),
                              icon: const Icon(
                                FeatherIcons.edit2,
                                color: MyColors.greenColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () => tagsViewModel.deleteTags(
                                  context, tagsData.id.toString(), index),
                              icon: const Icon(
                                FeatherIcons.trash,
                                color: MyColors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        NavigateType.outer == widget.navigateType
                            ? null
                            : AutoRouter.of(context).maybePop<Tag>(tagsData);
                      },
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
