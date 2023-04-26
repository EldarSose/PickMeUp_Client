import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pickmeup/ui/mobile/mobile_login.dart';
import 'package:pickmeup/ui/windows/windows_register.dart';

class PlatformChooser extends StatelessWidget{
  const PlatformChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return chooseState();
  }
}

chooseState(){
  if(Platform.isAndroid || Platform.isIOS){
      return const MobileLoginForm();
    }else if(Platform.isWindows){
      return const WindowsRegisterForm();
    }
}