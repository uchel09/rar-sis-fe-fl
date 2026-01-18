import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/supad_admin_controller.dart';
import '../../../../../services/school_admin/school_admin_model.dart';
import '../../../../../core/enum.dart';

class SupadAdminView extends GetView<SupadAdminController> {
  const SupadAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('School Admin Management')),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daftar Administrator",
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  ShadButton(
                    onPressed: () => _openForm(context, null),
                    child: const Text("Add New Admin"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ShadTable(
                  columnCount: 4,
                  rowCount: controller.admins.length,
                  // SOLUSI: Jika columnWidths/layout error, kita biarkan ShadTable
                  // menghitung lebar otomatis (auto-layout) agar tidak error parameter.
                  header: (context, column) {
                    final labels = ['Nama', 'Email', 'Status', 'Aksi'];
                    return ShadTableCell(
                      child: Text(
                        labels[column],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  builder: (context, index) {
                    final a = controller.admins[index.row];
                    switch (index.column) {
                      case 0:
                        return ShadTableCell(child: Text(a.user.fullName));
                      case 1:
                        return ShadTableCell(child: Text(a.user.email));
                      case 2:
                        return ShadTableCell(
                          child: ShadBadge(child: Text(a.status.name)),
                        );
                      case 3:
                        return ShadTableCell(
                          child: Row(
                            children: [
                              ShadButton.ghost(
                                width: 32,
                                height: 32,
                                padding: EdgeInsets.zero,
                                onPressed: () => _openForm(context, a),
                                child: const Icon(Icons.edit, size: 16),
                              ),
                              ShadButton.ghost(
                                width: 32,
                                height: 32,
                                padding: EdgeInsets.zero,
                                onPressed: () => controller.deleteAdmin(a.id),
                                child: const Icon(
                                  LucideIcons.trash,
                                  size: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      default:
                        return const ShadTableCell(child: SizedBox());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openForm(BuildContext context, SchoolAdminResponse? a) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(a == null ? 'Tambah Admin' : 'Edit Admin'),
        child: Container(
          width: 600,
          // Tambahkan ConstrainedBox agar tidak overflow di layar kecil
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ShadForm(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Informasi Akun"),
                  Row(
                    children: [
                      Expanded(
                        child: ShadInputFormField(
                          id: 'fullName',
                          label: const Text('Nama'),
                          initialValue: a?.user.fullName,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ShadInputFormField(
                          id: 'email',
                          label: const Text('Email'),
                          initialValue: a?.user.email,
                          readOnly: a != null,
                        ),
                      ),
                    ],
                  ),
                  if (a == null) ...[
                    const SizedBox(height: 12),
                    ShadInputFormField(
                      id: 'password',
                      label: const Text('Password'),
                      obscureText: true,
                    ),
                  ],
                  const SizedBox(height: 12),
                  ShadInputFormField(
                    id: 'imageUrl',
                    label: const Text('Image URL'),
                    initialValue: a?.user.imageUrl,
                  ),

                  const Divider(height: 40),
                  _sectionTitle("Data Personal"),
                  Row(
                    children: [
                      Expanded(
                        child: ShadInputFormField(
                          id: 'nik',
                          label: const Text('NIK'),
                          initialValue: a?.nik,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ShadSelectFormField<Gender>(
                          id: 'gender',
                          label: const Text('Gender'),
                          initialValue: a?.user.gender,
                          options: Gender.values
                              .map(
                                (g) =>
                                    ShadOption(value: g, child: Text(g.name)),
                              )
                              .toList(),
                          selectedOptionBuilder: (c, v) => Text(v.name),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ShadInputFormField(
                          id: 'birthPlace',
                          label: const Text('Tempat Lahir'),
                          initialValue: a?.birthPlace,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ShadDatePickerFormField(
                          id: 'dob',
                          label: const Text('Tgl Lahir'),
                          initialValue: a?.dob,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 40),
                  _sectionTitle("Status & Akses"),
                  Row(
                    children: [
                      if (a != null)
                        Expanded(
                          child: ShadSelectFormField<EmployeeStatus>(
                            id: 'status',
                            label: const Text('Status'),
                            initialValue: a.status,
                            options: EmployeeStatus.values
                                .map(
                                  (s) =>
                                      ShadOption(value: s, child: Text(s.name)),
                                )
                                .toList(),
                            selectedOptionBuilder: (c, v) => Text(v.name),
                          ),
                        ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ShadInputFormField(
                          id: 'levelAccess',
                          label: const Text('Level Access IDs'),
                          placeholder: const Text("level1, level2"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          ShadButton.outline(
            child: const Text('Batal'),
            onPressed: () => Get.back(),
          ),
          Obx(
            () => ShadButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () => controller.save(a),
              child: controller.isLoading.value
                  ? const Text('Saving...')
                  : const Text('Simpan Data'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
