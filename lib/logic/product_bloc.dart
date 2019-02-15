import 'dart:async';

import 'package:beta_balmer/logic/product_view_model.dart';
import 'package:beta_balmer/model/product.dart';

class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel();
  final productController = StreamController<List<Product>>();
  Stream<List<Product>> get productItems => productController.stream;

  ProductBloc() {
    productController.add(productViewModel.getProducts());
  }
}
