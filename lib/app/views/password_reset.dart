import 'package:bytedev/app/controllers/auth_controller.dart';
import 'package:bytedev/app/redux/states/app_state.dart';
import 'package:bytedev/app/redux/states/auth_state.dart';
import 'package:bytedev/core/theme/app_theme.dart';
import 'package:bytedev/core/widgets/app_button.dart';
import 'package:bytedev/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/route_manager.dart';

class PasswordReset extends StatelessWidget {
  final AuthController controller;

  const PasswordReset({super.key, required this.controller});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height * 0.07),
                    Text(
                      'Create new password',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 22 : 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Your new password must be different\nfrom previous passwords',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24.0), // Slightly less space than before
                    SizedBox(height: 4.0), // Reduce space
                    AppTextField(
                      labelText: "New Password",
                      labelStyle: TextStyle(
                        color: Colors.black, // Darken label text
                        fontSize: 20, // Smaller label text
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: 'Must be at least 8 characters',
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),

                    SizedBox(height: 16.0), // Adjust space between fields

                    // Confirm Password
                    
                    SizedBox(height: 4.0), // Reduce space
                    AppTextField(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        color: Colors.black, // Darken label text
                        fontSize: 20,
                        fontWeight: FontWeight.bold, 
                      ),
                      hintText: 'Both passwords must match',
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: true,
                    ),

                    SizedBox(height: 24.0), // Adjust button spacing

                    // Button
                    AppButton(
                      text: 'Reset Password', // Match Figma text
                      isLoading: authState.isLoading,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Add softer corners
                      ),
                      buttonTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Reduce button font size
                      ),
                      onPressed: () {
                        Get.toNamed('/home');
                      },
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
