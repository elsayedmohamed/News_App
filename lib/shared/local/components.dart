import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/web_view.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(article['url'])));
      },
      child: Card(
        shape: const OutlineInputBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: (NetworkImage('${article['urlToImage']}')),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text('${article['publishedAt']}'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget articleItem({required List list, context, isSearch = false}) =>
    ConditionalBuilder(
        condition: list.isNotEmpty,
        builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  color: Colors.grey[400],
                ),
            itemCount: list.length),
        fallback: (context) => isSearch
            ? Container()
            : const Center(child: CircularProgressIndicator()));
