import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/modules/catalog/cubit/single_catalog_cubit.dart';
import 'package:flutter_cubit/themes/themes.dart';
import 'package:flutter_cubit/widgets/components/container_state_handler.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../widgets/components/image_load.dart';
import '../../cart/views/floating_cart.dart';

class SingleCatalogpage extends StatelessWidget {
  const SingleCatalogpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SingleCatalogCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Product"),
      ),
      body: BlocBuilder<SingleCatalogCubit, SingleCatalogState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: Center(child: CircularProgressIndicator()),
            status: state.status,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 260,
                  width: baseWidth,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ImageLoad(
                        imageUrl:
                            "${Environment.baseUrl()}${state.product?.image}",
                        fit: BoxFit.cover,
                        errorWidget: Icon(
                          Icons.error,
                          size: 36,
                        ),
                      )),
                ),
                Divider(thickness: 2),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
                  children: [
                    Text(
                      state.product?.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 4),
                    Text(
                      state.product?.price.currencyFormat(symbol: "Rp ") ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.appColor.success,
                          ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Description",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      state.product?.description ?? "",
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Card(
                          elevation: 1,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (int.parse(cubit.countProduct.text) > 1) {
                                    cubit.minCountProduct(
                                        cubit.countProduct.text);
                                  }
                                },
                              ),
                              Container(
                                width: 40,
                                child: TextField(
                                  readOnly: true,
                                  controller: cubit.countProduct,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cubit
                                      .addCountProduct(cubit.countProduct.text);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                              onPressed: () {
                                cubit.addToCart();
                              },
                              child: Text("Add To Cart")),
                        )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: CartFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
