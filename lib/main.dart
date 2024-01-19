import 'package:flutter/material.dart';
import 'package:reddit_task/di/app_injector.dart';
import 'package:reddit_task/reddit_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const RedditApp());
}
