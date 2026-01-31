import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/ppdb_registration_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PpdbRegistrationView extends GetView<PpdbRegistrationController> {
  const PpdbRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Obx(() {
        if (controller.isLoading.value && controller.rows.isEmpty) {
          return _buildLoadingState();
        }

        return Column(
          children: [
            _buildHeaderSearch(),
            _buildMainGrid(),
            if (controller.totalPages.value > 0) _buildPaginationBar(),
          ],
        );
      }),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Memuat data...', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildHeaderSearch() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Tentukan threshold untuk mobile (misal: 600px)
        bool isMobile = constraints.maxWidth < 780;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // 1. Search Input (Selalu Utama)
                  Expanded(
                    child: Obx(
                      () => ShadInput(
                        controller: controller.searchController,
                        placeholder: const Text('Cari nama...'),

                        onSubmitted: (value) =>
                            controller.onSearchSubmitted(value),
                        decoration: ShadDecoration(
                          color: Colors.grey[25],
                          border: ShadBorder.all(
                            color: Colors.grey[200]!,
                            radius: const BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: ShadBorder.all(
                            color: Colors.blueAccent,
                          ),
                        ),
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 4, right: 8),
                          child: Icon(
                            LucideIcons.search,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: controller.showSearchClear
                            ? GestureDetector(
                                onTap: controller.clearSearch,
                                child: const Icon(LucideIcons.x, size: 16),
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // 2. Refresh Button (Tetap di samping Search)
                  _buildRefreshButton(),

                  // Kalau Desktop, Create & Export muncul di baris yang sama
                  if (!isMobile) ...[
                    const VerticalDivider(width: 24, indent: 8, endIndent: 8),
                    _buildActionButtons(),
                    const SizedBox(width: 12),
                    _buildLimitDropdown(),
                  ],
                ],
              ),

              // Kalau Mobile, Tombol Aksi pindah ke bawahnya
              if (isMobile) ...[
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildActionButtons(),
                      const SizedBox(width: 12),
                      _buildLimitDropdown(),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  // Helper Widget agar kode tidak menumpuk
  Widget _buildRefreshButton() {
    return Obx(
      () => SizedBox(
        width: 40,
        child: controller.isLoading.value
            ? const Center(child: SpinKitDualRing(color: Colors.blue, size: 18))
            : ShadTooltip(
                anchor: const ShadAnchor(
                  // Offset(x, y): y positif akan menggeser ke bawah
                  offset: Offset(0, 10),
                  // Alignment menentukan titik jangkarnya
                  childAlignment: Alignment.topCenter,
                ),
                builder: (context) => const Text("Refresh"),
                child: ShadButton.ghost(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.zero,
                  child: const Icon(LucideIcons.refreshCcw, size: 20),

                  onPressed: () => controller.refreshData(),
                ),
              ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShadTooltip(
          builder: (context) => const Text("Export Excel"),
          anchor: const ShadAnchor(
            // Offset(x, y): y positif akan menggeser ke bawah
            offset: Offset(0, 10),
            // Alignment menentukan titik jangkarnya
            childAlignment: Alignment.topCenter,
          ),
          child: ShadButton.outline(
            leading: const Icon(LucideIcons.download, size: 18),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 8),
        ShadButton(
          leading: const Icon(LucideIcons.plus, size: 18),
          child: const Text('Tambah Baru'),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildLimitDropdown() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.grey[25],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tampil:',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            ShadSelect<int>(
              decoration: const ShadDecoration(
                border: ShadBorder.none,
                focusedBorder: ShadBorder.none, // Hilangkan border saat fokus
              ),
              minWidth: 80,
              initialValue: controller.limit.value,
              options: controller.limitOptions.map((limit) {
                return ShadOption(value: limit, child: Text('$limit'));
              }).toList(),
              selectedOptionBuilder: (context, value) => Text('$value'),
              onChanged: (value) {
                if (value != null) {
                  controller.changeLimit(value);
                  // Fokus langsung dihilangkan setelah pilih
                  FocusScope.of(Get.context!).unfocus();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainGrid() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: PlutoGrid(
            columns: controller.columns,
            rows: controller.rows,
            onLoaded: controller.onPlutoGridLoaded,
            onChanged: controller.onGridChanged,
            configuration: PlutoGridConfiguration(
              style: PlutoGridStyleConfig(
                gridBorderColor: Colors.transparent,
                gridBackgroundColor: Colors.white,
                borderColor: const Color(0xFFF1F5F9),
                columnHeight: 45,
                rowHeight: 55,
                columnTextStyle: const TextStyle(
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                cellTextStyle: const TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                activatedColor: const Color(0xFFF8FAFC),
                rowColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Info Data
          Obx(
            () => Text(
              ' ${(controller.currentPage.value - 1) * controller.limit.value + 1} - '
              '${(controller.currentPage.value * controller.limit.value > controller.totalRows.value) ? controller.totalRows.value : (controller.currentPage.value * controller.limit.value)} '
              'dari ${controller.totalRows.value} data',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
          ),
          const Spacer(),
          // Prev Button
          IconButton(
            onPressed: controller.canGoPrevious
                ? controller.previousPage
                : null,
            icon: const Icon(Icons.chevron_left),
          ),
          // Page Numbers
          Obx(() => Row(children: _buildPageNumbers())),
          // Next Button
          IconButton(
            onPressed: controller.canGoNext ? controller.nextPage : null,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageNumbers() {
    List<Widget> pages = [];
    int totalVisible = 5;
    int current = controller.currentPage.value;
    int total = controller.totalPages.value;

    int startPage = (current - 2).clamp(
      1,
      (total - totalVisible + 1).clamp(1, total),
    );
    int endPage = (startPage + totalVisible - 1).clamp(1, total);

    if (startPage > 1) {
      pages.add(_pageButton(1));
      if (startPage > 2)
        pages.add(const Text('...', style: TextStyle(color: Colors.grey)));
    }

    for (int i = startPage; i <= endPage; i++) {
      pages.add(_pageButton(i));
    }

    if (endPage < total) {
      if (endPage < total - 1)
        pages.add(const Text('...', style: TextStyle(color: Colors.grey)));
      pages.add(_pageButton(total));
    }

    return pages;
  }

  Widget _pageButton(int page) {
    bool isCurrent = page == controller.currentPage.value;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Material(
        color: isCurrent ? Colors.blue[600] : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: isCurrent ? null : () => controller.goToPage(page),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              '$page',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isCurrent ? Colors.white : Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
