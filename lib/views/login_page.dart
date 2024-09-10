import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/resources/values_manager.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';
//ignore_for_file: prefer_const_constructors

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p14),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tittle(),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _tittle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s100),
        Text(
          'Login',
          style: getBoldStyle(
              color: ColorManager.black_text, fontSize: FontSize.s32),
        ),
        Text(
          'Welcome back to E-Commerce App',
          style: getMediumStyle(color: ColorManager.dark_grey),
        ),
      ],
    );
  }

  Widget _loginForm() {
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p60),
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: getMediumStyle(color: ColorManager.black_text),
            ),
            TextFormField(
              initialValue: "mor_2314",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onSaved: (newValue) {
                username = newValue?.trim(); // Save trimmed username
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username.';
                }
                return null;
              },
              decoration: InputDecoration(
                //   labelText: "Username",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppPadding.p20),
            Text(
              "Password",
              style: getMediumStyle(color: ColorManager.black_text),
            ),
            TextFormField(
              initialValue: "83r5^_",
              obscureText: _obscureText,
              onSaved: (newValue) {
                password = newValue?.trim(); // Save trimmed password
              },
              validator: (value) {
                if (value == null || value.length < 5) {
                  return 'Enter a valid password.';
                }
                return null;
              },
              decoration: InputDecoration(
                //    labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                    width: 1.0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: AppPadding.p40),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return CustomElevatedButton(
      buttonText: 'Login',
      onPressed: () async {
        if (_loginFormKey.currentState?.validate() ?? false) {
          _loginFormKey.currentState?.save();

          if (username != null && password != null) {
            bool result = await AuthService().login(username!, password!);

            if (result) {
              ToastMessage.show("Login Successfully");
              Navigator.pushReplacementNamed(context, "/home");
            } else {
              StatusAlert.show(context,
                  duration: Duration(seconds: 2),
                  title: 'Login failed.',
                  subtitle: 'Please try again',
                  configuration: IconConfiguration(icon: Icons.error),
                  maxWidth: 260);
            }
          } else {
            StatusAlert.show(context,
                duration: Duration(seconds: 2),
                title: 'Invalid input',
                subtitle: 'Please enter both username and password',
                configuration: IconConfiguration(icon: Icons.error),
                maxWidth: 260);
          }
        }
      },
    );
  }
}
