import 'package:texnomart/data/models/sliders_model.dart';
import 'package:texnomart/data/models/specialBrends_model.dart';

import 'categories_model.dart';
import 'collections_model.dart';
import 'hitProducts_model.dart';
import 'newProducts_model.dart';
import 'news_model.dart';

class MainPageModel {
  final SlidersModel? slidersModel;
  final CategoriesModel? categoriesModel;
  final CollectionsModel? collectionsModel;
  final HitProductsModel? hitProductsModel;
  final NewProductsModel? newProductsModel;
  final NewsModel? newsModel;
  final SpecialBrendsModel? specialBrendsModel;

  MainPageModel(
      this.slidersModel,
      this.categoriesModel,
      this.collectionsModel,
      this.hitProductsModel,
      this.newProductsModel,
      this.newsModel,
      this.specialBrendsModel);
}
