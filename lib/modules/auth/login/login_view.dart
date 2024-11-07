import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/email_validetor.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/widget/custom_elevated_button.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? emailController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isObscure = true;

    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(
                    "assets/image/Loginimage.png",
                    height: 150,
                    width: 350,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Text("Sign In", style: theme.textTheme.titleLarge),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          icon: const Icon(Icons.email),
                          hintText: 'Email',
                          validator: (value) {
                            if (!(emailValid(value!))) {
                              return 'email is not valid';
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CustomTextFormField(
                            icon: IconButton(
                                icon: Icon(isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isObscure=!isObscure;
                                  });
                                }),

                            obscureText: isObscure,
                            controller: passwordController,
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'password is not valid';
                              }
                            },
                          ),
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
                                showSnackBar(
                                    context, '✔️  success', Colors.green);
                                Navigator.pushReplacementNamed(
                                    context, PageRoutesName.layout);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showSnackBar(context, '❌  weak password',
                                      Colors.redAccent);
                                }
                                // else if (e.code == 'email-already-in-use') {
                                //   showSnackBar(
                                //       context,
                                //       'The account already exists',
                                //       const Color(0xdbf5dc4d));
                                // }
                              }
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?',
                              style: theme.textTheme.bodySmall),
                        ),
                        CustomTextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PageRoutesName.register);
                            },
                            text1: "Don’t have an account? ",
                            text2: "Sign Up"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: emailController!.text, password: passwordController!.text);
  }
}
