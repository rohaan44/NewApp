import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabBarVieww extends StatefulWidget {
  const TabBarVieww({super.key});

  @override
  State<TabBarVieww> createState() => _TabBarViewwState();
}

class _TabBarViewwState extends State<TabBarVieww>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxHeight: 370, minHeight: 200, maxWidth: 500, minWidth: 200),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.51,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ColorUtil.bgblue,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      TabBar(dividerColor: Colors.transparent,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                         indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 2,
                        labelStyle: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight
                                .w400), // Set the font size of the selected tab
                        unselectedLabelStyle: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        indicator: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(0xff3894FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Services',
                          ),
                          Tab(
                            text: 'Transactions',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xff3894FF),
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "Easy Load",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "Get instant mobile load on single click.",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color(0xff3894FF),
                            child: Image.asset(
                              DummyImg.bill,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "Bill Payments",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "Pay your all utility bills using Pay Sense.",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xff3894FF),
                            child: Icon(
                              Icons.splitscreen,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "Bill Split",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "Split your bills with friends.",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xff3894FF),
                            child: Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "More",
                            style: GoogleFonts.poppins(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "Explore more Pay Sense services.",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const Text("Checccccck"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
