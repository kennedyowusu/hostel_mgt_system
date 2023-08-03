import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sch_mgt_system/constants/colors.dart';
import 'package:sch_mgt_system/providers/loading_notifier.dart';
import 'package:sch_mgt_system/providers/providers.dart';
import 'package:sch_mgt_system/views/auth/component/auth_button.dart';
import 'package:sch_mgt_system/views/auth/component/footer_action.dart';
import 'package:sch_mgt_system/views/auth/component/input_field.dart';
import 'package:sch_mgt_system/views/auth/register.dart';
import 'package:sch_mgt_system/views/home/desktop.dart';
import 'package:sch_mgt_system/views/home/mobile.dart';
import 'package:sch_mgt_system/views/home/res_layout.dart';
import 'package:sch_mgt_system/views/home/tablet.dart';

class LoginView extends ConsumerWidget {
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  LoginView({Key? key}) : super(key: key);

  final String email = '';
  final String password = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthButton buildLoginButton(
      double width, WidgetRef ref, BuildContext context) {
    return AuthButton(
      width: width,
      text: 'Sign In',
      onPressed: () async {
        if (loginFormKey.currentState!.validate()) {
          loginFormKey.currentState!.save();

          final loadingNotifier = ref.read(loadingStateProvider.notifier);

          try {
            loadingNotifier.setLoading(true);

            final String email = emailController.text;
            final String password = passwordController.text;

            // userRepository.loginUser(email, password);

            await Future.delayed(
              const Duration(seconds: 3),
              () {
                print('Login Successful');

                ref.read(emailControllerProvider).text = email;

                ref.read(passwordControllerProvider).text = password;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponsiveLayout(
                      mobile: MobileView(),
                      tablet: TabletView(),
                      desktop: DeskTopView(),
                      smallMobile: MobileView(),
                    ),
                  ),
                );
              },
            );

            // if (user != null) {
            //   await Future.delayed(
            //     const Duration(seconds: 3),
            //     () {
            //       print('Login Successful');

            //       ref.read(emailControllerProvider).text = email;

            //       ref.read(passwordControllerProvider).text = password;

            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => ResponsiveLayout(
            //             mobile: MobileView(),
            //             tablet: TabletView(),
            //             desktop: DeskTopView(),
            //             smallMobile: MobileView(),
            //           ),
            //         ),
            //       );
            //     },
            //   );
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('Invalid email or password'),
            //     ),
            //   );
            // }

            loadingNotifier.setLoading(false);
          } catch (e) {
            loadingNotifier.setLoading(false);
            debugPrint('Error: $e');
            print(e);
          } finally {
            loadingNotifier.setLoading(
                false); // Set loading to false after the login process is complete
          }
        } else {
          print('Error');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final bool loading = ref.watch(loadingStateProvider);
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveLayout.isMobile(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColors.mainBlueColor,
                      child: const Center(
                        child: Text(
                          'Hostel Management System',
                          style: TextStyle(
                            fontSize: 28.0,
                            color: AppColors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveLayout.isMobile(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.2),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Let’s',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: ' Sign In 👇',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.black,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.064),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.white,
                          ),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final TextEditingController emailController =
                                  ref.watch(emailControllerProvider);

                              final String? emailError =
                                  ref.watch(emailErrorProvider);

                              return AuthInputField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter Email',
                                prefixIcon: Icons.email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return emailError.toString();
                                  }
                                  return null;
                                },
                                onSaved: (String? value) {
                                  emailController.text = value!;
                                  return null;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.024),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.white,
                          ),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final TextEditingController passwordController =
                                  ref.watch(passwordControllerProvider);
                              final String? passwordError =
                                  ref.watch(passwordErrorProvider);

                              return AuthInputField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                hintText: 'Enter Password',
                                prefixIcon: Icons.lock,
                                suffixIcon: Icons.visibility,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return passwordError.toString();
                                  }
                                  return null;
                                },
                                onSaved: (String? value) {
                                  passwordController.text = value!;
                                  return null;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.024),
                        loading == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              )
                            : buildLoginButton(width, ref, context),
                        SizedBox(height: height * 0.024),
                        FooterAction(
                          question: 'Don’t have an account?',
                          actionText: 'Sign Up',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
