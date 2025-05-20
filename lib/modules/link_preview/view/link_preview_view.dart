import 'package:flutter_advanced/exports.dart';

class LinkPreviewView extends StatefulWidget {
  const LinkPreviewView({super.key});

  @override
  State<LinkPreviewView> createState() => _LinkPreviewViewState();
}

class _LinkPreviewViewState extends State<LinkPreviewView> {
  final List<String> links = [
    'https://blog.hyperiondev.com/index.php/2018/11/02/html-beginner-tutorial-2-lists-links-images/',
    'https://www.html.am/html-codes/links/html-image-link.cfm',
    'https://internetingishard.netlify.app/html-and-css/links-and-images/',
    'https://pagedart.com/blog/linking-images-in-html/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: links.length,
          itemBuilder: (BuildContext context, int index) {
            final String link = links.elementAt(index);
            return AnyLinkPreview(
              link: link,
              urlLaunchMode: LaunchMode.externalApplication,
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(height: 16.0);
          },
        ),
      ),
    );
  }
}
