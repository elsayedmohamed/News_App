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
        return ListView.separated(
            itemBuilder: (context, index) => buildArticleItem(list[index]),
            separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  color: Colors.grey[400],
                ),
            itemCount: list.length);
      },
    );
  }
}
