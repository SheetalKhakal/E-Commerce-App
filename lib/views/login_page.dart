import 'package:e_commerce_app/resources/color.dart';
import 'package:e_commerce_app/resources/font_manager.dart';
import 'package:e_commerce_app/resources/styles_manager.dart';
import 'package:e_commerce_app/resources/values_manager.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';
//ignore_for_file: prefer_const_constructors

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _loginFormKey = GlobalKey();
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
      //width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSaved: (newValue) {
                setState(() {
                  username = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username.';
                }
              },
              decoration: InputDecoration(
                //       hintText: "Username",
                labelText: username,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey, // Focused border color
                    width: 1.0, // Focused border width
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey, // Enabled border color
                    width: 1.0, // Enabled border width
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
              onSaved: (newValue) {
                setState(() {
                  password = newValue;
                });
              },
              obscureText: _obscureText,
              validator: (value) {
                if (value == null || value.length < 5) {
                  return 'Enter valid password.';
                }
              },
              decoration: InputDecoration(
                //  hintText: "Password",
                labelText: password,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                  borderSide: BorderSide(
                    color: ColorManager.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey, // Focused border color
                    width: 1.0, // Focused border width
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey, // Enabled border color
                    width: 1.0, // Enabled border width
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager
                        .grey, // Update with ColorManager.grey if applicable
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

          bool result = await AuthService().login(username!, password!);

          print(result);

          if (result) {
            Navigator.pushReplacementNamed(context, "/home");
          } else {
            StatusAlert.show(context,
                duration: Duration(seconds: 2),
                title: 'Login failed.',
                subtitle: 'Please try again',
                configuration: IconConfiguration(icon: Icons.error),
                maxWidth: 260);
          }

          // print("$username- $password");
          //DummyJsonApi Auth- username- 'emilys'
          //password- 'emilyspass'
        }
      },
    );
  }
}


// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   GlobalKey<FormState> _loginFormKey = GlobalKey();

//   String? username, password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Login'),
//       ),
//       body: SafeArea(
//         child: _buildUI(),
//       ),
//     );
//   }

//   Widget _buildUI() {
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _tittle(),
//           _loginForm(),
//         ],
//       ),
//     );
//   }

//   Widget _tittle() {
//     return Text(
//       'E - Commerce App',
//       style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
//     );
//   }

//   Widget _loginForm() {
//     return SizedBox(
//       height: MediaQuery.sizeOf(context).height * 0.30,
//       width: MediaQuery.sizeOf(context).width * 0.90,
//       child: Form(
//         key: _loginFormKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               initialValue: "mor_2314",
//               onSaved: (newValue) {
//                 setState(() {
//                   username = newValue;
//                 });
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter username.';
//                 }
//               },
//               decoration: InputDecoration(
//                 hintText: "Username",
//               ),
//             ),
//             TextFormField(
//               initialValue: "83r5^_",
//               onSaved: (newValue) {
//                 setState(() {
//                   password = newValue;
//                 });
//               },
//               obscureText: true,
//               validator: (value) {
//                 if (value == null || value.length < 5) {
//                   return 'Enter valid password.';
//                 }
//               },
//               decoration: InputDecoration(
//                 hintText: "Password",
//               ),
//             ),
//             _loginButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _loginButton() {
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width * 0.60,
//       child: ElevatedButton(
//         onPressed: () async {
//           if (_loginFormKey.currentState?.validate() ?? false) {
//             _loginFormKey.currentState?.save();

//             bool result = await AuthService().login(username!, password!);

//             print(result);

//             if (result) {
//               Navigator.pushReplacementNamed(context, "/home");
//             } else {
//               StatusAlert.show(context,
//                   duration: Duration(seconds: 2),
//                   title: 'Login failed.',
//                   subtitle: 'Please try again',
//                   configuration: IconConfiguration(icon: Icons.error),
//                   maxWidth: 260);
//             }

//             // print("$username- $password");
//             //DummyJsonApi Auth- username- 'emilys'
//             //password- 'emilyspass'
//           }
//         },
//         child: Text('Login'),
//       ),
//     );
//   }
// }
