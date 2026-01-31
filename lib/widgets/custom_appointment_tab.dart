import 'package:flutter/material.dart';

class CustomAppointmentTab extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;

  const CustomAppointmentTab({super.key, this.onTabChanged});

  @override
  State<CustomAppointmentTab> createState() => _CustomAppointmentTabState();
}

class _CustomAppointmentTabState extends State<CustomAppointmentTab> {
  int selecteIndex = 0;
  final tabs = ['Pending', 'Confirm', 'Completed', 'Canceled'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 230, 230, 230),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(tabs.length, (index) {
              final isActive = selecteIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() => selecteIndex = index);
                  widget.onTabChanged?.call(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tabs[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? const Color(0xFF4F8BFF) : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 2,
                      width: 82,
                      color: isActive ? const Color(0xFF4F8BFF) : Colors.transparent,
                    ),
                  ],
                ),
              );
            }),
          ),
          const Divider(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
