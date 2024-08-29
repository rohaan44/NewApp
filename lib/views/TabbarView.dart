import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/widgets/GrowCircle.dart';

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
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxHeight: 370, minHeight: 200, maxWidth: 450, minWidth: 200),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorUtil.bgblue,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color(0xff3894FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  controller: tabController,
                  tabs: const [
                    Tab(text: 'Services'),
                    Tab(text: 'Transactions'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildListTile(
                          icon: Icons.refresh,
                          title: "Easy Load",
                          subtitle: "Get instant mobile load on single click.",
                        ),
                        _buildListTile(
                          icon: Icons.receipt_long,
                          title: "Bill Payments",
                          subtitle:
                              "Pay your all utility bills using Pay Sense.",
                          // image: DummyImg.bill,
                        ),
                        _buildListTile(
                          icon: Icons.splitscreen,
                          title: "Bill Split",
                          subtitle: "Split your bills with friends.",
                        ),
                        _buildListTile(
                          icon: Icons.add,
                          title: "More",
                          subtitle: "Explore more Pay Sense services.",
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "Transactions",
                      style: TextStyle(color: ColorUtil.whitecolor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    String? image,
  }) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(151, 33, 149, 243),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff3894FF),
          child: image != null
              ? SvgPicture.asset(
                  image,
                  color: ColorUtil.whitecolor,
                )
              : Icon(
                  icon,
                  color: ColorUtil.whitecolor,
                ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorUtil.whitecolor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: ColorUtil.whitecolor,
        ),
      ),
    );
  }
}
