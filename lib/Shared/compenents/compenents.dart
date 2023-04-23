import 'package:flutter/material.dart';


  Widget newsItem(business , context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('${business['urlToImage']}'),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 16),
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        '${business['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Text(
                    '${business['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  
