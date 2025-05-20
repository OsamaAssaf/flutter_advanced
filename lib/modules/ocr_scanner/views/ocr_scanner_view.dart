import 'package:flutter_advanced/exports.dart';

class OcrScannerView extends StatelessWidget {
  const OcrScannerView({super.key});
  // final OcrScannerController _ocrScannerController = OcrScannerController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const ScaleText('OCR Scanner'),
    //   ),
    //   body: Center(
    //     child: SizedBox(
    //       width: MediaQuery.of(context).size.width - 20,
    //       height: MediaQuery.of(context).size.height - 40,
    //       child: _buildLiveScan(context),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       final ScanAllModule scanAllModule = ScanAllModule();
    //       if (_ocrScannerController.isStarted) {
    //         scanAllModule.stop();
    //       } else {
    //         scanAllModule.start();
    //       }
    //       _ocrScannerController.isStarted = !_ocrScannerController.isStarted;
    //     },
    //   ),
    // );
  }

  // Widget _buildLiveScan(BuildContext context) {
  //   return LiveScanWidget(
  //     ocrTextResult: (ocrTextResult) {
  //       String resultStr = '';
  //       ocrTextResult.mapResult.forEach(
  //         (module, result) {
  //           resultStr = '$resultStr$module : ${result[0].text}';
  //         },
  //       );
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(resultStr),
  //         ),
  //       );
  //     },
  //     scanModules: [
  //       ScanAllModule(),
  //     ],
  //   );
  // }
}

// class ScanAllModule extends ScanModule {
//   ScanAllModule()
//       : super(
//           label: '',
//           color: Colors.redAccent.withValues(alpha: 0.3),
//           validateCountCorrelation: 1,
//         );
//
//   @override
//   Future<List<ScanResult>> matchedResult(
//     List<TextBlock> textBlock,
//     String text,
//   ) async {
//     final List<ScanResult> list = [];
//     for (final TextBlock block in textBlock) {
//       for (final TextLine line in block.lines) {
//         for (final element in line.elements) {
//           list.add(
//             ScanResult(
//               cleanedText: element.text,
//               scannedElementList: [element],
//             ),
//           );
//         }
//       }
//     }
//
//     return list;
//   }
// }
