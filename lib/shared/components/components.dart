import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';


Widget buildArticleItem(article, context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover
          ),
        ),
      ),
      const   SizedBox(width: 20.0,),
      Expanded(
        child: SizedBox(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text('${article['title']}',style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,),),
               const SizedBox(height: 8.0,),
              Text('${article['publishedAt']}',style: const TextStyle(color: Colors.grey)),

            ],
          ),
        ),
      ),
    ],
  ),
);

Widget divider()=> Padding(
  padding: EdgeInsets.all(8.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade300,
  ),

);


Widget articleBuilder (list)=>ConditionalBuilderRec(
  condition: list.length >0,
  builder: (context)=> ListView.separated(
      physics: BouncingScrollPhysics(),itemBuilder: (context, index)=>buildArticleItem(list[index], context), separatorBuilder: (context, index)=>divider(), itemCount: 10),
  fallback: (context)=>Center(
    child: CircularProgressIndicator(),
  ),
);