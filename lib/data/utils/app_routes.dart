import 'package:flutter/cupertino.dart';
import 'package:texnomart/data/models/catalog_page_model.dart';
import 'package:texnomart/data/models/detail_model.dart';
import 'package:texnomart/ui/pages/brands_page/brands_child_widget.dart';
import 'package:texnomart/ui/pages/brands_page/brands_page.dart';
import 'package:texnomart/ui/pages/catalog_categories_page/catalog_categories_page.dart';
import 'package:texnomart/ui/pages/catalog_categories_page/widgets/categories_child_widget.dart';
import 'package:texnomart/ui/pages/catalog_page/catalog_page.dart';
import 'package:texnomart/ui/pages/childs_product_page/childs_product_page.dart';
import 'package:texnomart/ui/pages/cities_page/cities_page.dart';
import 'package:texnomart/ui/pages/detail_page/detail_page.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_characterics_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_documentaion_widget.dart';
import 'package:texnomart/ui/pages/detail_page/widgets/detail_market_widget.dart';
import 'package:texnomart/ui/pages/language_page/language_page.dart';
import 'package:texnomart/ui/pages/logIn_page/logIn_page.dart';
import 'package:texnomart/ui/pages/main_page/main_page.dart';
import 'package:texnomart/ui/pages/map_page/map_page.dart';
import 'package:texnomart/ui/pages/splash_page/splash_page.dart';

class AppRoutes {
  static const splashPage = '/splashPage';
  static const languagePage = '/languagePage';
  static const mainPage = '/mainPage';
  static const detailPage = '/detailPage';
  static const shopsPage = '/shopsPage';
  static const documentationPage = '/documentationPage';
  static const charactericsPage = '/charactericsPage';
  static const brandsPage = '/brandsPage';
  static const catalogCategoriesPage = '/catalogCategoriesPage';
  static const catalogChildsPage = '/catalogChildsPage';
  static const childsProductPage = '/childsProductsPage';
  static const catalogPage = '/catalogPage';
  static const citiesPage = '/citiesPage';
  static const logInPage = '/logInPage';
  static const brandsChildPage = '/brandsChildPage';
static const mapPage='/mapPage';
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashPage:
        return CupertinoPageRoute(
          builder: (context) => SplashPage(),
        );
      case AppRoutes.languagePage:
        return CupertinoPageRoute(
          builder: (context) => LanguagePage(),
        );

      case AppRoutes.mainPage:
        return CupertinoPageRoute(
          builder: (context) => MainPage(),
        );
      case AppRoutes.detailPage:
        return CupertinoPageRoute(
          builder: (context) => DetailPage(
            id: routeSettings.arguments as int,
          ),
        );

      case AppRoutes.shopsPage:
        return CupertinoPageRoute(
          builder: (context) => DetailShopsPage(
            shopsModel: routeSettings.arguments as List<AvailableStores>,
          ),
        );
      case AppRoutes.documentationPage:
        return CupertinoPageRoute(
          builder: (context) => DetailDocumentationPage(
            text: routeSettings.arguments as String,
          ),
        );

      case AppRoutes.charactericsPage:
        return CupertinoPageRoute(
          builder: (context) => DetailCharactericsPage(
            list: routeSettings.arguments as List<CharactericsModel>,
          ),
        );
      case AppRoutes.brandsPage:
        return CupertinoPageRoute(
          builder: (context) => BrandsPage(
            brand: routeSettings.arguments as String,
          ),
        );

      case AppRoutes.catalogCategoriesPage:
        return CupertinoPageRoute(
          builder: (context) => CategoriesCatalogPage(
            data: routeSettings.arguments as DataCatalog,
          ),
        );

      case AppRoutes.catalogChildsPage:
        return CupertinoPageRoute(
          builder: (context) => CatalogChilds(
            childs: routeSettings.arguments as Childs,
          ),
        );

      case AppRoutes.childsProductPage:
        return CupertinoPageRoute(
          builder: (context) => ChildsProducts(
            childsModel: routeSettings.arguments as Childs,
          ),
        );

      case AppRoutes.catalogPage:
        return CupertinoPageRoute(
          builder: (context) => CatalogPage(),
        );
      case AppRoutes.citiesPage:
        return CupertinoPageRoute(
          builder: (context) => CitiesPage(),
        );
      case AppRoutes.logInPage:
        return CupertinoPageRoute(
          builder: (context) => LogInPage(),
        );
      case AppRoutes.brandsChildPage:
        return CupertinoPageRoute(
          builder: (context) =>
              BrandsChildPage(text: routeSettings.arguments as String),
        );
      case AppRoutes.mapPage:
        return CupertinoPageRoute(
          builder: (context) => MapPage(
            stores: routeSettings.arguments as List<AvailableStores>,
          ),
        );
    }
    return null;
  }
}
