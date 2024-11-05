import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/modules/outh/login/login_view.dart';
import 'package:todo_app/widget/custom_elevated_button.dart';
import 'package:todo_app/widget/custom_text_button.dart';
import 'package:todo_app/widget/custom_text_form_field.dart';

class RegisterView extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffDFECDB),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        hintText: 'Email',
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'password is not valid';
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      CustomTextFormField(
                        hintText: 'Full name',
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'password is not valid';
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      CustomTextFormField(
                        hintText: 'Password',
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'password is not valid';
                          }
                        },
                      ),
                      const SizedBox(height: 8.0),
                      CustomTextFormField(
                        hintText: 'Password',
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'password is not valid';
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),
                      // DropdownButtonFormField(
                      //   items: countries,
                      //   icon: const Icon(Icons.expand_more),
                      //   onSaved: (country) {
                      //     // save it
                      //   },
                      //   onChanged: (value) {},
                      //   decoration: const InputDecoration(
                      //     hintText: 'Country',
                      //     filled: true,
                      //     fillColor: Color(0xFFF5FCF9),
                      //     contentPadding: EdgeInsets.symmetric(
                      //         horizontal: 16.0 * 1.5, vertical: 16.0),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.all(Radius.circular(50)),
                      //     ),
                      //   ),
                      // ),

                      CustomElevatedButton(
                        buttonTitle: 'Sign Up',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                          }
                        },
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PageRoutesName.login);
                        },
                        text1: "Already have an account? ",
                        text2: "Sign in",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// only for demo
// List<DropdownMenuItem<String>>? countries = [
//   "Bangladesh",
//   "Switzerland",
//   'Canada',
//   'Japan',
//   'Germany',
//   'Australia',
//   'Sweden',
// ].map<DropdownMenuItem<String>>((String value) {
//   return DropdownMenuItem<String>(value: value, child: Text(value));
// }).toList();
