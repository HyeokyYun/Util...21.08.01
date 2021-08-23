import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return TodoWidget(
      todo: Todo(
        createdTime: DateTime.now(),
        title: 'Walk the Dog', id: '',
      ),
    );
  }
}