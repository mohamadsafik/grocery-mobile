import 'package:flutter/material.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/themes/themes.dart';

import '../../../data/models/base/article.dart';
import '../../../resources/resources.dart';
import '../../../widgets/components/image_load.dart';

class SingleArticle extends StatelessWidget {
  final Article article;
  const SingleArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        article.title ?? "",
        style: AppFont.whiteMedium(context),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                height: 200,
                width: baseWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageLoad(
                      fit: BoxFit.cover,
                      errorWidget: Resources.images.elkopra.image(),
                      imageUrl: article.urlToImage ?? ""),
                ),
              ),
              SizedBox(height: 20),
              Text("Author : ${article.author}"),
              Text("Published : ${article.publishedAt?.toEEEddMMMMyyyy()}"),
              Text("Source : ${article.source?.name ?? ""}"),
              SizedBox(height: 20),
              Text(
                "Title",
                style: AppFont.mediumBold(context),
              ),
              Text(
                article.title ?? "",
                style: AppFont.medium(context),
              ),
              SizedBox(height: 20),
              Text(
                "content",
                style: AppFont.mediumBold(context),
              ),
              Text(
                article.content ?? "",
                style: AppFont.medium(context),
              ),
              SizedBox(height: 20),
              Text(
                "description",
                style: AppFont.mediumBold(context),
              ),
              Text(
                article.description ?? "",
                style: AppFont.medium(context),
              ),
              Text(
                article.url ?? "",
                style: AppFont.mediumPrimary(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
