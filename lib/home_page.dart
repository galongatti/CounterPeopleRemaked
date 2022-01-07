import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 50, 82, 201),
      body: createContainer(),
    );
  }

  Container createContainer() {
    return Container(
      child: createColumn(),
    );
  }

  Widget createColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: createChildrenColumn(),
    );
  }

  List<Widget> createChildrenColumn() {
    return [messageText(), counterText(), createRow()];
  }

  Widget messageText() {
    return Text(isFull ? "Not cleared" : "Cleared",
        style: TextStyle(
            fontSize: 28,
            color: isFull
                ? const Color.fromARGB(255, 236, 3, 3)
                : const Color.fromARGB(255, 71, 170, 61),
            fontWeight: FontWeight.w500));
  }

  Widget counterText() {
    return Padding(
        padding: const EdgeInsets.all(48),
        child: Text("$count",
            style: TextStyle(
                fontSize: 40,
                color: isFull
                    ? const Color.fromARGB(255, 236, 3, 3)
                    : const Color.fromARGB(255, 71, 170, 61),
                fontWeight: FontWeight.w400)));
  }

  Widget createRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [decrementButton(), incrementButton()],
    );
  }

  Widget decrementButton() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextButton(
          onPressed: isEmpty ? null : decrement,
          child: const Text("Leave",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
              )),
          style: TextButton.styleFrom(
              backgroundColor: isEmpty
                  ? const Color.fromARGB(255, 134, 130, 130)
                  : const Color.fromARGB(255, 236, 3, 3),
              padding: const EdgeInsets.all(12),
              fixedSize: const Size(100, 100),
              primary: const Color.fromARGB(255, 56, 46, 46),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
        ));
  }

  Widget incrementButton() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextButton(
          onPressed: isFull ? null : increment,
          child: const Text(
            "Enter",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: isFull
                  ? const Color.fromARGB(255, 134, 130, 130)
                  : const Color.fromARGB(255, 45, 167, 22),
              padding: const EdgeInsets.all(12),
              fixedSize: const Size(100, 100),
              primary: const Color.fromARGB(255, 56, 46, 46),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
        ));
  }
}
