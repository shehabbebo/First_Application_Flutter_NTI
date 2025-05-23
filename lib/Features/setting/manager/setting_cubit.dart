import 'package:ToDoApp/Features/setting/manager/setting_state.dart';
import 'package:ToDoApp/core/translation/translation_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()) {
    _checkCurrentLanguage();
  }

  static LanguageCubit get(context) => BlocProvider.of(context);

  void _checkCurrentLanguage() {
    final isArabic = Get.locale?.languageCode == 'ar';
    if (isArabic) {
      emit(ArabicLanguageState());
    } else {
      emit(EnglishLanguageState());
    }
  }

  void changeLanguage(bool toArabic) {
    TranslationHelper.changeLanguage(toArabic);
    if (toArabic) {
      emit(ArabicLanguageState());
    } else {
      emit(EnglishLanguageState());
    }
  }

  bool get isArabic => state is ArabicLanguageState;
}
