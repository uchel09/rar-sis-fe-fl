import 'dart:ui'; // <--- Tambahan buat mouse drag
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// --- BEHAVIOR BIAR MOUSE BISA DRAG (Taruh luar class) ---
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

class UniversalProfileDetail extends StatelessWidget {
  final String id;
  final String title;

  const UniversalProfileDetail({
    super.key,
    required this.id,
    this.title = 'Detail Profil Admin',
  });

  Future<Map<String, dynamic>> _fetchFullDummyData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      "id": id,
      "schoolId": "SCH-2026-REG-01",
      "dob": DateTime(1992, 08, 15).toIso8601String(),
      "birthPlace": "Jakarta Selatan",
      "nik": "3171012345670001",
      "nip": "199208152024011002",
      "hireDate": DateTime(2024, 01, 10).toIso8601String(),
      "employeeType": "PERMANENT",
      "workStatus": "ACTIVE",
      "employeeEndStatus": "NONE",
      "hireEnd": null,
      "phone": "081299887766",
      "user": {
        "fullName": "Rizky Ramadhan, M.Pd",
        "email": "rizky.admin@sekolah.id",
        "imageUrl": "https://i.pravatar.cc/150?u=$id",
        "gender": "MALE",
        "fileUrl":
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
        "address":
            "Jl. Pendidikan No. 45, Menteng, Jakarta Pusat, DKI Jakarta 10310",
        "role": "School_Admin",
      },
      "schoolLevelAccess": [
        {"levelName": "SD"},
        {"levelName": "SMP"},
        {"levelName": "SMA"},
      ],
      "createdAt": DateTime.now()
          .subtract(const Duration(days: 400))
          .toIso8601String(),
      "updatedAt": DateTime.now().toIso8601String(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final ctx = Get.context!;
    final ScrollController _scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = Get.width;
        final double screenHeight = Get.height;
        final bool isMobile = screenWidth < 1024;

        final double targetWidth = isMobile
            ? screenWidth * 0.95
            : screenWidth * 0.8;
        final double targetHeight = isMobile
            ? screenHeight * 0.95
            : screenHeight * 0.9;

        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: ShadTheme.of(ctx).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ScrollConfiguration(
            // <--- Tambahan biar bisa tarik mouse
            behavior: MyCustomScrollBehavior(),
            child: Container(
              width: targetWidth,
              height: targetHeight,
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder<Map<String, dynamic>>(
                      future: _fetchFullDummyData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: SpinKitRotatingCircle(
                              color: Colors.blue,
                              size: 50,
                            ),
                          );
                        }

                        final data = snapshot.data!;
                        final user = data["user"];

                        return Scrollbar(
                          thumbVisibility: true,
                          controller: _scrollController,
                          interactive: true,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            physics:
                                const AlwaysScrollableScrollPhysics(), // <--- Biar ditarik enak
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                _buildTopHeader(ctx, user, isMobile),
                                SizedBox(height: !isMobile ? 10 : 20),
                                _buildAccessSection(ctx, data, isMobile),
                                SizedBox(height: !isMobile ? 50 : 20),
                                if (!isMobile)
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: _buildPersonalSection(ctx, data),
                                      ),
                                      const SizedBox(width: 60),
                                      Expanded(
                                        child: _buildJobSection(ctx, data),
                                      ),
                                    ],
                                  )
                                else
                                  Column(
                                    children: [
                                      _buildPersonalSection(ctx, data),
                                      const SizedBox(height: 32),
                                      _buildJobSection(ctx, data),
                                    ],
                                  ),
                                const SizedBox(height: 20),
                                const Divider(),
                                const SizedBox(height: 30),
                                _buildFileSection(ctx, data, isMobile),
                                const SizedBox(height: 50),
                                _buildTimestamps(ctx, data),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // --- SEMUA SUB-WIDGETS ASLI LO (GAK GUE SENTUH) ---

  Widget _buildTopHeader(
    BuildContext ctx,
    Map<String, dynamic> user,
    bool isMobile,
  ) {
    final photoUrl = user["imageUrl"];
    Widget avatar = CircleAvatar(
      radius: isMobile ? 90 : 120,
      backgroundColor: ShadTheme.of(ctx).colorScheme.muted,
      backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
      child: photoUrl == null
          ? Icon(LucideIcons.user, size: isMobile ? 60 : 80)
          : null,
    );

    Widget infoText = Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          user["fullName"] ?? "-",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: ShadTheme.of(ctx).textTheme.h1.copyWith(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          user["email"] ?? "-",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: ShadTheme.of(
            ctx,
          ).textTheme.muted.copyWith(fontSize: isMobile ? 18 : 22),
        ),
        const SizedBox(height: 12),
        _buildRoleBadge(user["role"]),
      ],
    );

    return isMobile
        ? Column(children: [avatar, const SizedBox(height: 24), infoText])
        : Padding(
            padding: EdgeInsetsGeometry.only(left: 20, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar,
                const SizedBox(width: 40),
                Expanded(child: infoText),
              ],
            ),
          );
  }

  Widget _buildRoleBadge(String? role) {
    String label;
    switch (role) {
      case 'SUPER_ADMIN':
        label = 'Super Admin';
        break;
      case 'School_Admin':
        label = 'Admin Sekolah';
        break;
      case 'Head_Master':
        label = 'Kepala Sekolah';
        break;
      case 'Teacher':
        label = 'Guru';
        break;
      case 'Staff':
        label = 'Staf Kepegawaian';
        break;
      case 'Student':
        label = 'Siswa';
        break;
      default:
        label = role ?? '-';
    }
    return ShadBadge(
      backgroundColor: const Color(0xFF0EA5E9),
      hoverBackgroundColor: const Color(0xFF0284C7),
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: 150,
        height: 35,
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalSection(BuildContext ctx, Map<String, dynamic> data) {
    final u = data["user"];
    return _sectionTemplate(ctx, 'Informasi Pribadi', LucideIcons.user, [
      _itemInfo(ctx, 'NIK', data["nik"]),
      _itemInfo(ctx, 'Tempat Lahir', data["birthPlace"]),
      _itemInfo(ctx, 'Tgl Lahir', _fmt(data["dob"])),
      _itemInfo(
        ctx,
        'Gender',
        u["gender"] == "MALE" ? "Laki-laki" : "Perempuan",
      ),
      _itemInfo(ctx, 'No. HP', data["phone"]),
      _itemInfo(ctx, 'Alamat', u["address"], isLong: true),
    ]);
  }

  Widget _buildJobSection(BuildContext ctx, Map<String, dynamic> data) {
    return _sectionTemplate(ctx, 'Data Kepegawaian', LucideIcons.briefcase, [
      _itemInfo(ctx, 'NIP', data["nip"]),
      _itemInfo(ctx, 'Tipe Pegawai', data["employeeType"]),
      _itemInfo(ctx, 'Status Kerja', data["workStatus"]),
      _itemInfo(ctx, 'Mulai Kerja', _fmt(data["hireDate"])),
      _itemInfo(
        ctx,
        'Selesai Kerja',
        data["hireEnd"] != null ? _fmt(data["hireEnd"]) : "-",
      ),
      _itemInfo(
        ctx,
        'Status Akhir',
        data["employeeEndStatus"] == "NONE"
            ? "Aktif"
            : data["employeeEndStatus"],
      ),
    ]);
  }

  Widget _buildAccessSection(
    BuildContext ctx,
    Map<String, dynamic> data,
    bool isMobile,
  ) {
    final access = (data["schoolLevelAccess"] as List?) ?? [];
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Akses Jenjang Sekolah",
          style: ShadTheme.of(
            ctx,
          ).textTheme.small.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: access
              .map((e) => ShadBadge(child: Text(e["levelName"] ?? "-")))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildFileSection(
    BuildContext ctx,
    Map<String, dynamic> data,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Dokumen Lampiran",
          style: ShadTheme.of(
            ctx,
          ).textTheme.small.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ShadButton.outline(
          leading: const Icon(LucideIcons.fileText, size: 16),
          onPressed: () {},
          child: const Text("Unduh/Lihat Dokumen(PDF)"),
        ),
      ],
    );
  }

  Widget _buildTimestamps(BuildContext ctx, Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ShadTheme.of(ctx).colorScheme.muted.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Dibuat: ${_fmt(data["createdAt"])}",
            style: ShadTheme.of(ctx).textTheme.muted.copyWith(fontSize: 11),
          ),
          Text(
            "Update Terakhir: ${_fmt(data["updatedAt"])}",
            style: ShadTheme.of(ctx).textTheme.muted.copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _sectionTemplate(
    BuildContext ctx,
    String title,
    IconData icon,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 22, color: Colors.blue),
            const SizedBox(width: 10),
            Text(title, style: ShadTheme.of(ctx).textTheme.h4),
          ],
        ),
        const Divider(height: 30),
        ...children,
      ],
    );
  }

  Widget _itemInfo(
    BuildContext ctx,
    String label,
    dynamic value, {
    bool isLong = false,
  }) {
    final String val = (value == null || value.toString().isEmpty)
        ? "-"
        : value.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: isLong
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: ShadTheme.of(ctx).textTheme.muted.copyWith(fontSize: 14),
            ),
          ),
          const Text(" :   ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              val,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(dynamic date) {
    if (date == null) return "-";
    final d = DateTime.tryParse(date.toString());
    if (d == null) return "-";
    return DateFormat('dd MMMM yyyy').format(d);
  }
}
