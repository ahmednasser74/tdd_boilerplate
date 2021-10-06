import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/src/widgets/loading_indicator_widget.dart';
import '../../../../core/utils/validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/widgets/custom_button.dart';
import '../widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.getLoadingIndicator,
        progressIndicator: LoadingIndicatorWidget(),
        child: Scaffold(
          body: Form(
            key: controller.loginFormKey,
            child: ListView(
              padding: EdgeInsets.only(top: .10.sh, left: 10, right: 10),
              children: [
                SizedBox(height: .02.sh),
                Center(
                  child: Image.asset(
                    'assets/images/toast_icon.png',
                    height: .24.sh,
                  ),
                ),
                SizedBox(height: .06.sh),
                Column(
                  children: [
                    TextFieldWidget(
                      controller: controller.userNameTEC,
                      hint: 'Login',
                      inputType: TextInputType.text,
                      prefixIcon: Icons.person_outline,
                      validator: CustomValidator.userNameValidation,
                    ),
                    SizedBox(height: .02.sh),
                    TextFieldWidget(
                      controller: controller.passwordTEC,
                      hint: 'Password',
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                      validator: CustomValidator.passwordValidator,
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () {},
                  title: 'Forget password?',
                  alignment: Alignment.centerLeft,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                CustomButton(
                  title: 'Login',
                  marginHorizontal: .02.sh,
                  onPressed: controller.login,
                ),
                SizedBox(height: .16.sh),
                CustomButton(
                  onPressed: () {},
                  title: 'Forget password?',
                  alignment: Alignment.center,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'don’t have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' \nSignUp!',
                          style: textTheme.headline2!.copyWith(
                              color: CustomColors.primaryColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
