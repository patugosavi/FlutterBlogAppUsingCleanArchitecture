part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: post.title!.text.color(MyColors.whiteColor).ellipsis.make(),
      ),
      body: ListView(
        children: [
          Hero(
              tag: Key(post.id.toString()),
              child:
                  CachedNetworkImage(imageUrl: post.featuredimage.toString())),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                10.h.heightBox,
                post.title!.text.bold.xl2.make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FeatherIcons.eye),
                    8.w.widthBox,
                    "${post.views} Views".text.make(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsUp,
                        color: MyColors.greenColor,
                      ),
                    ),
                    "0".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: MyColors.redColor,
                      ),
                    ),
                    "0".text.make(),
                  ],
                ),
                HtmlWidget(post.body!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
