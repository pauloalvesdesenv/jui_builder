import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jui_builder/src/presentation/base/base_cubit.dart';
import 'package:jui_builder/src/presentation/scan/scan_cubit.dart';
import 'package:jui_builder/src/presentation/jui/jui_cubit.dart';
import 'package:jui_builder/src/presentation/jui/states/jui_loaded_page.dart';
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
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: 100,
                      child: QRView(
                        key: qrKey,
                        onQRViewCreated: (e) {
                          qrViewController = e;
                          qrViewController.scannedDataStream.listen((event) =>
                              GetIt.I.get<ScanCubit>().scan(event.code).then(
                                  (e) => GetIt.I
                                      .get<BaseCubit>()
                                      .fetchFrameworkMetaData()));
                        },
                      ),
                    ),
                    Text('Scan to begin'),
                    Text(
                        'Scan the QR code to initialize the app and receive your content.')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
