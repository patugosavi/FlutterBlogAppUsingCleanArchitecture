part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnboardViewModel onboardViewModel = OnboardViewModel();

  @override
  void dispose() {
    onboardViewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                MyAssets.assetsImagesJournoLogo,
                color: MyColors.primaryColor,
                height: 42.h,
                width: 139.w,
              ),
              63.h.heightBox,
              PageView(
                controller: onboardViewModel.pageController,
                children: const [
                  OnBoardFirst(),
                  OnBoardSecond(),
                  OnBoardThird(),
                ],
              ).expand(),
              61.h.heightBox,
              PrimaryButton(
                title: "Get Started",
                onPressed: () => AutoRouter.of(context).push(
                  const AuthRoute(),
                ),
              ),
              SizedBox(
                height: 61.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Skip"
                      .text
                      .color(MyColors.primaryColor)
                      .size(16.sp)
                      .fontWeight(FontWeight.w700)
                      .make(),
                  SmoothPageIndicator(
                    controller: onboardViewModel.pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect(
                      activeDotColor: MyColors.primaryColor,
                      dotHeight: 12.0.h,
                      dotWidth: 12.0.w,
                    ),
                  ),
                  "Next"
                      .text
                      .color(MyColors.primaryColor)
                      .size(16.sp)
                      .fontWeight(FontWeight.w700)
                      .make(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
