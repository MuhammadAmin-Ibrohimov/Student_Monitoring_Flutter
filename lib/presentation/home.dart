import 'package:flutter/material.dart';
import 'package:monitoring/presentation/course_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<String> subjects = ['Math', 'Physics', 'Geology', 'Engling ', 'Russian'];
TextEditingController _searchSubject = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              controller: _searchSubject,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'search',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_searchSubject.text)));
                      },
                      child: Icon(Icons.search_outlined))),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailPage(),
                    ));
              },
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return card(subjects[index]);
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget card(String subject) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Number of student: 50",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    ),
  );
}
