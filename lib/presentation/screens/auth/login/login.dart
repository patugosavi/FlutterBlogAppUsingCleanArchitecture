part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

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
                Form(
                  key: loginViewModel.formKey,
                  child: Container(
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
                          "Login"
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
                            controller: loginViewModel.emailController,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "Email is empty";
                              } else if (!email.isValidEmail) {
                                return "Invalid email";
                              }
                              return null;
                            },
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
                            controller: loginViewModel.passwordController,
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "Password is empty";
                              }
                              // else if (password.length <= 8) {
                              //   return "Minimum password length is 8";
                              // } else if (!password.isValidPassword) {
                              //   return "Invalid password";
                              // }
                              return null;
                            },
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
                                  )),
                              "Forgot Password".text.size(14).make(),
                            ],
                          ),
                          40.h.heightBox,
                          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                            bloc: loginViewModel.isLoadingBloc,
                            builder: (context, state) {
                              return PrimaryButton(
                                  title: "Login",
                                  isLoading: state.data,
                                  onPressed: () {
                                    if (loginViewModel.formKey.currentState!
                                        .validate()) {
                                      loginViewModel.login(context);
                                    }
                                  });
                            },
                          ),
                          20.h.heightBox,
                          "Don't have an account"
                              .richText
                              .size(14)
                              .semiBold
                              .color(MyColors.primaryColor)
                              .withTextSpanChildren([
                            TextSpan(
                                text: " Sign Up",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => AutoRouter.of(context)
                                      .replace(const RegisterRoute()),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                          ]).makeCentered(),
                        ],
                      ),
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
