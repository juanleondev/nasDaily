import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController customerTEC = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> customerList = [];
  bool lockAddButton = true;
  @override
  void initState() {
    customerTEC.addListener(() {
      if (customerTEC.text != '') {
        setState(() {
          lockAddButton = false;
        });
      } else {
        setState(() {
          lockAddButton = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer List'),
      ),
      body: AnimatedList(
          key: _listKey,
          initialItemCount: customerList.length,
          itemBuilder: (_, index, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: ListTile(
                title: Text(customerList[index]),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: customerTEC,
                    decoration: const InputDecoration(hintText: 'Add Customer'),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: lockAddButton
                    ? null
                    : () {
                        FocusScope.of(context).unfocus();
                        _listKey.currentState!.insertItem(customerList.length);
                        setState(() {
                          customerList.add(customerTEC.text);
                          customerTEC.text = '';
                        });
                      },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
