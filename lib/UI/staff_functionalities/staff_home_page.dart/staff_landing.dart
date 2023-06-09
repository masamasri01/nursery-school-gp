// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gp/Providers/Teacher_provider.dart';
import 'package:gp/UI/staff_functionalities/settings.dart';
import 'package:gp/UI/staff_functionalities/staff_home_page.dart/staff_home_page.dart';
import 'package:gp/chat/chat_home_page.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:gp/core/Colors/colors.dart';
import 'package:gp/core/Texts/text.dart';
import 'package:gp/settings_controller.dart/settingscontroller.dart';
import 'package:http/http.dart' as http;

class StaffLanding extends StatefulWidget {
  final token;
  StaffLanding({super.key, required this.token});

  @override
  State<StaffLanding> createState() => _StaffLanding();
}

class _StaffLanding extends State<StaffLanding> {
  int _currentIndex = 0;
  String? userId;
  List mychildrenList = List.filled(50, 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<TeacherProvider>(context, listen: false).setTeacherId();

    // Provider.of<TeacherProvider>(context, listen: false)
    //     .getMyClassChildrenList();

    final List<Widget> _views = [
      StaffHomePage(token: widget.token),
      ChatHomePage(),
      StaffSettings(),
    ];
    SettingsController controller = Provider.of<SettingsController>(context);
    bool isArabic = context.locale == Locale('ar');
    return Scaffold(
      //  backgroundColor: controller.currentAppTheme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.color4,
        unselectedItemColor: Colors.grey,
        //  showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.run_circle),
              label: isArabic ? 'خيارات' : 'Commands'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: isArabic ? 'المحادثة' : 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: isArabic ? 'الإعدادات' : 'Settings')
        ],
      ),
    );
    // } else {
    //   return Scaffold(
    //     body: Center(
    //         child: CircularProgressIndicator(
    //       valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
    //   )),
    //   );
    // }
  }
}

class s1 extends StatelessWidget {
  const s1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('11');
  }
}

class s2 extends StatelessWidget {
  const s2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('2');
  }
}

class s3 extends StatelessWidget {
  const s3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('33');
  }
}
