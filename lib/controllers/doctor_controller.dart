import 'package:get/get.dart';
import 'package:quick_token_new/models/doctor_model.dart';
import 'package:quick_token_new/services/doctor_services.dart';

class DoctorController extends GetxController {
  final DoctorService _doctorService = DoctorService();

  // All doctors fetched from backend
  var doctors = <DoctorModel>[].obs;

  // Filtered list for display
  var filteredDoctors = <DoctorModel>[].obs;

  var isLoading = false.obs;
  var selectedCategory = 'All'.obs;

  Future<void> fetchDoctors({String? search}) async {
    try {
      isLoading(true);
      final result = await _doctorService.fetchDoctor(searchQuery: search);
      doctors.assignAll(result);
      filteredDoctors.assignAll(result);
    } catch (e) {
      print("❌ Error fetching doctors: $e");
    } finally {
      isLoading(false);
    }
  }

  // Filter by category (specialization)
  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      filteredDoctors.assignAll(doctors);
    } else {
      filteredDoctors.assignAll(
        doctors
            .where(
              (doc) =>
                  doc.specialization.toLowerCase() == category.toLowerCase(),
            )
            .toList(),
      );
    }
  }

  // Combine search + category filter
  void filterBySearch(String query) {
    final q = query.toLowerCase();
    final category = selectedCategory.value;

    var filtered = doctors.where((doc) {
      final matchesName = doc.name.toLowerCase().contains(q);
      final matchesCategory = category == 'All'
          ? true
          : doc.specialization.toLowerCase() == category.toLowerCase();
      return matchesName && matchesCategory;
    }).toList();

    filteredDoctors.assignAll(filtered);
  }
}
