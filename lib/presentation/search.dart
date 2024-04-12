import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

TextEditingController _searchStudent = TextEditingController();
List<String> students = [
  'Ibrohimov Muhammad Amin',
  'Sardor Rashidov',
  'Jonibek Qodirov',
  'RahmonAli Egamberdiyev',
  'Ismoil Hasanov'
];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 50,
              child: TextField(
                controller: _searchStudent,
                decoration: InputDecoration(
                    hintText: 'search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(_searchStudent.text)));
                        },
                        child: Icon(Icons.search_outlined))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 20,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(students[index]),
                            const Text("age 23"),
                            const Text('raiting 4.5')
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
