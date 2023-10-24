import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_full/202/service/post_model.dart';

class ServiceLearnAgain extends StatefulWidget {
  const ServiceLearnAgain({super.key});

  @override
  State<ServiceLearnAgain> createState() => _ServiceLearnAgainState();
}

class _ServiceLearnAgainState extends State<ServiceLearnAgain> {
  bool _isloading = false;
  String? name;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyContoller = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
  }

  void _changeLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    if (response.statusCode == HttpStatus.created) {
      name = 'Başarılı';
      _changeLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isloading
              ? Center(child: CircularProgressIndicator.adaptive())
              : SizedBox.shrink()
        ],
        title: Text(name!),
      ),
      body: Column(
        children: [
          TextField(
              textInputAction: TextInputAction.next,
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title')),
          TextField(
              textInputAction: TextInputAction.next,
              controller: _bodyContoller,
              decoration: InputDecoration(labelText: 'Body')),
          TextField(
              keyboardType: TextInputType.number,
              controller: _userIdController,
              decoration: InputDecoration(labelText: 'UserId')),
          TextButton(
            onPressed: () {},
            child: Text('SEND'),
          ),
        ],
      ),
    );
  }
}
