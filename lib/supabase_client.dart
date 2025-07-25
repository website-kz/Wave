import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async {
  await Supabase.initialize(
    url: 'https://dsqflsmlegnqanepbfwm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRzcWZsc21sZWducWFuZXBiZndtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM0NzMxNjQsImV4cCI6MjA2OTA0OTE2NH0.4tIaYAF-sIf2geXhAsrBQ-i27LlDcQJUCppOuJlBPHM',
  );
}

final supabase = Supabase.instance.client;