import 'package:flutter/material.dart';
import 'package:quick_token_new/widgets/big_text.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/icon_text_widget.dart';
import 'package:quick_token_new/widgets/small_text.dart';

class BookAppointments extends StatefulWidget {
  const BookAppointments({super.key});

  @override
  State<BookAppointments> createState() => _BookAppointmentsState();
}

class _BookAppointmentsState extends State<BookAppointments> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  overflow: TextOverflow.ellipsis,
                  text: 'Recomended',
                  size: 20,
                ),
                BigText(
                  overflow: TextOverflow.ellipsis,
                  text: 'Doctors for you',
                  size: 20,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 190,
                  margin: const EdgeInsets.symmetric(vertical: 8),
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
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image section
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/dentist.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Text section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: 'Dr. Stephen Wing',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                SmallText(
                                  text: 'General - Medical center',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                const Wrap(
                                  spacing: 8,
                                  children: [
                                    IconTextWidget(
                                      icon: Icons.star,
                                      text: '4.8',
                                      color: Colors.black,
                                      iconSize: 14,
                                      iconColor: Colors.amber,
                                    ),
                                    ExtraSmallText(text: '(575876 reviews)'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color.fromARGB(255, 227, 224, 224),
                        thickness: 2,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Aligns items to the left
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Ensures the text is top-aligned
                        children: [
                          // Left-aligned Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align texts to the left
                            children: [
                              const ExtraSmallText(
                                text: 'Available appointment',
                              ),
                              const SizedBox(height: 4),
                              BigText(
                                text: 'Tomorrow 10:00 AM',
                                size: 13,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ), // Space between text and button
                          // Right-aligned Container (black square)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                255,
                                22,
                                105,
                                174,
                              ), // Black color background
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // Curved corners
                            ),
                            child: BigText(
                              size: 15,
                              text: 'Book Appointment',
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ignore: prefer_const_constructors
                Container(
                  height: 190,
                  margin: const EdgeInsets.symmetric(vertical: 8),
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
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image section
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/dentist.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Text section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: 'Dr. Stephen Wing',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                SmallText(
                                  text: 'General - Medical center',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                const Wrap(
                                  spacing: 8,
                                  children: [
                                    IconTextWidget(
                                      icon: Icons.star,
                                      text: '4.8',
                                      color: Colors.black,
                                      iconSize: 14,
                                      iconColor: Colors.amber,
                                    ),
                                    ExtraSmallText(text: '(575876 reviews)'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color.fromARGB(255, 227, 224, 224),
                        thickness: 2,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Aligns items to the left
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Ensures the text is top-aligned
                        children: [
                          // Left-aligned Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align texts to the left
                            children: [
                              const ExtraSmallText(
                                text: 'Available appointment',
                              ),
                              const SizedBox(height: 4),
                              BigText(
                                text: 'Tomorrow 10:00 AM',
                                size: 13,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ), // Space between text and button
                          // Right-aligned Container (black square)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                255,
                                22,
                                105,
                                174,
                              ), // Black color background
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // Curved corners
                            ),
                            child: BigText(
                              size: 15,
                              text: 'Book Appointment',
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 190,
                  margin: const EdgeInsets.symmetric(vertical: 8),
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
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image section
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/dentist.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Text section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: 'Dr. Stephen Wing',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                SmallText(
                                  text: 'General - Medical center',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                const Wrap(
                                  spacing: 8,
                                  children: [
                                    IconTextWidget(
                                      icon: Icons.star,
                                      text: '4.8',
                                      color: Colors.black,
                                      iconSize: 14,
                                      iconColor: Colors.amber,
                                    ),
                                    ExtraSmallText(text: '(575876 reviews)'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color.fromARGB(255, 227, 224, 224),
                        thickness: 2,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Aligns items to the left
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Ensures the text is top-aligned
                        children: [
                          // Left-aligned Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align texts to the left
                            children: [
                              const ExtraSmallText(
                                text: 'Available appointment',
                              ),
                              const SizedBox(height: 4),
                              BigText(
                                text: 'Tomorrow 10:00 AM',
                                size: 13,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ), // Space between text and button
                          // Right-aligned Container (black square)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                255,
                                22,
                                105,
                                174,
                              ), // Black color background
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // Curved corners
                            ),
                            child: BigText(
                              size: 15,
                              text: 'Book Appointment',
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
