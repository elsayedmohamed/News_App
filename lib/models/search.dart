import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/local/components.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var List = NewsAppCubit.get(context).search;

    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Search'), border: OutlineInputBorder()),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter some Text';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (value != '') {
                      NewsAppCubit.get(context).getSearch(value);
                    }
                  },
                ),
              ),
              Expanded(child: articleItem(list: List, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
