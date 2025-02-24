import 'package:bytedev/app/controllers/auth_controller.dart';
import 'package:bytedev/app/redux/states/app_state.dart';
import 'package:bytedev/app/redux/states/auth_state.dart';
import 'package:bytedev/core/theme/app_theme.dart';
import 'package:bytedev/core/widgets/app_button.dart';
import 'package:bytedev/core/widgets/app_text_field.dart';
import 'package:bytedev/core/widgets/hr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
// Other imports remain the same

class LoginView extends StatelessWidget {
  final AuthController controller;

  const LoginView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.authState,
      builder: (context, authState) {
        final phoneController = TextEditingController();
        final passwordController = TextEditingController();

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Login',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 22 : 25)),
            backgroundColor: Colors.transparent,
            foregroundColor: AppTheme.softWhite,
            leading: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.primary,
                padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
              ),
              icon: Icon(Icons.chevron_left,
                  size: isSmallScreen ? 28 : 32, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05,
                  vertical: screenSize.height * 0.02),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenSize.height * 0.7,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 22 : 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        AppTextField(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                          controller: phoneController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        AppTextField(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          obscureText: true,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        if (authState.error != null)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenSize.height * 0.01),
                            child: Text(
                              authState.error!,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: isSmallScreen ? 14 : 16,
                              ),
                            ),
                          ),
                        _buildRememberMeSection(isSmallScreen, screenSize),
                        SizedBox(height: screenSize.height * 0.03),
                        AppButton(
                          text: 'Login',
                          isLoading: authState.isLoading,
                          shape: RoundedRectangleBorder(),
                          buttonTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmallScreen ? 20 : 25,
                          ),
                          onPressed: () {
                            Get.toNamed('/home');
                          },
                          width: double.infinity,
                        ),
                      ],
                    ),
                    _buildSocialLoginSection(isSmallScreen, screenSize),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRememberMeSection(bool isSmallScreen, Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Checkbox(
                value: true,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (bool? value) {},
              ),
              Flexible(
                child: Text('Keep me signed in',
                    style: TextStyle(fontSize: isSmallScreen ? 14 : 16)),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Get.toNamed('/forgot_password'),
          child: Text('Forgot password',
              style: TextStyle(
                  color: AppTheme.primary, fontSize: isSmallScreen ? 14 : 16)),
        ),
      ],
    );
  }

  Widget _buildSocialLoginSection(bool isSmallScreen, Size screenSize) {
    return Column(
      children: [
        SizedBox(height: screenSize.height * 0.03),
        AppHorizontalLine(text: 'OR'),
        SizedBox(height: screenSize.height * 0.03),
        Center(
          child: GoogleSignInButton(onPressed: () {}),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?',
                style: TextStyle(fontSize: isSmallScreen ? 14 : 16)),
            TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: Text('Sign up',
                  style: TextStyle(
                      color: Color(0xFFFFD1DC),
                      fontSize: isSmallScreen ? 14 : 16)),
            ),
          ],
        ),
      ],
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Button background color
        foregroundColor: Colors.black, // Text color
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Google logo image
          Image.asset(
            'assets/images/google_icon.png',
            height: 30,
          ),
          SizedBox(width: 12),
          Text(
            'Sign in with Google',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
