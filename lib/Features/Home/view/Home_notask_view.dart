import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:two_day_flutter/Features/Home/cubit/home_notask/home_cubit.dart';
import 'package:two_day_flutter/Features/Home/cubit/home_notask/home_state.dart';
import 'package:two_day_flutter/Features/Home/view/Home_taskView.dart';
import 'package:two_day_flutter/core/helper/my_responsive.dart';
import 'package:two_day_flutter/core/translation/translation_keys.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/App_constant.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class Home_notask_view extends StatelessWidget {
  const Home_notask_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: MyResponsive.height(context, value: 80),
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 16),
                  height: MyResponsive.height(context, value: 60),
                  width: MyResponsive.height(context, value: 60),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationKeys.hello.tr,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      if (state is UserGetSuccess)
                        Text(
                          state.userModel.userName ?? 'No Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColor.black,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.AddTask_view,
                    );
                  },
                  icon: const Icon(Icons.add_box_outlined),
                ),
                const SizedBox(height: 90),
              ],
            );
          },
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              "There are no tasks yet,",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontFamily: AppConstants.fontFamily,
              ),
            ),
            Text(
              "Press the button",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontFamily: AppConstants.fontFamily,
              ),
            ),
            Text(
              "To add New Task",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontFamily: AppConstants.fontFamily,
              ),
            ),
            SizedBox(height: 30),
            Image(image: AssetImage(AppAssets.Task), height: 268),
          ],
        ),
      ),
    );
  }
}
