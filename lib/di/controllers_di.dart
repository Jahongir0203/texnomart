import 'package:get_it/get_it.dart';
import 'package:texnomart/data/controllers/locale_controller.dart';
import 'package:texnomart/data/services/storage_service.dart';

GetIt getControllers = GetIt.instance;

void initController() {
  getControllers.registerSingleton<LocaleController>(LocaleController(StorageService()));
}
