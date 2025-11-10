import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quick_token_new/doctors/appointment_date.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/widgets/arrow_back.dart';
import 'package:quick_token_new/widgets/big_text.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/small_text.dart';

class DoctorsBio extends StatefulWidget {
  const DoctorsBio({super.key});

  @override
  State<DoctorsBio> createState() => _LoginPageState();
}

class _LoginPageState extends State<DoctorsBio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowBackButton(
                    onTap: () {
                      Get.toNamed(RoutesHelper.homescreen);
                    },
                    iconSize: 28,
                  ),
                  const SizedBox(width: 100),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Doctor Details
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExtraSmallText(text: 'Cardiologist'),
                        const SizedBox(height: 10),
                        BigText(
                          text: 'Dr. Thomas',
                          overflow: TextOverflow.ellipsis,
                          size: 21,
                        ),
                        const SizedBox(height: 5),
                        SmallText(
                          text: 'MBBS,FCPC,FRCP',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        SmallText(
                          text: '(EDIN),FCCP(USA)',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        SmallText(
                          text: 'FACC(USA),FESC',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: [
                                BigText(
                                  text: '₹500/',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const ExtraSmallText(text: 'session'),
                                const SizedBox(width: 50),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/dentist.png',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 15),

              // Experience, Rating, Patients
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Experience Box
                  Container(
                    height: 100,
                    width: 116,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 15,
                          left: 85,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 15,
                          child: BigText(
                            text: "12 years",
                            size: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 15,
                          child: SmallText(
                            text: "Experience",
                            size: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Rating Box
                  Container(
                    height: 100,
                    width: 116,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 15,
                          left: 85,
                          child: Icon(
                            Icons.star_border,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 15,
                          child: BigText(
                            text: "4.2",
                            size: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 15,
                          child: SmallText(
                            text: "Rating",
                            size: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Patients Box
                  Container(
                    height: 100,
                    width: 116,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 15,
                          left: 85,
                          child: Icon(
                            Icons.person_add,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: 35,
                          left: 15,
                          child: BigText(
                            text: "2500+",
                            size: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 15,
                          child: SmallText(
                            text: "Patient",
                            size: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // About Section
              Container(
                height: 370, //chnage heree
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tabs
                    Row(
                      children: [
                        SmallText(
                          text: 'About',
                          overflow: TextOverflow.ellipsis,
                          color: const Color.fromARGB(255, 33, 95, 146),
                        ),
                        const SizedBox(width: 10),
                        SmallText(
                          text: 'Availablity',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 10),
                        SmallText(
                          text: 'Experience',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 10),
                        SmallText(
                          text: 'Education',
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 10),
                        SmallText(
                          text: 'Review',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // About Text
                    SmallText(
                      text:
                          "Dr. Thomas Michael is a board-certified cardiologist with over 12 years of experience in the field of cardiovascular medicine. He specializes...",
                      overflow: TextOverflow.visible,
                    ),

                    const SizedBox(height: 15),

                    // Wrap instead of Row to avoid overflow
                    Row(
                      // Vertical space between containers
                      children: [
                        Container(
                          height: 100,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 5,
                                left: 15,
                                child: Icon(
                                  Icons.money_rounded,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                left: 15,
                                child: SmallText(
                                  text: "Session fee",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 15,
                                child: SmallText(
                                  text: "84",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 100,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 8,
                                left: 15,
                                child: Icon(
                                  Icons.currency_exchange_rounded,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                left: 15,
                                child: SmallText(
                                  text: "Follow-Up fee",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 15,
                                child: SmallText(
                                  text: "200(within 30 days)",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 5,
                                left: 15,
                                child: Icon(
                                  Icons.alarm,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                left: 15,
                                child: SmallText(
                                  text: "Avg Session",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 15,
                                child: SmallText(
                                  text: "Experience",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 100, //change here
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                top: 5,
                                left: 15,
                                child: Icon(
                                  Icons.person_2,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                left: 15,
                                child: SmallText(
                                  text: "Attendent Patients",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 15,
                                child: SmallText(
                                  text: "Experience",
                                  size: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.homescreen);
                        navigator!.push(
                          MaterialPageRoute(
                            builder: (context) => AppointmentDate(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 20, 76, 104),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 44,
                        width: 350,
                        child: Center(
                          child: SmallText(
                            text: 'Book Appointment',
                            size: 20,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
