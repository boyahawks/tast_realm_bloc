import 'package:ehp/v2/components/home/widgets/container_icon.dart';
import 'package:flutter/material.dart';

import '../../helper/utils/state_util.dart';
import '../crossblock/view/crossblock_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PMS MOBILE"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 30.0,
                spacing: 30.0,
                children: [
                  ContainerIcon(
                    text: "RKH",
                    icon: Icons.fact_check_outlined,
                    color: const Color(0xFFF38118),
                    onPressed: () {},
                  ),
                  ContainerIcon(
                    text: "SCAN QR",
                    icon: Icons.qr_code,
                    color: const Color(0xFF9A7822),
                    onPressed: () {},
                  ),
                  ContainerIcon(
                    text: "BKM",
                    icon: Icons.assignment_outlined,
                    color: const Color(0xFF0B572C),
                    onPressed: () {},
                  ),
                  ContainerIcon(
                    text: "KEHADIRAN",
                    icon: Icons.person_add_alt,
                    color: const Color(0xFFF38118),
                    onPressed: () {},
                  ),
                  ContainerIcon(
                    text: "CROSSBLOCK",
                    icon: Icons.inventory_outlined,
                    color: const Color(0xFF621F33),
                    onPressed: () {
                      Get.to(context: context, page: const CrossblockView());
                    },
                  ),
                  ContainerIcon(
                    text: "DOWNLOAD",
                    icon: Icons.file_download_outlined,
                    color: const Color(0xFF554FA0),
                    onPressed: () {},
                  ),
                  ContainerIcon(
                    text: "TAKSASI",
                    icon: Icons.assessment,
                    color: Colors.cyan,
                    onPressed: () {},
                  ),
                  ContainerIcon(
                    text: "UPLOAD",
                    icon: Icons.file_upload_outlined,
                    color: Colors.indigo,
                    onPressed: () {},
                  ),
                ],
              ),
              const Spacer(),
              const Text("Version 1.1.0"),
            ],
          ),
        ),
      ),
    );
  }
}
