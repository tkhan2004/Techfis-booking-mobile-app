import 'package:flutter/material.dart';
import 'package:hotel_booking/component/logo_component/company_logo.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 70,
          ),
          height:
              MediaQuery.of(context).size.height * 0.3 +
              MediaQuery.of(context).padding.top +
              70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/background_home.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
              ),
            ),
          ),
        ),

        // Company Logo (Above Search Bar)
        Positioned(
          bottom: 120,
          left: 0,
          right: 0,
          child: Center(child: CompanyLogo(width: 200)),
        ),
      ],
    );
  }
}
