
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {

  PageController pagecontroller=PageController();

  TextEditingController deceased_name = TextEditingController();
  void Nextpage()async{

    await pagecontroller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
    update();
  }
  void priviospage()async{
   await pagecontroller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.bounceIn);

    update();
  }

}