import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_token_new/model/patient_model.dart';
import 'package:quick_token_new/services/patient_services.dart';

class PatientController extends GetxController {
  final PatientService _service = PatientService();
  final storage = GetStorage();

  var isLoading = false.obs;
  var succuessMessage = ''.obs;
  var errorMessage = ''.obs;
  var currentPatient = Rxn<PatientModel>();

  // ✅ Return bool to indicate success or failure
  Future<bool> createPatient(PatientModel patient) async {
    try {
      isLoading.value = true;
      succuessMessage.value = '';
      errorMessage.value = '';

      final result = await _service.createPatient(patient);

      succuessMessage.value = result['message'] ?? "Patient created successfully";
      final patientId = result['data']['_id'];
      await storage.write('patientId', patientId);
      print("✅ Saved patient ID: $patientId");
      return true; // success
    } catch (e) {
      errorMessage.value = e.toString();
      return false; // failuFCre
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPatientById(String id) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      print("📱 Fetching patient with ID: $id"); // ✅ Add this line

      final patient = await _service.getPatientById(id);
      currentPatient.value = patient;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ Optional: Clear current patient (on logout)
  void clearPatient() {
    currentPatient.value = null;
    succuessMessage.value = ''; // fixed typo here too
    errorMessage.value = '';
  }
}
