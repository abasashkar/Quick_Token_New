import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/controllers/doctor_controller.dart';
import 'package:quick_token_new/home/top_doctors.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/patient_dashboar_tabs.dart';

class FindDoctors extends StatefulWidget {
  const FindDoctors({super.key});

  @override
  State<FindDoctors> createState() => _FindDoctorsState();
}

class _FindDoctorsState extends State<FindDoctors> {
  final DoctorController doctorController = Get.put(DoctorController());
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    doctorController.fetchDoctors();
  }

  void onSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      doctorController.filterBySearch(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: ExtraSmallText(
          text: 'Patient Dashboard',
          color: Colors.white,
          size: 20,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: PatientDashboardTabs(),
            ),

            // 🔍 Search Box
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: onSearch,
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search For Doctors',
                    hintStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.search, size: 30),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // 🩺 Category Chips
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExtraSmallText(
                          text: 'I’m looking for',
                          color: Colors.black,
                          size: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Clear",
                              style: TextStyle(
                                color: Color.fromARGB(255, 28, 125, 205),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "See All",
                              style: TextStyle(
                                color: Color.fromARGB(255, 28, 125, 205),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 🧩 Filter Chips (Reactive)
                    Obx(() {
                      final categories = [
                        "All",
                        "Clinical",
                        "Surgeon",
                        "Cardiologist",
                        "Gynecologist",
                      ];

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((category) {
                            final isSelected =
                                doctorController.selectedCategory.value ==
                                category;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF333333),
                                  ),
                                ),
                                selected: isSelected,
                                selectedColor: const Color(0xFF4F8BFF),
                                backgroundColor: const Color(0xFFD9E8F6),
                                onSelected: (_) =>
                                    doctorController.filterByCategory(category),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // 🧑‍⚕️ Doctors List
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: TopDoctors(),
            ),
          ],
        ),
      ),
    );
  }
}
