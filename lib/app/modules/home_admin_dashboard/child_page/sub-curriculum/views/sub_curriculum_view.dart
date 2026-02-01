import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/sub_curriculum_controller.dart';

class SubCurriculumView extends GetView<SubCurriculumController> {
  const SubCurriculumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final curriculums = controller.masterController.allCurriculumActive;

        if (curriculums.isEmpty) {
          return const Center(child: Text('Tidak ada kurikulum aktif'));
        }

        int initialIndex = curriculums
            .indexWhere((c) => c.id == controller.selectedCurriculumId.value)
            .clamp(0, curriculums.length - 1);

        return DefaultTabController(
          length: curriculums.length,
          initialIndex: initialIndex,
          // 👉 Kuncinya ada di Builder supaya kita bisa akses DefaultTabController.of(context)
          child: Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);

              // 👉 Pasang Listener buat deteksi geser atau klik
              tabController.addListener(() {
                if (!tabController.indexIsChanging) {
                  // Update ID di controller saat index berhenti berubah (selesai geser/klik)
                  controller.selectedCurriculumId.value =
                      curriculums[tabController.index].id;
                }
              });

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: ShadTheme.of(
                        context,
                      ).primaryButtonTheme.backgroundColor,
                      labelColor: ShadTheme.of(
                        context,
                      ).primaryButtonTheme.backgroundColor,
                      unselectedLabelColor: Colors.grey,
                      dividerColor: Colors.transparent,
                      tabs: curriculums
                          .map((cur) => Tab(child: Text(cur.name)))
                          .toList(),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: curriculums.map((cur) {
                        return SizedBox.expand(
                          child: ShadCard(
                            title: Text('Daftar Sub Kurikulum - ${cur.name}'),
                            description: const Text(
                              'Kelola detail sub-kurikulum di bawah ini.',
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
