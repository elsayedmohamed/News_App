import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';

import '../cubit/states.dart';
import '../shared/local/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsAppCubit.get(context).business;
        return ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildArticleItem(list[index]),
                separatorBuilder: (context, index) => Container(
                      height: 1.0,
                      color: Colors.grey[400],
                    ),
                itemCount: list.length),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
