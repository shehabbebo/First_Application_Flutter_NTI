import 'package:ToDoApp/Features/Home/cubit/home_notask/home_cubit.dart';
import 'package:ToDoApp/core/cashe/cache_data.dart';
import 'package:ToDoApp/core/cashe/cache_helper.dart';
import 'package:ToDoApp/core/constant/app_constant.dart';
import 'package:ToDoApp/core/translation/translation_helper.dart';
import 'package:ToDoApp/core/utils/Routes.dart';
import 'package:ToDoApp/core/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: GetMaterialApp(
        locale: Locale(CacheData.lang!),
        translations: TranslationHelper(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: AppConstants.fontFamily),
        onGenerateRoute: appRouter.generateRouter,
        initialRoute: Routes.Splash_view,
      ),
    );
  }
}
