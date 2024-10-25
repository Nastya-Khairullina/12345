import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProduct();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProduct() => _getProductFromUrl(current_productURL );

  Future<List<ProductModel>> _getProductFromUrl(String url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final jsonProduct = json.decode(response.body) as Map<String, dynamic>;
      List<ProductModel> list = [];
      ProductModel resposse = ProductModel.fromJson(jsonProduct);
      list.add(resposse);
      return list;
    } else {
      throw ServerException();
    }
  }
}