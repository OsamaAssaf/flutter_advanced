import 'package:flutter_advanced/exports.dart';

class ResponsiveView extends StatelessWidget {
  ResponsiveView({super.key});

  final List<String> imagesUrl = [
    'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
    'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
    'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
    'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
    'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630',
  ];

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 250.0),
              IntrinsicHeight(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18.0),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 18.0),
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Align(
      //   alignment: Alignment.topCenter,
      //   child: AspectRatio(
      //     aspectRatio: 1,
      //     child: Container(
      //       // height: 100.0,
      //       width: width,
      //       color: Colors.red,
      //     ),
      //   ),
      // ),
      // body: GridView.builder(
      //   itemCount: imagesUrl.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 4.0,
      //     mainAxisSpacing: 4.0,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     return FittedBox(
      //       fit: BoxFit.fill,
      //       child: Image.network(
      //         imagesUrl[index],
      //         // fit: BoxFit.cover,
      //       ),
      //     );
      //   },
      // ),
      // body: Column(
      //   children: [
      //     const Flexible(
      //       child: FittedBox(
      //         child: Icon(
      //           Icons.ac_unit_rounded,
      //           size: 300.0,
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         height: 100.0,
      //         color: Colors.red,
      //         child: const FittedBox(
      //           fit: BoxFit.scaleDown,
      //           child: Icon(
      //             Icons.add_box_outlined,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: 60.0,
      //       color: Colors.yellow,
      //     ),
      //     // Container(
      //     //   height: 100.0,
      //     //   color: Colors.green,
      //     // ),
      //   ],
      // ),
      // body: LayoutBuilder(
      //   builder: (BuildContext context, BoxConstraints constraints) {
      //     if (constraints.maxWidth < 480.0) {
      //       return const MobileLayout();
      //     } else {
      //       return const DesktopLayout();
      //     }
      //   },
      // ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            tileColor: Colors.green,
            title: Text('${index + 1}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailsView(
                    number: index + 1,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  int? number;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  tileColor: Colors.green,
                  title: Text('${index + 1}'),
                  onTap: () {
                    number = index + 1;
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Text(number == null ? '' : '$number'),
          ),
        ),
      ],
    );
  }
}
