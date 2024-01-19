import 'package:get_it/get_it.dart';
import 'package:reddit_task/reals/di/reals_injector.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.pushNewScope();
  await registerAppDependencies();
}

Future<void> resetScopeDependencies() async {
  await injector.resetScope();
  // await injector.unregister<Link>();
  await registerAppDependencies();
}

Future<void> registerAppDependencies() async {
  await RealsDi.initialize();
}
