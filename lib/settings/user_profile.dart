import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';

import 'package:quick_token_new/settings/edit_profile.dart';
import 'package:quick_token_new/widgets/arrow_back.dart';
import 'package:quick_token_new/widgets/big_text.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/small_text.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _DoctorsAppointmentState();
}

class _DoctorsAppointmentState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackButton(
                onTap: () {
                  navigator!.push(
                    MaterialPageRoute(
                      builder: (context) => const PatientHomeScreen(),
                    ),
                  );
                },
                iconSize: 25,
              ),
              Center(
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/dentist.png'),
                    ),
                    borderRadius: BorderRadius.circular(80),
                    color: const Color.fromARGB(255, 189, 189, 189),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 10, 40, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BigText(
                        text: 'Abas Ashkar S A',
                        overflow: TextOverflow.ellipsis,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ExtraSmallText(
                  text:
                      '________________________________________________________________',
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmallText(
                      text: 'User ID',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 250),
                  BigText(
                    text: '@Dhanyal',
                    overflow: TextOverflow.ellipsis,
                    size: 14,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmallText(
                          text: 'Location',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 140),
                      BigText(
                        text: 'India,Bengaluru,Banswadi',
                        overflow: TextOverflow.ellipsis,
                        size: 14,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SmallText(
                              text: 'Phone Number',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 195),
                          BigText(
                            text: '123456789',
                            overflow: TextOverflow.ellipsis,
                            size: 14,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Email ID',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 155),
                              BigText(
                                text: 'abas.ashkar@gmail.com',
                                overflow: TextOverflow.ellipsis,
                                size: 14,
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  navigator?.push(
                                    MaterialPageRoute(
                                      builder: (context) => EditProfile(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                      255,
                                      20,
                                      61,
                                      92,
                                    ),
                                  ),
                                  child: Center(
                                    child: SmallText(
                                      text: 'Edit Profile',
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
