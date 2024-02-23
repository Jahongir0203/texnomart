import 'package:get_it/get_it.dart';
import 'package:texnomart/data/services/storage_service.dart';

GetIt getServices = GetIt.instance;

initServices() {
  getServices.registerSingleton<StorageService>(StorageService());
}
