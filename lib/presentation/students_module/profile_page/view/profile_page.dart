import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';

import '../../../../config/app_config.dart';
import '../../doubt_page/view/doubt_page.dart';
import '../controller/profile_page_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  fetchData() {
    Provider.of<ProfilePageController>(context, listen: false)
        .fetchData(context); // function to fech the details of student who has loged in 
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchData(); // function to get the  datas of student who has logegd in automatically  
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: ColorConstants.gradientColors),
            ),
            child: Consumer<ProfilePageController>(
                builder: (context, controller, _) {
              return controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: ColorConstants.secondaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: controller
                                                  .profileModel.data?.image ==
                                              null
                                          ? NetworkImage("${AppConfig.noImage}")
                                          : NetworkImage(
                                              "${AppConfig.mediaUrl}${controller.profileModel.data?.image}"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                  "assets/images/uts_logo_shape.png",
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "${controller.profileModel.data?.firstName} ${controller.profileModel.data?.middleName} ${controller.profileModel.data?.lastName}",
                              style: TextStyle(
                                  fontFamily: "Nexa Bold",
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "DOB:${controller.profileModel.data?.dateOfBirth} ",
                              style: TextStyle(
                                  fontFamily: "Nexa Bold", fontSize: 30),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Blood: ${controller.profileModel.data?.bloodGroup}",
                              style: TextStyle(
                                  fontFamily: "Nexa Bold", fontSize: 30),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "📞 ${controller.profileModel.data?.phoneNumber}",
                              style: TextStyle(
                                  fontFamily: "Nexa Bold", fontSize: 30),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${controller.profileModel.data?.department}",
                              style: TextStyle(
                                  fontFamily: "Nexa Bold", fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${controller.profileModel.data?.batch}",
                              style: TextStyle(
                                  fontFamily: "Nexa Bold", fontSize: 20),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        Image.network(
                          "${AppConfig.mediaUrl}${controller.profileModel.data?.barcode}",
                          height: 200,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoubtPage()));
                          },
                          child: Text(
                            "Note:Click here if you have any doubt or clarification",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ColorConstants.mainWhite,
                                decorationColor: ColorConstants.mainWhite),
                          ),
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
