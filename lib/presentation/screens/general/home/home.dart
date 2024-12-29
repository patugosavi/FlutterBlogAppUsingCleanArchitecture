part of 'home_imports.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel homeViewModel;
  OnboardViewModel onboardViewModel = OnboardViewModel();

  @override
  void initState() {
    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllPosts();
    homeViewModel.postsBloc.stream.listen((state) {
      debugPrint("Current State: $state");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<HomeModel>, VelocityState<HomeModel>>(
          bloc: homeViewModel.postsBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is VelocityUpdateState) {
              // VxToast.show(context, msg: "comeing data");
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Hello ${context.read<VelocityBloc<ProfileModel>>().state.data.userDetails!.name}"
                            .text
                            .bold
                            .xl
                            .make(),
                        CachedNetworkImage(
                          imageUrl: context
                              .read<VelocityBloc<ProfileModel>>()
                              .state
                              .data
                              .userDetails!
                              .profilePhotoUrl
                              .toString(),
                          height: 60.h,
                          width: 60.w,
                        ),
                      ],
                    ).pSymmetric(h: 16.w),
                    40.h.heightBox,
                    VxSwiper.builder(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: state.data.popularPosts!.length,
                        itemBuilder: ((context, index) {
                          var latestPosts = state.data.popularPosts![index];
                          var imagePth = latestPosts.featuredimage.toString();
                          return CachedNetworkImage(
                            imageUrl: imagePth,
                            fit: BoxFit.cover,
                          ).cornerRadius(20.r).pSymmetric(h: 10.w);
                        })),
                    20.h.heightBox,
                    SmoothPageIndicator(
                      controller: onboardViewModel.pageController,
                      count: 6,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                        activeDotColor: MyColors.primaryColor,
                        dotHeight: 12.0.h,
                        dotWidth: 12.0.w,
                      ),
                    ),
                    20.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Latest Posts".text.size(16.sp).make(),
                        "See All".text.size(16.sp).make()
                      ],
                    ).pSymmetric(h: 24.w),
                    10.h.heightBox,
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      shrinkWrap: true,
                      itemCount: state.data.allPosts!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                      itemBuilder: (context, index) {
                        var latestPosts = state.data.allPosts![index];
                        var imagePth = latestPosts.featuredimage.toString();
                        return FadedScaleAnimation(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => AutoRouter.of(context)
                                    .push(HomeDetailsRoute(post: latestPosts)),
                                child: Hero(
                                  tag: Key(latestPosts.id.toString()),
                                  child: CachedNetworkImage(
                                    imageUrl: imagePth,
                                    height: 120.h,
                                    width: 180.h,
                                    fit: BoxFit.cover,
                                  ).cornerRadius(20.r),
                                ),
                              ),
                              10.w.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  latestPosts.title!.text
                                      .size(16.sp)
                                      .maxLines(2)
                                      .bold
                                      .make(),
                                  6.h.heightBox,
                                  Row(
                                    children: [
                                      const Icon(FeatherIcons.clock),
                                      8.horizontalSpace,
                                      latestPosts.createdAt!
                                          .timeAgo()
                                          .toString()
                                          .text
                                          .size(10.sp)
                                          .make(),
                                    ],
                                  ),
                                  6.h.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "${latestPosts.views} views"
                                          .text
                                          .size(16.sp)
                                          .make(),
                                      const Icon(FeatherIcons.bookmark),
                                    ],
                                  ),
                                ],
                              ).expand(),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
