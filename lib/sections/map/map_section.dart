import 'package:flutter/material.dart';
import 'package:web/constants.dart';
import 'package:web/sections/map/components/map_screen.dart';
import '../components/main_title.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < kMdBreakpoint;
    return Container(
      padding: isMobile
          ? const EdgeInsets.symmetric(horizontal: kDefaultPaddingXs)
          : const EdgeInsets.symmetric(vertical: kDefaultPaddingXs),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          MainTitle(
            title: 'Onde estamos'.toUpperCase(),
            subtitle: 'Av Benedito Alves Turíbio 1838 - Padroeira II - Osasco - São Paulo',
          ),
          const SizedBox(height: 10),
          const Column(
            children: [
              MapScreen(),
            ],
          ),
        ],
      ),
    );
  }
}