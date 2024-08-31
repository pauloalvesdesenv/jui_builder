import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jui_builder/src/presentation/jui/jui_cubit.dart';
import 'package:jui_builder/src/presentation/jui/states/jui_loaded_page.dart';

class JUIPage extends StatelessWidget {
  const JUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<JuiCubit>(
        create: (_) => GetIt.I.get<JuiCubit>()..onInit(),
        child: BlocBuilder<JuiCubit, JuiState>(
          builder: (_, state) {
            if (state is JuiLoadingState) {
              return const Text(
                'Loading',
                style: TextStyle(color: Colors.white),
              );
            }
            if (state is JuiErrorState) {
              return Text(
                state.message,
              );
            }
            if (state is JuiLoadedState) {
              return JuiLoadedPage(json: state.jui);
            }
            throw Exception();
          },
        ),
      ),
    );
  }
}
