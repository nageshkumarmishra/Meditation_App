import 'package:flutter/material.dart';
import 'package:meditation_app/widgets/rectangle_button.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meditation_app/mantra.dart';
import 'package:meditation_app/pages/mantraDetailPage.dart';

class MantraListPage extends StatefulWidget {
  final String deityName;

  MantraListPage({Key? key, required this.deityName}) : super(key: key);

  @override
  _MantraListPageState createState() => _MantraListPageState();
}

class _MantraListPageState extends State<MantraListPage> {
  List<Mantra> mantras = [];

  @override
  void initState() {
    super.initState();
    _fetchMantras();
  }

  Future<void> _fetchMantras() async {

    final name = widget.deityName.toLowerCase();
    
    print('https://raw.githubusercontent.com/nageshkumarmishra/JSONData/main/${widget.deityName.toLowerCase()}/${widget.deityName.toLowerCase()}.json');
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/nageshkumarmishra/JSONData/main/${widget.deityName.toLowerCase()}/${widget.deityName.toLowerCase()}.json'));

    if (response.statusCode == 200) {
      final List<dynamic> mantraJsonList = json.decode(
          response.body)['mantras'];
      setState(() {
        mantras = mantraJsonList.map((json) => Mantra.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load mantras');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('${widget.deityName} Mantras', style: TextStyle(fontSize: 24, fontFamily: 'SanskritFont', color: Colors.white,
        ),),
        backgroundColor: Colors
            .deepPurple, // Choose a color that fits your app design

      ),
      body: ListView.builder(
        itemCount: mantras.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: Icon(Icons.bookmark, color: Colors.deepPurple),
                title: Text(
                  mantras[index].title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 16.0,
                  ),
                ),
                subtitle: Text(
                  mantras[index].sanskrit ?? '',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MantraDetailPage(mantra: mantras[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
