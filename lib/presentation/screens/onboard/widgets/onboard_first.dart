part of 'widgets_imports.dart';

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyAssets.assetsImagesOnboard1,
          height: 333.h,
          width: 333.w,
        ),
        "Discover, engage and read the latest articles oras well as share your own thoughts and ideas with the community".i18n
            .text
            .color(MyColors.blackColor)
            .size(15.sp)
            .align(TextAlign.center)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
