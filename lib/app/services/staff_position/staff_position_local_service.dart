import 'dart:convert';
import '../db/database.dart';
import 'staff_position_model.dart'; // Sesuaikan dengan nama file model Anda
import 'package:drift/drift.dart';

class StaffPositionLocalService {
  final AppDatabase _db;
  StaffPositionLocalService(this._db);

  /// BULK INSERT: Sinkronisasi data dari API ke Lokal
  Future<void> bulkInsert(List<StaffPositionResponse> positions) async {
    await _db.transaction(() async {
      // 1. Bersihkan tabel lama
      await _db.delete(_db.staffPositions).go();

      // 2. Batch insert data baru
      await _db.batch((batch) {
        for (final pos in positions) {
          batch.insert(_db.staffPositions, _mapToCompanion(pos));
        }
      });
    });
  }

  /// MANUAL MAPPING: Response API -> Drift Companion
  StaffPositionsCompanion _mapToCompanion(StaffPositionResponse res) {
    return StaffPositionsCompanion.insert(
      id: res.id,
      schoolId: res.schoolId,
      name: res.name,
      description: res.description,
      isActive: res.isActive,
      createdAt: res.createdAt,
      updatedAt: res.updatedAt,
    );
  }

  /// MANUAL MAPPING: Drift Row -> Response Model
  StaffPositionResponse _mapToResponse(StaffPosition row) {
    return StaffPositionResponse(
      id: row.id,
      schoolId: row.schoolId,
      name: row.name,
      description: row.description,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// AMBIL SEMUA DATA
  Future<List<StaffPositionResponse>> getAllLocal() async {
    final rows = await _db.select(_db.staffPositions).get();
    return rows.map(_mapToResponse).toList();
  }

  /// AMBIL BERDASARKAN ID
  Future<StaffPositionResponse?> getById(String id) async {
    final query = _db.select(_db.staffPositions)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  /// HAPUS SEMUA
  Future<void> clearAllLocal() async {
    await _db.delete(_db.staffPositions).go();
  }
}
