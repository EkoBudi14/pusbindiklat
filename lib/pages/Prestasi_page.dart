import 'package:flutter/material.dart';
import 'package:pusbindiklat/pages/prestasi_remaja_page.dart';
import 'package:pusbindiklat/pages/prestasi_sd_page.dart';
import 'package:pusbindiklat/theme.dart';

class PrestasiPage extends StatefulWidget {
  @override
  _PrestasiPageState createState() => _PrestasiPageState();
}

class _PrestasiPageState extends State<PrestasiPage> {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            title: Text(
              "Prestasi",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: Container(
              margin: EdgeInsets.only(left: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              controller: tabController,
              indicatorColor: primaryColor,
              tabs: [
                InkWell(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "SD",
                            style: primaryTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("REMAJA", style: primaryTextStyle),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PrestasiSdPage(),
            PrestasiRemajaPage(),
          ],
        ),
      ),
    );
  }
}
