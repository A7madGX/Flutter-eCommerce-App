import 'package:krispy_store/classes/utils/category.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/service/user_service.dart';

abstract class DataSource {
  static Future<List<Product>> getProductsByCategory(MyCategoryType cat) async {
    return await UserService.getProducts(cat);
  }
}
