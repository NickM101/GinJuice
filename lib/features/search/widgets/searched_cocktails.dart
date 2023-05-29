// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/cocktail_list_widget.dart';

class SearchedCocktails extends StatelessWidget {
  final AsyncValue value;

  const SearchedCocktails({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: (data) => CocktailList(items: data),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const LoadingSearchWidget());
  }
}

class LoadingSearchWidget extends StatelessWidget {
  const LoadingSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Theme.of(context).primaryColor.withOpacity(0.3),
                highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Container(
                  height: 15.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            highlightColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            child: Container(
                              height: 2.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Shimmer.fromColors(
                            baseColor:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            highlightColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            child: Container(
                              height: 2.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Shimmer.fromColors(
                            baseColor:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            highlightColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            child: Container(
                              height: 2.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              )
            ],
          ),
        );
      },
    );
  }
}
