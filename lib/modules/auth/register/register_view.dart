import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/widget/custom_elevated_button.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController? emailController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              key: formKey,
              child: Column(
                children: [
                  // SizedBox(height: constraints.maxHeight * 0.08),
                  SizedBox(height: constraints.maxHeight * 0.08),
                  Text("Sign Up", style: theme.textTheme.titleLarge),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          icon: Icon(Icons.remove_red_eye),
                          hintText: 'Email',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'password is not valid';
                            }
                          },
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          icon: Icon(Icons.email),
                          hintText: 'Full name',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'password is not valid';
                            }
                          },
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          icon: Icon(Icons.email),
                          hintText: 'Password',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'password is not valid';
                            }
                          },
                        ),
                        const SizedBox(height: 8.0),
                        CustomTextFormField(
                          icon: Icon(Icons.email),
                          hintText: 'Password',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'password is not valid';
                            }
                          },
                        ),
                        const SizedBox(height: 16.0),
                        CustomElevatedButton(
                          buttonTitle: 'Sign Up',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              // formKey.currentState!.save();
                            }
                          },
                        ),
                        CustomTextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await registerUser();
                                showSnackBar(
                                    context, '✔️  success', Colors.green);
                                Navigator.pushReplacementNamed(
                                    context, PageRoutesName.layout);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showSnackBar(context, '❌  weak password',
                                      Colors.redAccent);
                                } else if (e.code == 'email-already-in-use') {
                                  showSnackBar(
                                      context,
                                      'The account already exists',
                                      const Color(0xdbf5dc4d));
                                }
                              }
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          text1: "Already have an account? ",
                          text2: "Sign in",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void showSnackBar(BuildContext context, String title, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(title),
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
    )..show();
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: emailController!.text, password: passwordController!.text);
  }
}
