import 'package:ToDoApp/Features/setting/manager/setting_cubit.dart';
import 'package:ToDoApp/Features/setting/manager/setting_state.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/widgets/custom_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/translation/translation_helper.dart';
import '../../../../core/translation/translation_keys.dart';
import '../../../../core/utils/app_assets.dart';

class Lanuage_view extends StatefulWidget {
  const Lanuage_view({super.key});

  @override
  State<Lanuage_view> createState() => _Lanuage_viewState();
}

class _Lanuage_viewState extends State<Lanuage_view> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.scaffoldBackground,
              leading: IconButton(
                color: AppColor.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Transform(
                  alignment: Alignment.center,
                  transform:
                      LanguageCubit.get(context).isArabic
                          ? Matrix4.rotationY(3.14)
                          : Matrix4.rotationX(0),
                  child: SvgPicture.asset(
                    AppAssets.goBackIcon,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              title: Text(
                TranslationKeys.settingsTitle.tr,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: height * 0.124),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Text(
                        TranslationKeys.languageTitle.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(width: width * 0.23),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),

                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                LanguageCubit.get(context).changeLanguage(true);
                              },
                              child: Stack(
                                children: [
                                  CustomLanguageContainer.getCustomLanguageContainer(
                                    backgroundColor:
                                        LanguageCubit.get(context).isArabic
                                            ? AppColor.primary
                                            : const Color(0xffD9D9D9),
                                    text: TranslationKeys.arabicTitle.tr,
                                    textColor:
                                        LanguageCubit.get(context).isArabic
                                            ? Colors.white
                                            : AppColor.black,
                                    borderRadius:
                                        LanguageCubit.get(context).isArabic
                                            ? BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )
                                            : BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                  ),
                                  if (LanguageCubit.get(context).isArabic)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        margin: EdgeInsets.all(4),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                LanguageCubit.get(
                                  context,
                                ).changeLanguage(false);
                              },
                              child: Stack(
                                children: [
                                  CustomLanguageContainer.getCustomLanguageContainer(
                                    backgroundColor:
                                        !LanguageCubit.get(context).isArabic
                                            ? AppColor.primary
                                            : const Color(0xffD9D9D9),
                                    text: TranslationKeys.englishTitle.tr,
                                    textColor:
                                        !LanguageCubit.get(context).isArabic
                                            ? Colors.white
                                            : AppColor.black,
                                    borderRadius:
                                        LanguageCubit.get(context).isArabic
                                            ? BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            )
                                            : BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                  ),
                                  if (!LanguageCubit.get(context).isArabic)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: AppColor.red,
                                          shape: BoxShape.circle,
                                        ),
                                        margin: EdgeInsets.all(4),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
