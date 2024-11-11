import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/widget/custom_elevated_button.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_form_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class RegisterView extends StatefulWidget {
//   RegisterView({super.key});
//
//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }
//
// class _RegisterViewState extends State<RegisterView> {
//   TextEditingController? emailController = TextEditingController();
//
//   TextEditingController? passwordController = TextEditingController();
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     bool isLoading = false;
//     return Scaffold(
//       backgroundColor: const Color(0xffDFECDB),
//       body: SafeArea(
//         child: LayoutBuilder(builder: (context, constraints) {
//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   SizedBox(height: constraints.maxHeight * 0.08),
//                   Text("Sign Up", style: theme.textTheme.titleLarge),
//                   SizedBox(height: constraints.maxHeight * 0.05),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         CustomTextFormField(
//                           icon: Icon(Icons.remove_red_eye),
//                           hintText: 'Email',
//                           validator: (value) {
//                             if (value!.length < 6) {
//                               return 'password is not valid';
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 8.0),
//                         CustomTextFormField(
//                           icon: Icon(Icons.email),
//                           hintText: 'Full name',
//                           validator: (value) {
//                             if (value!.length < 6) {
//                               return 'password is not valid';
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 8.0),
//                         CustomTextFormField(
//                           icon: Icon(Icons.email),
//                           hintText: 'Password',
//                           validator: (value) {
//                             if (value!.length < 6) {
//                               return 'password is not valid';
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 8.0),
//                         CustomTextFormField(
//                           icon: Icon(Icons.email),
//                           hintText: 'Password',
//                           validator: (value) {
//                             if (value!.length < 6) {
//                               return 'password is not valid';
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 16.0),
//                         CustomElevatedButton(
//                           buttonTitle: 'Sign Up',
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                             }
//                           },
//                         ),
//                         CustomTextButton(
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               setState(() {
//                                 isLoading = true;
//                               });
//                               try {
//                                 await registerUser();
//                                 showTopSnackBar(
//                                   Overlay.of(context),
//                                   CustomSnackBar.success(
//                                     message:
//                                     "Sugin up successful.",
//                                   ),
//                                 );
//                                 Navigator.pushReplacementNamed(
//                                     context, PageRoutesName.layout);
//                               } on FirebaseAuthException catch (e) {
//                                 if (e.code == 'weak-password') {
//                                 } else if (e.code == 'email-already-in-use') {}
//                               }
//                               setState(() {
//                                 isLoading = false;
//                               });
//                             }
//                           },
//                           text1: "Already have an account? ",
//                           text2: "Sign in",
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   void dialog() {
//     AwesomeDialog(
//       context: context,
//       animType: AnimType.scale,
//       dialogType: DialogType.info,
//       body: Center(
//         child: Text(
//           'If the body is specified, ',
//           style: TextStyle(fontStyle: FontStyle.italic),
//         ),
//       ),
//       title: 'This is Ignored',
//       desc: 'This is also Ignored',
//       btnOkOnPress: () {},
//     )..show();
//   }
//
//   Future<void> registerUser() async {
//     var auth = FirebaseAuth.instance;
//     UserCredential user = await auth.createUserWithEmailAndPassword(
//         email: emailController!.text, password: passwordController!.text);
//   }
// }
class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isLoading = false;
    return Scaffold(
      backgroundColor: const Color(0xffDFECDB),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey, // Single Form widget with _formKey
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.08),
                  Text("Sign Up", style: theme.textTheme.titleLarge),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  CustomTextFormField(
                    icon: Icon(Icons.person),
                    hintText: 'Full name',
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'password is not valid';
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    controller: emailController,
                    icon: Icon(Icons.email),
                    hintText: 'Email',
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'password is not valid';
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    controller: passwordController,
                    icon: Icon(Icons.password_outlined),
                    hintText: 'Password',
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'password is not valid';
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    icon: Icon(Icons.password_outlined),
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value!.length < 6 ||
                          passwordController!.text != value) {
                        return 'password not match';
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  CustomElevatedButton(
                    buttonTitle: 'Sign Up',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await registerUser();
                          AwesomeDialog(
                            dismissOnTouchOutside: false,
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: 'Sign Up',
                            desc: 'Sign up Successfully',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              Navigator.pushReplacementNamed(
                                  context, PageRoutesName.layout);
                            },
                          ).show();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            // Handle weak password
                          } else if (e.code == 'email-already-in-use') {
                            AwesomeDialog(
                              dismissOnTouchOutside: false,
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'Sign Up',
                              desc: 'Email already in use',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                  CustomTextButton(
                    onPressed: () async {},
                    text1: "Already have an account? ",
                    text2: "Sign in",
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void dialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.info,
      body: Center(
        child: Text(
          'If the body is specified, ',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: emailController!.text,
      password: passwordController!.text,
    );
  }
}
