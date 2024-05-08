import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page/home_page.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/widgets/text_field/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Olyx',
                  style: GoogleFonts.zenDots(
                    fontSize: 70,
                    color: AppColors.primary,
                  ),
                ),
                const CustomTextFieldWidget(
                  isSecret: false,
                  prefixIcon: Icons.mail_outline_outlined,
                  hintText: 'Login',
                ),
                const CustomTextFieldWidget(
                    isSecret: true,
                    prefixIcon: Icons.lock_outline,
                    hintText: 'Senha'),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.maxFinite, 50),
                    padding: const EdgeInsets.all(0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
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
