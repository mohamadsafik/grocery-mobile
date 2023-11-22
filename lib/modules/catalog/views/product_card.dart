import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cubit/data/models/base/catalog.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_cubit/themes/themes.dart';
import 'package:flutter_cubit/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final Catalog catalog;
  const ProductCard({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: BorderRadius.circular(16),
      onPressed: () {
        context.pushNamed(RouteNames.singleCatalog, extra: catalog.id);
      },
      child: Card(
        color: (catalog.status == "OUT_OF_STOCK")
            ? Colors.black.withOpacity(0.03)
            : null,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 160,
              width: baseWidth,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageLoad(
                    imageUrl: "${Environment.baseUrl()}${catalog.image}",
                    fit: BoxFit.cover,
                    errorWidget: Icon(
                      Icons.error,
                      size: 36,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catalog.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    (catalog.stock! < 1)
                        ? "Out of Stock"
                        : "Stock ${catalog.stock.toString()}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  Text(catalog.price.currencyFormat(symbol: "Rp. "),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColor.appColor.success,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  Icon(Icons.favorite_border, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
