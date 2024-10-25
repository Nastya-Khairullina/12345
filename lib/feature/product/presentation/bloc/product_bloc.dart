import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/feature/product/presentation/bloc/product_event.dart';
import 'package:untitled2/feature/product/presentation/bloc/product_state.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/product_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase getAllProductUseCase;

  ProductBloc({required this.getAllProductUseCase}) : super(ProductLoadingState()) {
    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());
      List<ProductEntity> _productList = [];
      final _loadedProductList = await getAllProductUseCase(getAllProductParams(query: event.productQuery));

      _loadedProductList.fold((l) => emit(const ProductErrorState(message: 'error')),
              (r) => _productList.addAll(r));

      emit(ProductLoadedState(loadedProduct: _productList));
    }
    );
  }
}
