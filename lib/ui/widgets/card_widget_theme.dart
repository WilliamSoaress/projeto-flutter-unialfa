import 'package:flutter/material.dart';

class CardWidgetTheme extends StatelessWidget {
  final String title;
  final String subTitle;
  final String urlImage;

  const CardWidgetTheme({
    required this.title,
    required this.subTitle,
    required this.urlImage,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context, {required}) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.wysiwyg_outlined),
              title: Text(title),
              subtitle: Text(subTitle),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:Image.network(
                urlImage
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Curtir...'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}