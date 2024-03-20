import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list_app/model/utils/date_time_picker.dart';
import 'package:todo_list_app/view/widgets/custom_button_container.dart';

class TaskCreateEdit extends StatefulWidget {
  // final String? taskTitle;
  const TaskCreateEdit({
    super.key,
    //  required this.taskTitle
  });

  @override
  State<TaskCreateEdit> createState() => _TaskCreateEditState();
}

class _TaskCreateEditState extends State<TaskCreateEdit> {
  CustomButtonContainer customButtonContainer = CustomButtonContainer();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> priorityOptions = ['Low', 'Medium', 'High'];

  DateTimePicker dateTimePicker = DateTimePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.taskTitle!),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: null,
                      style: const TextStyle(fontSize: 30),
                      controller: titleController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Title'),
                    ),
                    const Divider(),
                    TextFormField(
                      style: const TextStyle(fontSize: 20),
                      // expands: true,
                      maxLines: null,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Description'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: customButtonContainer.customColorfulContainer(
                    2,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Set Reminder',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ), () async {
                  // Date & Time Picker
                  await dateTimePicker.selectDate(context);
                  await dateTimePicker.selectTime(context);
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: customButtonContainer.customColorfulContainer(
                    1,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Set Priority',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ), () {
                  print('tap');
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}