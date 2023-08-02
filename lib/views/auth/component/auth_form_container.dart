// import 'package:flutter/material.dart';
// import 'package:sch_mgt_system/constants/colors.dart';
// import 'package:sch_mgt_system/views/auth/component/auth_button.dart';
// import 'package:sch_mgt_system/views/auth/component/footer_action.dart';
// import 'package:sch_mgt_system/views/auth/component/input_field.dart';
// import 'package:sch_mgt_system/views/auth/login.dart';
// import 'package:sch_mgt_system/views/auth/register.dart';
// import 'package:sch_mgt_system/views/home/desktop.dart';
// import 'package:sch_mgt_system/views/home/mobile.dart';
// import 'package:sch_mgt_system/views/home/res_layout.dart';
// import 'package:sch_mgt_system/views/home/tablet.dart';

// class AuthFormContainer extends StatelessWidget {
//   const AuthFormContainer({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.emailController,
//     required this.passwordController,
//     this.validator,
//     required this.questionText,
//     required this.actionText,
//     this.onPressed,
//     required this.buttonText,
//     required this.welcomeText,
//   });

//   final double height, width;
//   final TextEditingController emailController, passwordController;
//   final String? Function(String?)? validator;
//   final String questionText, actionText, buttonText, welcomeText;
//   final Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(height: height * 0.2),
//         RichText(
//           text: TextSpan(
//             children: [
//               const TextSpan(
//                 text: 'Let’s',
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: AppColors.black,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//               TextSpan(
//                 text: welcomeText,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w800,
//                   color: AppColors.black,
//                   fontSize: 25.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: height * 0.064),
//         Container(
//             height: 50.0,
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: AppColors.white,
//             ),
//             child: AuthInputField(
//               controller: emailController,
//               keyboardType: TextInputType.emailAddress,
//               hintText: 'Enter Email Address',
//               prefixIcon: Icons.email,
//               suffixIcon: Icons.email,
//               obscureText: false,
//             )),
//         SizedBox(height: height * 0.024),
//         Container(
//           height: 50.0,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             color: AppColors.white,
//           ),
//           child: AuthInputField(
//             controller: passwordController,
//             keyboardType: TextInputType.visiblePassword,
//             hintText: 'Enter Password',
//             prefixIcon: Icons.lock,
//             suffixIcon: Icons.visibility,
//             obscureText: true,
//             validator: validator,
//           ),
//         ),
//         SizedBox(height: height * 0.024),
//         AuthButton(
//           width: width,
//           text: buttonText,
//           onPressed: onPressed,
//         ),
//         SizedBox(height: height * 0.024),
//         FooterAction(
//           question: questionText,
//           actionText: actionText,
//           onPressed: () {
//             if (actionText == 'Sign Up') {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => LoginView()));
//             } else {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ResponsiveLayout(
//                     mobile: MobileView(),
//                     tablet: TabletView(),
//                     desktop: DeskTopView(),
//                     smallMobile: MobileView(),
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
