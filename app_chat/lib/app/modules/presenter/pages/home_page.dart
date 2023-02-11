import 'package:design_system/design_system.dart';
import 'package:design_system/ui/styles/colors_app.dart';
import 'package:design_system/ui/widgets/home/list_images_home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsApp.primary, // TODO: CADE O TEMA?
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          const AppBarHomeWidget(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * 0.116,
              child: const ListImagesHomeWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
