import 'package:care_task/care_task_app.dart';
import 'package:care_task/core/routing/app_router.dart';
import 'package:care_task/features/favourite/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   ScreenUtil.ensureScreenSize();
   setupGetIt();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('favourite');
  runApp(CareTaskApp(appRouter: AppRouter()));
}
 