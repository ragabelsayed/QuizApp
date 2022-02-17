import 'package:flutter/material.dart';
import '../config/palette.dart';

class ItemView extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final Function onPress;
  const ItemView(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imagePath,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: Palette.kPrimaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListTile(
          onTap: () => onPress(),
          leading: SizedBox(
            height: 55,
            width: 55,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text(
            subTitle,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.forward),
        ),
      ),
    );
  }
}
