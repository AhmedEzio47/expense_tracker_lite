import 'package:flutter/material.dart';

import 'balance_card.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  String _selectedFilter = "This month";

  final List<String> _filters = ["This month", "Last 7 days"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.blue),
                        ),
                        SizedBox(width: 12),
                        Column(
                          spacing: 5,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Shihab Rahman",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedFilter,
                        padding: EdgeInsets.all(5),
                        isDense: true,
                        dropdownColor: Colors.white,
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        style: const TextStyle(color: Colors.black),
                        items: _filters.map((filter) {
                          return DropdownMenuItem(
                            value: filter,
                            child: Text(
                              filter,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedFilter = value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Positioned(
          //   left: 50,
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: RotatedBox(
          //       quarterTurns: 2,
          //       child: Image.asset(
          //         'assets/header_bg.png',
          //         width: 200,
          //         color: Colors.white.withValues(alpha: 0.1),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: BalanceCard(),
            ),
          ),
        ],
      ),
    );
  }
}
