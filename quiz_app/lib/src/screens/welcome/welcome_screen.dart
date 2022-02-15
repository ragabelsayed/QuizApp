import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/src/widgets/rounded_btn.dart';
import '/src/config/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Text(
                  'Welcome to Quiz app,',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text('Who are you'),
                const Spacer(),
                RoundedBtn(
                    text: 'Admin',
                    padding: AppConstants.defaultPadding,
                    onPress: () {
                      print(1);
                    }),
                const SizedBox(height: 15),
                RoundedBtn(
                    text: 'Student',
                    padding: AppConstants.defaultPadding,
                    onPress: () {
                      print(1);
                    }),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//  SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: AppConstants.defaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Spacer(flex: 2), //2/6
//                   Text(
//                     "Let's Play Quiz,",
//                     style: Theme.of(context).textTheme.headline4?.copyWith(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                   const Text("Enter your informations below"),
//                   const Spacer(), // 1/6
//                   const TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xFF1C2341),
//                       hintText: "Full Name",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                       ),
//                     ),
//                   ),
//                   const Spacer(), // 1/6
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       padding: const EdgeInsets.all(
//                           AppConstants.defaultPadding * 0.75), // 15
//                       decoration: const BoxDecoration(
//                         gradient: Palette.kPrimaryGradient,
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                       ),
//                       child: Text(
//                         "Lets Start Quiz",
//                         style: Theme.of(context)
//                             .textTheme
//                             .button
//                             ?.copyWith(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   const Spacer(flex: 2), // it will take 2/6 spaces
//                 ],
//               ),
//             ),
//           ),