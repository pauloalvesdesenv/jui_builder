import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:jui_builder/src/presentation/base/base_cubit.dart';
import 'package:jui_builder/src/presentation/scan/scan_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController qrViewController;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((e) {
      onScan('https://run.mocky.io');
    });
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrViewController.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController.resumeCamera();
    }
  }

  @override
  void dispose() {
    qrViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<ScanCubit>(
        create: (_) => GetIt.I.get<ScanCubit>()..onInit(),
        child: BlocBuilder<ScanCubit, ScanState>(
          builder: (_, state) => Container(
            color: Colors.white,
            child: Center(
              child: IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 3,
                            offset: const Offset(0, 0))
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: 300,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: QRView(
                            overlay: QrScannerOverlayShape(borderRadius: 8),
                            key: qrKey,
                            onQRViewCreated: (e) {
                              qrViewController = e;
                              qrViewController.scannedDataStream
                                  .listen((event) => onScan(event.code));
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Scan to begin',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Gap(4),
                            Text(
                              'Scan the QR code to initialize the app\nand receive your content.',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onScan(String? code) async {
    await GetIt.I
        .get<ScanCubit>()
        .scan(code)
        .then((e) => GetIt.I.get<BaseCubit>().fetchFrameworkMetaData());
  }
}
