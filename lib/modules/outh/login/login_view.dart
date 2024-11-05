import 'package:flutter/material.dart';
import 'package:todo_app/core/email_validetor.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/modules/outh/register/register_view.dart';
import 'package:todo_app/widget/custom_elevated_button.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                          hintText: 'Email',
                          validator: (value) {
                            if (!(emailValid(value!))) {
                              return 'email is not valid';
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CustomTextFormField(
                            hintText: 'Password',
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'password is not valid';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        CustomElevatedButton(
                          buttonTitle: 'Sign Up',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
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
}
