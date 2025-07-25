import 'package:flutter/material.dart';
import '../supabase_client.dart';
import '../home/home_page.dart';

class OTPPage extends StatefulWidget {
  final String phone;
  const OTPPage({super.key, required this.phone});
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final codeController = TextEditingController();
  String error = '';

  void verify() async {
    final res = await supabase.auth.verifyOTP(
      phone: widget.phone,
      token: codeController.text.trim(),
      type: OtpType.sms,
    );
    if (res.user != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } else {
      setState(() => error = 'Неверный код');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Код подтверждения')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Введите код из SMS'),
            TextField(controller: codeController),
            ElevatedButton(onPressed: verify, child: const Text('Подтвердить')),
            if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}