import 'package:flutter/material.dart';
import 'package:flutter_advanced/modules/ocr_scanner/controller/ocr_scanner_controller.dart';
import 'package:ocr_scan_text/ocr_scan_text.dart';

import '../../../resources/widgets/scale_text.dart';

class OcrScannerView extends StatelessWidget {
  OcrScannerView({super.key});
  final OcrScannerController _ocrScannerController = OcrScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ScaleText('OCR Scanner'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: MediaQuery.of(context).size.height - 40,
          child: _buildLiveScan(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final ScanAllModule scanAllModule = ScanAllModule();
          if (_ocrScannerController.isStarted) {
            scanAllModule.stop();
          } else {
            scanAllModule.start();
          }
          _ocrScannerController.isStarted = !_ocrScannerController.isStarted;
        },
      ),
    );
  }

  Widget _buildLiveScan(BuildContext context) {
    return LiveScanWidget(
      ocrTextResult: (ocrTextResult) {
        String resultStr = '';
        ocrTextResult.mapResult.forEach(
          (module, result) {
            resultStr = '$resultStr$module : ${result[0].text}';
          },
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(resultStr),
          ),
        );
      },
      scanModules: [
        ScanAllModule(),
      ],
    );
  }
}

class ScanAllModule extends ScanModule {
  ScanAllModule()
      : super(
          label: '',
          color: Colors.redAccent.withOpacity(0.3),
          validateCountCorrelation: 1,
        );

  @override
  Future<List<ScanResult>> matchedResult(
    List<TextBlock> textBlock,
    String text,
  ) async {
    List<ScanResult> list = [];
    for (var block in textBlock) {
      for (var line in block.lines) {
        for (var element in line.elements) {
          list.add(
            ScanResult(
              cleanedText: element.text,
              scannedElementList: [element],
            ),
          );
        }
      }
    }
    print('Start List<ScanResult> :');
    for (var element in list) {
      print(element.text);
      print(element.cleanedText);
    }
    print('End List<ScanResult> :');
    return list;
  }
}
