import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jui_builder/di/injectable.config.dart';

@InjectableInit()
Future<void> configureDependencies() async {
  GetIt.instance.init();
}
