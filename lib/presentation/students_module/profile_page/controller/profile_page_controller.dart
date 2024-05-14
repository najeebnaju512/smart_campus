import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/repository/api/profile_page/model/profile_model.dart';
import 'package:smart_campus_projects/repository/api/profile_page/service/profile_page_service.dart';

class ProfilePageController extends ChangeNotifier{
  ProfileModel profileModel=ProfileModel();
  bool isLoading = false;
  fetchData(BuildContext context){
    log("ProfilePageController -> fetchData()");
    isLoading = true;
    notifyListeners();
    ProfilePageService.fetchData().then((value) {// fetching data of logged in student
      if(value["status"]==1){
        profileModel = ProfileModel.fromJson(value);
        isLoading=false;
      }else{
        AppUtils.oneTimeSnackBar("Error", context: context);
      }
      notifyListeners();
    });
  }
}