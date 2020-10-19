import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:list_news/data/model/article_result_model.dart';
import 'package:list_news/data/remote/datasource/article_data_source.dart';

class ArticleApi extends ArticleDataSource {
  final Dio dio;

  ArticleApi({@required this.dio});

  @override
  Future<ArticleResultModel> getListArticle() async {
    try {
      Response response = await dio.get("/top-headlines", queryParameters: {
        "country": "id",
        "category": "business",
        "apiKey": "81d98da5c83d45a5ad24b6ab1698e745"
      });
      return ArticleResultModel.fromJson(response.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
