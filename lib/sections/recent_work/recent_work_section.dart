import 'package:flutter/material.dart';
import 'package:web/models/recent_work.dart';
import 'package:web/sections/components/main_title.dart';
import '../../constants.dart';
import 'components/recent_work_card.dart';
import 'package:skynexui_responsive_stylesheet/skynexui_responsive_stylesheet.dart';

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/recent_work_bg.png'),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const MainTitle(
            title: 'TRATAMENTOS FULL FACE',
            subtitle:
                'Nossos principais tratamentos atuam no rejuvenescimento de todas as belezas',
          ),
          responsive.value({
            Breakpoints.xs: SizedBox(
              width: 1110,
              child: Column(
                children: recentWork
                    .map(
                      (work) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            RecentWorkCard(
                              index: recentWork.indexOf(work),
                              title: '',
                             subtitle: '',
                              image: work.image!,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              work.title!, // Exemplo: Titulo
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              work.category!, // Exemplo: Subtitulo
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Breakpoints.md: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: kDefaultPadding,
                mainAxisSpacing: kDefaultPadding,
                childAspectRatio: 2.5,
              ),
              itemCount: recentWork.length,
              itemBuilder: (context, index) => RecentWorkCard(
                index: index,
                title: recentWork[index].title!,
                subtitle: recentWork[index].category!,
                image: recentWork[index].image!,
                // press: () {},
              ),
            ),
          }),
          //const SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
