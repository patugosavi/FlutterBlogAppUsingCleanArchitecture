part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadedScaleAnimation(
            child: Column(
              children: [
                Image.asset(
                  MyAssets.assetsImagesJournoLogo,
                  height: 42.h,
                  width: 139.w,
                ).centered(),
                100.h.heightBox,
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.r),
                      topRight: Radius.circular(36.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.h.heightBox,
                        "Sign Up"
                            .text
                            .size(18.sp)
                            .color(MyColors.primaryColor)
                            .fontWeight(FontWeight.w700)
                            .makeCentered(),
                        48.h.heightBox,
                        "Email".text.make(),
                        8.h.heightBox,
                        VxTextField(
                          fillColor: MyColors.transparentColor,
                          borderColor: MyColors.primaryColor,
                          borderType: VxTextFieldBorderType.roundLine,
                          borderRadius: 10.r,
                          hint: "prathamesh@gmail.com",
                          prefixIcon: const Icon(Icons.email),
                        ),
                        20.h.heightBox,
                        "Password".text.make(),
                        8.h.heightBox,
                        VxTextField(
                          isPassword: true,
                          obscureText: true,
                          fillColor: MyColors.transparentColor,
                          borderColor: MyColors.primaryColor,
                          borderType: VxTextFieldBorderType.roundLine,
                          borderRadius: 10.r,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        20.h.heightBox,
                        "Confirm Password".text.make(),
                        8.h.heightBox,
                        VxTextField(
                          isPassword: true,
                          obscureText: true,
                          fillColor: MyColors.transparentColor,
                          borderColor: MyColors.primaryColor,
                          borderType: VxTextFieldBorderType.roundLine,
                          borderRadius: 10.r,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        40.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                value: false,
                                onChanged: (value) {},
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: "Remeber Me".text.make(),
                              ),
                            ),
                          ],
                        ),
                        40.h.heightBox,
                        PrimaryButton(
                          title: "Register",
                          onPressed: () {},
                        ),
                        20.h.heightBox,
                        "ALready have an account?"
                            .richText
                            .size(14)
                            .semiBold
                            .color(MyColors.primaryColor)
                            .withTextSpanChildren([
                          TextSpan(
                              text: " Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => AutoRouter.of(context)
                                    .replace(const LoginRoute()),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                        ]).makeCentered(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
