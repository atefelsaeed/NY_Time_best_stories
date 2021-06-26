import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:nyt_best_stories/models/article_model.dart';
import 'package:nyt_best_stories/modules/web_view/web_view_screen.dart';

GlobalKey? key;

// Widget buildArticleItem(ArticleDataModel articleDataModel, context) => InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(articleDataModel.results['url']));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 //=========image==============
//                 Container(
//                   width: double.infinity,
//                   height: 120.0,
//                   child:Image(image: NetworkImage(
//                     '${articleDataModel.results[index]['multimedia'].map((e) => e['url'].toString())}',)),
//                   decoration: BoxDecoration(
//                     // color: Colors.grey,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 150,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${article['title']}',
//                             style: TextStyle(
//                               fontSize: 12,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             '${article['abstract']}',
//                             style: Theme.of(context).textTheme.bodyText1,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 50,
//                     ),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${article['published_date']}',
//                             style: TextStyle(
//                               fontSize: 12,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             '${article['created_date']}',
//                             style: TextStyle(
//                               fontSize: 12,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(ArticleDataModel articleDataModel, context, {isSearch = false}) =>
    ConditionalBuilder(
      condition: articleDataModel.results!.length > 0,
      builder: (context) => ListView.separated(
        //it make the color of scroll hidden
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            InkWell(
              onTap: () {
                navigateTo(context, WebViewScreen(
                  ' ${articleDataModel.results![index].url}'));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        //=========image==============
                        Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage('${articleDataModel.results![index].multimedia![index].url}'),
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${articleDataModel.results![index].title}',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${articleDataModel.results![index].abstract}',
                                    style: Theme.of(context).textTheme.bodyText1,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${articleDataModel.results![index].publishedDate}',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${articleDataModel.results![index].createdDate}',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: articleDataModel.results!.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
