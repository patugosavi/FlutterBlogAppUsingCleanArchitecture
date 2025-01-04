part of 'profile_imports.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModels profileViewModels;

  @override
  void initState() {
    profileViewModels =
        ProfileViewModels(repository: context.read<Repository>());
    profileViewModels.getUserProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              AutoRouter.of(context).push(const LanguageRoute());
            },
            icon: const Icon(FeatherIcons.globe).pOnly(right: 10.w),
          ),
          IconButton(
            onPressed: () {
              profileViewModels.logout(context);
            },
            icon: const Icon(FeatherIcons.logOut).pOnly(right: 10.w),
          ),
        ],
      ),
      body:
          BlocBuilder<VelocityBloc<ProfileModel>, VelocityState<ProfileModel>>(
        bloc: profileViewModels.profileModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is VelocityUpdateState) {
            return RefreshIndicator(
              onRefresh: () => profileViewModels.getUserProfileData(context),
              child: ListView(
                children: [
                  Container(
                    height: 500.h,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.r),
                        bottomRight: Radius.circular(40.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundImage: NetworkImage(state
                                .data.userDetails!.profilePhotoUrl
                                .toString()),
                          ),
                          10.h.heightBox,
                          state.data.userDetails!.name!.text.bold.white.xl2
                              .make(),
                          state.data.userDetails!.email!.text.white.xl.make(),
                          20.h.heightBox,
                          state.data.userDetails!.about!.text.center.white.xl
                              .make(),
                          20.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  state.data.postsCount!.text.white.bold.xl3
                                      .make(),
                                  "Posts".text.white.xl.make(),
                                ],
                              ),
                              Column(
                                children: [
                                  "0".text.white.bold.xl3.make(),
                                  "Following".text.white.xl.make(),
                                ],
                              ),
                              Column(
                                children: [
                                  "0".text.white.bold.xl3.make(),
                                  "Followers".text.white.xl.make(),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  20.h.heightBox,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "My Posts".text.bold.xl3.make(),
                        GridView.builder(
                          itemCount: state.data.posts!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 13,
                            childAspectRatio: 0.9,
                          ),
                          itemBuilder: (context, index) {
                            var userPostsData = state.data.posts![index];
                            var imagePath = userPostsData.featuredimage
                                .toString()
                                .prepend("https://techblog.codersangam.com/")
                                .replaceAll("public", "storage");
                            return Column(
                              children: [
                                CachedNetworkImage(imageUrl: imagePath)
                                    .cornerRadius(10.r),
                                6.h.heightBox,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    userPostsData.title!.text.medium
                                        .maxLines(2)
                                        .make()
                                        .expand(),
                                    IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(FeatherIcons.moreVertical),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
