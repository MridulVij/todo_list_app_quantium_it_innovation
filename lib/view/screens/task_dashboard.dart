import 'package:flutter/material.dart';
import 'package:todo_list_app/view/widgets/task_tile_widget.dart';

import '../../view_model/routes/route_paths.dart';

class TaskDashboard extends StatefulWidget {
  const TaskDashboard({super.key});

  @override
  State<TaskDashboard> createState() => _TaskDashboardState();
}

class _TaskDashboardState extends State<TaskDashboard> {
  TaskTileWidget taskTileWidget = TaskTileWidget();

  List<String> sortOptions = [
    'Sort By Priority',
    'Sort By Due Date',
    'Sort By Creation Date'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.search_tasks);
            },
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
              onSelected: (value) {
                if (value == "edit") {
                  // open edit page to edit the text
                  // navigationtoeditpage(item);
                } else if (value == "delete") {
                  // delete the tile and refresh the page
                  // deletebyID(itemId);
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: sortOptions[0],
                    child: Text(sortOptions[0]),
                  ),
                  PopupMenuItem(
                    value: sortOptions[1],
                    child: Text(sortOptions[1]),
                  ),
                  PopupMenuItem(
                    value: sortOptions[2],
                    child: Text(sortOptions[2]),
                  )
                ];
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: taskTileWidget.taskTile(1, 'Task Title', '20 March - 6 PM'),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.create_view_edit_tasks);
        },
        elevation: 0.0,
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
