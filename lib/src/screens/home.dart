import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'General',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
            Divider(),
            ListTile(
              title: Text('Name: '),
            ),
            ListTile(
              title: Text('Age: '),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Profession',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
            Divider(),
            ListTile(
              title: Text('profession 1'),
            ),
            ListTile(
              title: Text('profession 2'),
            ),
            ListTile(
              title: Text('profession 3'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'other'),
          child: const Icon(Icons.arrow_circle_right)),
    );
  }
}
