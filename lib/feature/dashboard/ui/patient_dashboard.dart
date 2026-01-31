// patient_dashboard.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:quick_token_new/feature/dashboard/ui/top_doctors.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/patient_dashboar_tabs.dart';

class FindDoctors extends StatefulWidget {
  const FindDoctors({super.key});

  @override
  State<FindDoctors> createState() => _FindDoctorsState();
}

class _FindDoctorsState extends State<FindDoctors> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  final categories = ["All", "Clinical", "Surgeon", "Cardiologist", "Gynecologist"];

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(const FetchDoctorsEvent());
  }

  void onSearch(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<DashboardBloc>().add(SearchDoctorsEvent(value));
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
    return Scaffold(
      appBar: CustomAppBar(
        title: ExtraSmallText(text: 'Patient Dashboard', color: Colors.white, size: 20),
      ),
      backgroundColor: const Color(0xFFE6E6E6),
      body: Column(
        children: [
          const PatientDashboardTabs(),

          // 🔍 Search
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'Search For Doctors',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
              ),
            ),
          ),

          // 🩺 Categories
          BlocBuilder<DashboardBloc, DoctorState>(
            buildWhen: (p, c) => p.selectedCategory != c.selectedCategory,
            builder: (context, state) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: categories.map((category) {
                    final isSelected = state.selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        selectedColor: const Color(0xFF4F8BFF),
                        onSelected: (_) {
                          context.read<DashboardBloc>().add(SelectCategoryEvent(category));
                        },
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),

          const SizedBox(height: 10),

          // 👨‍⚕️ Doctors List
          Expanded(
            child: BlocBuilder<DashboardBloc, DoctorState>(
              builder: (context, state) {
                if (state.status == AppStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == AppStatus.error) {
                  return Center(child: Text(state.statusMessage));
                }

                final filteredDoctors = state.doctors.where((doctor) {
                  final matchesSearch = doctor.name.toLowerCase().contains(state.searchQuery.toLowerCase());
                  final matchesCategory =
                      state.selectedCategory == "All" || doctor.specialization == state.selectedCategory;
                  return matchesSearch && matchesCategory;
                }).toList();

                return TopDoctors(doctors: filteredDoctors);
              },
            ),
          ),
        ],
      ),
    );
  }
}
