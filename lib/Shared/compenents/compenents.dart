// ignore_for_file: non_constant_identifier_names, unused_import, deprecated_member_use

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Layout/NewsCubit/cubit.dart';
import 'package:newsapp/Modules/web%20_view/web_screen.dart';

import '../../Layout/NewsCubit/States.dart';

Widget newsItem(article, context) {
  return InkWell(
    onTap: () {
      NavigateTo(context: context, widget: WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
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
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
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
    ),
  );
}

Widget Newsbuilder(list) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return newsItem(list[index], context);
        },
        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsetsDirectional.symmetric(
              vertical: 8, horizontal: 12),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        itemCount: list.length,
      );
    },
    fallback: (context) => const Center(child: CircularProgressIndicator()),
  );
}

typedef Valid = String? Function(String? value);
Widget defaultFromFiled({
  required TextEditingController control,
  TextInputType? type,
  Function? Function(String? value)? submit,
  Function? Function(String? value)? change,
  Function? Function()? ontap,
  Valid? valid,
  Icon? prefix,
  IconButton? suffix,
  required String lable,
  bool secure = false,
  GlobalKey<FormState>? key,
  bool isEnable = true,
}) =>
    TextFormField(
      key: key,
      onChanged: change,
      onFieldSubmitted: submit,
      validator: valid,
      onTap: ontap,
      controller: control,
      keyboardType: type,
      obscureText: secure,
      enabled: isEnable,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: lable,
        border: const OutlineInputBorder(),
      ),
    );

void NavigateTo({required context, required Widget widget}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}
