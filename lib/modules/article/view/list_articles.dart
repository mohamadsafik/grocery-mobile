import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/modules/home/cubit/home_cubit.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_cubit/themes/themes.dart';
import 'package:flutter_cubit/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../../engine/helpers/options.dart';
import '../../../resources/resources.dart';

class ListArticlePage extends StatelessWidget {
  const ListArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Article",
          style: AppFont.whiteLarge(context)!.copyWith(fontSize: 18),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
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
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed(RouteNames.singleArticle,
                          extra: state.data[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 111,
                      width: 182,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ImageLoad(
                            fit: BoxFit.cover,
                            errorWidget: Resources.images.elkopra.image(),
                            imageUrl: state.data[index].urlToImage ?? ""),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12);
                },
                itemCount: state.data.length),
          );
        },
      ),
    );
  }
}
