import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_learn_full/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemService(PostModel postModel, int id);
  Future<bool> deleteItemService(PostModel postModel, int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
}

class PostService implements IPostService {
  late final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> putItemService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id',
          data: postModel);

      return response.statusCode == HttpStatus.ok;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteItemService(PostModel postModel, int id) async {
    try {
      final response = await _dio.delete('${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      } else {
        return null;
      }
    } catch (_) {
      print('e');
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }
