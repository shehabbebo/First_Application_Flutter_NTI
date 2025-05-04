import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:two_day_flutter/Features/Home/cubit/home_notask/home_cubit.dart';
import 'package:two_day_flutter/core/cashe/cache_helper.dart';
import 'package:two_day_flutter/core/translation/translation_helper.dart';
import 'package:two_day_flutter/core/utils/App_constant.dart';
import 'package:two_day_flutter/core/utils/Routes.dart';
import 'package:two_day_flutter/core/utils/string.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: AppConstants.fontFamily),
        onGenerateRoute: appRouter.generateRouter,
        initialRoute: Routes.AddTask_view,
      ),
    );
  }
}
