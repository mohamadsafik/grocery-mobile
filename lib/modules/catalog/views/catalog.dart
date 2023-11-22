import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/modules/catalog/cubit/catalog_cubit.dart';
import 'package:flutter_cubit/modules/catalog/views/product_card.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_cubit/themes/themes.dart';
import 'package:flutter_cubit/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../engine/helpers/options.dart';
import '../../cart/views/floating_cart.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CatalogCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: cubit.searchTerm,
                        decoration: InputDecoration(
                          hintText: "Search Product",
                          hintStyle: TextStyle(
                            color: AppColor.appColor.primary,
                          ),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: AppColor.appColor.primary,
                          ),
                        ),
                        onChanged: (value) {
                          cubit.searctProduct(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      Sessions.clear().then(
                          (value) => context.replaceNamed(RouteNames.root));
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                      color: AppColor.appColor.primary,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CatalogCubit, CatalogState>(
                builder: (context, state) {
                  return ContainerStateHandler(
                    refresherOptions: RefresherOptions(
                      controller: cubit.refreshController,
                      onRefresh: cubit.refreshData,
                      onLoading: cubit.loadMoreData,
                      enablePullUp: state.canLoadMore,
                    ),
                    loading: Center(
                      child: CircularProgressIndicator(),
                    ),
                    status: state.status,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      children: [
                        const SizedBox(height: 20),
                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.58),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                catalog: state.data[index],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CartFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
