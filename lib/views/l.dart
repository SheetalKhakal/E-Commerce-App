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