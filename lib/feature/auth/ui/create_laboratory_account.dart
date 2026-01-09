// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/controllers/patient_controller.dart';
// import 'package:quick_token_new/model/patient_model.dart';
// import 'package:quick_token_new/routes/routes_helper.dart';
// import 'package:quick_token_new/widgets/custom_appbar.dart';
// import 'package:quick_token_new/widgets/custom_textform.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';

// class CreateLaboratoryAccount extends StatefulWidget {
//   const CreateLaboratoryAccount({super.key});

//   @override
//   State<CreateLaboratoryAccount> createState() => _CreateLaboratoryAccountState();
// }

// class _CreateLaboratoryAccountState extends State<CreateLaboratoryAccount> {
//   final TextEditingController idController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController directorController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController establishController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController biographyController = TextEditingController();
//   final TextEditingController qualificationController = TextEditingController();
//   final TextEditingController specialityController = TextEditingController();
//   final TextEditingController consultationFeeController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController serviceController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController address1Controller = TextEditingController();
//   final TextEditingController address2Controller = TextEditingController();
//   final TextEditingController pincodeController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();

//   final PatientController patientController = Get.put(PatientController());
//   String? selectedGender;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       appBar: CustomAppBar(
//         title: ExtraSmallText(text: 'Create Lab Account', size: 20, color: Colors.white),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: const CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage('assets/circle_avatar.png'),
//                 ),
//               ),
//               SizedBox(height: 10),
//               CustomTextFormField(controller: nameController, hintText: 'Lab Name', keyboardType: TextInputType.name),
//               CustomTextFormField(
//                 controller: directorController,
//                 hintText: 'Lab Director Name',
//                 keyboardType: TextInputType.name,
//               ),
//               const SizedBox(height: 18),
//               CustomTextFormField(
//                 controller: emailController,
//                 hintText: 'Email Address',
//                 keyboardType: TextInputType.name,
//               ),
//               const SizedBox(height: 18),

//               CustomTextFormField(
//                 controller: phoneController,
//                 hintText: 'phone Number',
//                 keyboardType: TextInputType.phone,
//               ),
//               const SizedBox(height: 18),

//               CustomTextFormField(
//                 controller: serviceController,
//                 hintText: 'Service',
//                 keyboardType: TextInputType.datetime,
//               ),
//               const SizedBox(height: 18),

//               CustomTextFormField(
//                 controller: establishController,
//                 hintText: 'Year of Establishment',
//                 keyboardType: TextInputType.datetime,
//               ),
//               const SizedBox(height: 18),

//               CustomTextFormField(controller: specialityController, hintText: 'Speciality'),
//               const SizedBox(height: 18),

//               CustomTextFormField(controller: countryController, hintText: 'Country'),
//               const SizedBox(height: 18),
//               CustomTextFormField(controller: stateController, hintText: 'State'),
//               const SizedBox(height: 18),

//               CustomTextFormField(controller: cityController, hintText: 'Enter your city'),
//               const SizedBox(height: 18),

//               CustomTextFormField(controller: address1Controller, hintText: 'Enter your address line 1'),
//               const SizedBox(height: 18),

//               CustomTextFormField(controller: address2Controller, hintText: 'Enter your address line 2 (optional)'),
//               const SizedBox(height: 18),

//               CustomTextFormField(
//                 controller: pincodeController,
//                 hintText: 'Enter pincode',
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 18),

//               // 👇 Gender selection container
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(18),
//                   border: Border.all(color: Colors.grey.shade300, width: 1.2),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Label
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Text(
//                           "Gender ",
//                           style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           "(Optional)",
//                           style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),

//                     // Gender radio buttons
//                     Row(children: [_buildGenderRadio("Male"), const SizedBox(width: 12), _buildGenderRadio("Female")]),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               Center(
//                 child: Obx(() {
//                   return ElevatedButton(
//                     onPressed: patientController.isLoading.value
//                         ? null
//                         : () async {
//                             if (nameController.text.isEmpty ||
//                                 phoneController.text.isEmpty ||
//                                 dobController.text.isEmpty) {
//                               Get.snackbar(
//                                 "Error",
//                                 "Please fill all fields",
//                                 backgroundColor: Colors.redAccent,
//                                 colorText: Colors.white,
//                               );
//                               return;
//                             }

//                             final patient = PatientModel(
//                               id: idController.text,
//                               name: nameController.text,
//                               phone: phoneController.text,
//                               dob: dobController.text,
//                               country: countryController.text,
//                               state: stateController.text,
//                               city: cityController.text,
//                               address1: address1Controller.text,
//                               address2: address2Controller.text,
//                               pincode: pincodeController.text,
//                               gender: selectedGender ?? '',
//                             );

//                             bool success = await patientController.createPatient(patient);

//                             if (success) {
//                               Get.offNamed(RoutesHelper.homescreen);
//                             }
//                           },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4F8BFF),
//                       minimumSize: const Size(200, 48),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: patientController.isLoading.value
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text("Add", style: TextStyle(fontSize: 18, color: Colors.white)),
//                   );
//                 }),
//               ),

//               const SizedBox(height: 20),

//               Obx(() {
//                 if (patientController.succuessMessage.isNotEmpty) {
//                   return Center(
//                     child: Text(patientController.succuessMessage.value, style: const TextStyle(color: Colors.green)),
//                   );
//                 } else if (patientController.errorMessage.isNotEmpty) {
//                   return Center(
//                     child: Text(patientController.errorMessage.value, style: const TextStyle(color: Colors.red)),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 👇 Gender radio widget
//   Widget _buildGenderRadio(String gender) {
//     final bool isSelected = selectedGender == gender;
//     return InkWell(
//       onTap: () => setState(() => selectedGender = gender),
//       borderRadius: BorderRadius.circular(20),
//       child: Row(
//         children: [
//           Icon(
//             isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
//             color: isSelected ? const Color(0xFF4F8BFF) : Colors.grey,
//             size: 22,
//           ),
//           const SizedBox(width: 4),
//           Text(gender, style: const TextStyle(fontSize: 16, color: Colors.black87)),
//         ],
//       ),
//     );
//   }
// }
