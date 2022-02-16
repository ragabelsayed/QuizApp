import 'package:flutter/material.dart';
import 'package:quiz_app/src/config/palette.dart';
import '../../config/constants.dart';

class HomeScreen extends StatelessWidget {
  static const routName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppConstants.imageBackground,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: Palette.kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: SizedBox(
                        height: 55,
                        width: 55,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          child: Image.asset(
                            'assets/icons/exam.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: const Text('Exams'),
                      subtitle: const Text(
                        'Hit there, good luck with quiz 😁',
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.forward),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: Palette.kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: SizedBox(
                        height: 55,
                        width: 55,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          child: Image.asset(
                            'assets/icons/student.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: const Text('Students'),
                      subtitle: const Text(
                        'Students list with there score',
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.forward),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Palette.primaryColor1,
          foregroundColor: Colors.white,
          onPressed: () {},
          label: Icon(Icons.quiz)),
    );
  }
}
