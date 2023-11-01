import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/engine/engine.dart';
import 'package:flutter_cubit/resources/resources.dart';
import 'package:flutter_cubit/routes/routes.dart';
import 'package:flutter_cubit/themes/themes.dart';
import 'package:flutter_cubit/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import '../cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ContainerStateHandler(
            loading: const Center(
              child: CircularProgressIndicator(),
            ),
            status: state.status,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(
                        height: 52,
                        width: 52,
                        child: Resources.images.profilePicture
                            .image(fit: BoxFit.cover)),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Good Morning",
                          style: AppFont.small(context)!
                              .copyWith(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.user?.email ?? "",
                          style: AppFont.mediumPrimary(context)!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                        onPressed: () {
                          Sessions.clear();
                          context.replaceNamed(RouteNames.root);
                        },
                        child: Resources.icons.menu.svg(height: 24, width: 24))
                  ],
                ),
                const SizedBox(height: 30),
                const CardBalance(),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FeatureCard(
                      label: 'Credit Application',
                      icon: Resources.icons.applicationCard.svg(),
                    ),
                    FeatureCard(
                      label: 'Vouchers',
                      icon: Resources.icons.voucher.svg(),
                    ),
                    FeatureCard(
                      label: 'SPSW & Balance',
                      icon: Resources.icons.balance.svg(),
                    ),
                    FeatureCard(
                      label: 'POS Cafe',
                      icon: Resources.icons.posCafe.svg(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Transaction",
                      style: AppFont.large(context),
                    ),
                    Text(
                      "See all",
                      style: AppFont.smallPrimary(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: baseWidth,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Resources.images.noTransaction.image(),
                      Text(
                        "No Transaction",
                        style: AppFont.largeBold(context),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest News",
                      style: AppFont.large(context),
                    ),
                    CustomButton(
                      onPressed: () =>
                          context.pushNamed(RouteNames.listArticle),
                      child: Text(
                        "See all",
                        style: AppFont.smallPrimary(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 111,
                  width: baseWidth,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => context.pushNamed(
                              RouteNames.singleArticle,
                              extra: state.data[index]),
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
                                  imageUrl: state.data[index].urlToImage!),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 8);
                      },
                      itemCount: 4),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String label;
  final Widget icon;
  const FeatureCard({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            label,
            style: AppFont.medium(context),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class CardBalance extends StatelessWidget {
  const CardBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 170,
        width: baseWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 124, 41, 232),
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Balance",
                    style: AppFont.whiteMedium(context)!
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                  ),
                  Text(
                    "10/23",
                    style: AppFont.whiteMedium(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Rp. 2.800.788",
                style: AppFont.whiteLarge(context)!.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "*** **** **** 1289",
                    style: AppFont.whiteMedium(context)!
                        .copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                  Resources.images.elkopra.image()
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: -30,
        bottom: -100,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
        ),
      ),
      Positioned(
        right: -80,
        top: -150,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
        ),
      )
    ]);
  }
}
