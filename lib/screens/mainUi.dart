import 'package:bdots/provider/data.dart';
import 'package:bdots/widgets/getContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MainUi extends StatefulWidget {
  const MainUi({Key? key}) : super(key: key);

  @override
  State<MainUi> createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    Provider.of<UserDataList>(context).fetchApiData();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataList>(context).userData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'List of Users',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: (userData.isEmpty)
          ? Center(
              child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_8y9IYf.json',
              ),
            )
          : SafeArea(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      getContainer(userData[index]),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: userData.length)),
    );
  }
}
