import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud/controllers/TodoController.dart';
import 'package:getx_crud/models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Write your Thought...!',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none
                ),
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: (){
                      todoController.todos.add(
                        Todo(text: textEditingController.text));
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Add'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
