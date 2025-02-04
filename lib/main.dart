import 'package:care_task/care_task_app.dart';
import 'package:care_task/core/routing/app_router.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  await Hive.openBox('favourite');
  runApp(CareTaskApp(appRouter: AppRouter()));
}
