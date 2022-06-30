import 'package:flutter/material.dart';

Widget buildArticleItem(Map article) => Card(
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
    );
