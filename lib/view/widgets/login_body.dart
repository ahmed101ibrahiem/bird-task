import 'package:bird_task/core/constants/app_color.dart';
import 'package:bird_task/core/constants/app_validators.dart';
import 'package:bird_task/view/widgets/social_login_section.dart';
import 'package:bird_task/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/shared/components.dart';
import '../../core/shared/custom_button_widget.dart';
import 'forget_and_pass_section.dart';
import 'login_details_widget.dart';
import 'login_head_section.dart';

class LoginBody extends StatefulWidget {
  LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // Focus Nodes
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // Focus Nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast(message: 'Success Login');
        } else if (state is LoginErrorState) {
          showToast(message: state.message!);
        }
        if (state is LoginLoadingState) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.12),
                const LoginHeadSection(),
                // form login
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // email address
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: textFormBorder(),
                            focusedBorder: textFormBorder(),
                            errorBorder: textFormBorder(),
                            disabledBorder: textFormBorder(),
                            focusedErrorBorder: textFormBorder(),
                            enabledBorder: textFormBorder(),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 18),
                            hintText: "Email Address",
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintStyle: const TextStyle(
                              color: AppColors.textFormColor,
                              fontSize: 14.0,
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: AppColors.textFormColor,
                            ),
                          ),
                          validator: (value) {
                            return AppValidators.emailValidator(value);
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // password
                        TextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 18),
                            border: textFormBorder(),
                            focusedBorder: textFormBorder(),
                            errorBorder: textFormBorder(),
                            disabledBorder: textFormBorder(),
                            focusedErrorBorder: textFormBorder(),
                            enabledBorder: textFormBorder(),
                            filled: true,
                            fillColor: AppColors.textFieldColor,
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: AppColors.textFormColor,
                              fontSize: 14.0,
                            ),
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: AppColors.textFormColor),
                          ),
                          validator: (value) {
                            return AppValidators.passwordValidator(value);
                          },
                          onFieldSubmitted: (value) async {
                            final isValid = _formKey.currentState!.validate();
                            FocusScope.of(context).unfocus();
                            if (isValid) {
                              await cubit.Login(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim());
                            }
                          },
                        ),
                      ],
                    )),
                // remember me
                const LoginForgetAndRememberSection(),
                const SizedBox(
                  height: 24.0,
                ),
                CustomButtonWidget(
                  text: 'Log In',
                  isLoad: isLoading,
                  fun: () async {
                    final isValid = _formKey.currentState!.validate();
                    FocusScope.of(context).unfocus();
                    if (isValid) {
                      await cubit.Login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                    }
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const SocialLoginSection(),

                const LoginDetailsWidget()
              ],
            ),
          ),
        );
      },
    );
  }
}
