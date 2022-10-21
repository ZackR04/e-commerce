part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = new TextEditingController();
  final passController = new TextEditingController();
  String _messageUser = '';
  String _messagePass = '';
  String _messageError = '';
  bool isLoginProcessing = false;

  Widget _buildTextField(String hint, TextEditingController newController,
      {bool isPassword = false}) {
    return TextFormField(
      controller: newController,
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(hintText: hint),
    );
  }

  Widget _buttonLogin(Size size) {
    return SizedBox(
      child: ButtonWidget(
        onPressed: () {
          setState(() {
            isLoginProcessing = true;
          });
          Future.delayed(const Duration(milliseconds: 3000), () {
            // if (usernameController.text.isEmpty) {
            //   setState(() {
            //     isLoginProcessing = false;
            //   });
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("Username Kosong")));
            // }
            if (userController.text.isEmpty && passController.text.isEmpty) {
              setState(() {
                isLoginProcessing = false;
                _messageUser = '*Username Harus Diisi';
                _messagePass = '*Password Harus Diisi';
              });
            } else if (userController.text.isEmpty) {
              setState(() {
                isLoginProcessing = false;
                _messageUser = '*Username Harus Diisi';
              });
            } else if (passController.text.isEmpty) {
              setState(() {
                isLoginProcessing = false;
                _messagePass = '*Password Harus Diisi';
              });
            } else {
              if (passController.text != '12345678') {
                setState(() {
                  isLoginProcessing = false;
                  _messageError = 'Username atau Password anda salah';
                });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListScreen()));
              }
            }
          });
        },
        isLoading: isLoginProcessing,
        caption: 'Sign In',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextField('Input Username', userController),
          _buildTextField('Input Password', passController, isPassword: true),
          const SizedBox(height: 24),
          _buttonLogin(size)
          // ButtonWidget()
        ],
      )),
    );
  }
}
