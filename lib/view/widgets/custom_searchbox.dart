import 'package:flutter/material.dart';

class CustomSearchBox extends StatefulWidget {
  final TextEditingController controller;

  const CustomSearchBox({Key? key, required this.controller}) : super(key: key);

  @override
  _CustomSearchBoxState createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        onChanged: (value) {
          // context.read<TodoCubit>().searchByTitle(widget.controller.text);
        },
        //Search error
        // controller: widget.controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter Task Title...',
          hintStyle: TextStyle(
            color: Color.fromARGB(92, 94, 169, 250),
          ),
          suffixIcon: SizedBox(
            height: 8,
            width: 8,
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
