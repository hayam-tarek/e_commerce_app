import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/products_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSimpleAppBar(context: context, title: 'Product Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is GetProductDetailsLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: kSecondaryColor,
                ),
              );
            } else if (state is GetProductDetailsFailure) {
              return Center(
                child: Text(state.message),
              );
            } else {
              ProductModel productModel =
                  BlocProvider.of<ProductsCubit>(context).productDetails!;
              return ProductDetailsBody(productModel: productModel);
            }
          },
        ),
      ),
    );
  }
}
