import 'package:flutter/material.dart';
import '../supabase_client.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  String error = '';

  void loginWithPhone() async {
    final phone = phoneController.text.trim();
    final res = await supabase.auth.signInWithOtp(phone: phone);
    if (res.user == null) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => OTPPage(phone: phone),
      ));
    } else {
      setState(() => error = 'Ошибка входа');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Friendships')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Введите номер телефона'),
            TextField(controller: phoneController),
            ElevatedButton(
              onPressed: loginWithPhone,
              child: const Text('Отправить код'),
            ),
            if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}