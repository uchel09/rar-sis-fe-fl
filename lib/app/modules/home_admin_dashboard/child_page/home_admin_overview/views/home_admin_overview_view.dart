import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Import komponen dashboard agar statCard dan komponen lainnya bisa dipakai
import '../../../../../widgets/dashboard_components.dart';
import '../controllers/home_admin_overview_controller.dart';

class HomeAdminOverviewView extends GetView<HomeAdminOverviewController> {
  const HomeAdminOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Agar menyatu dengan background layout utama
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ringkasan Sekolah",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // 1. GRID STATISTIK
            LayoutBuilder(
              builder: (context, constraints) {
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: constraints.maxWidth > 1000
                      ? 4
                      : (constraints.maxWidth > 600 ? 2 : 1),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.5,
                  children: [
                    DashboardComponents.statCard(
                      "Total Siswa",
                      "1,240",
                      Icons.people,
                      Colors.blue,
                    ),
                    DashboardComponents.statCard(
                      "Guru Aktif",
                      "86",
                      Icons.assignment_ind,
                      Colors.green,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 32),

            // 2. AKSI CEPAT (Quick Actions)
            const Text(
              "Aksi Cepat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _quickActionButton(
                  Icons.person_add_alt_1,
                  "Tambah Siswa",
                  Colors.blue,
                ),
                _quickActionButton(
                  Icons.mail_outline,
                  "Kirim Pengumuman",
                  Colors.orange,
                ),
                _quickActionButton(
                  Icons.receipt_long,
                  "Buat Invoice SPP",
                  Colors.green,
                ),
                _quickActionButton(
                  Icons.event_note,
                  "Agenda Sekolah",
                  Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // 3. TABEL AKTIVITAS TERBARU
            const Text(
              "Aktivitas Terbaru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ShadCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: List.generate(
                  5,
                  (index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text("Pendaftaran Siswa Baru #00${index + 1}"),
                    subtitle: const Text("2 jam yang lalu"),
                    trailing: const ShadBadge(child: Text("Sukses")),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk Button Aksi Cepat agar kode build() tetap bersih
  Widget _quickActionButton(IconData icon, String label, Color color) {
    return ShadButton.outline(
      onPressed: () {
        // Logika aksi cepat bisa ditaruh di controller
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
