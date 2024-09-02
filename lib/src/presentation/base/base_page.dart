import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jui_builder/src/presentation/base/base_cubit.dart';
import 'package:jui_builder/src/presentation/jui/jui_page.dart';
import 'package:jui_builder/src/presentation/scan/scan_page.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<BaseCubit>(
        create: (_) => GetIt.I.get<BaseCubit>()..onInit(),
        child: BlocBuilder<BaseCubit, BaseState>(
          builder: (_, state) {
            if (state is BaseLoadingState) {
              return const Text(
                'Loading',
                style: TextStyle(color: Colors.white),
              );
            }
            if (state is BaseErrorState) {
              return Text(
                state.message,
              );
            }
            if (state is BaseLoadedState) {
              return state.frameworkMetaDataResponseModel != null
                  ? JUIPage(
                      frameworkMetaDataResponseModel:
                          state.frameworkMetaDataResponseModel!)
                  : const ScanPage();
            }
            throw Exception();
          },
        ),
      ),
    );
  }
}
