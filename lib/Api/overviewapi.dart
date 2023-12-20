import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class StateOverview extends StatefulWidget {
  const StateOverview({Key? key, this.stateName}) : super(key: key);
  final stateName;

  @override
  _StateOverviewState createState() => _StateOverviewState();
}

class _StateOverviewState extends State<StateOverview> {
  Map<String, dynamic> knowledgeGraph = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFlightResults();
  }

  Future<void> fetchFlightResults() async {
    const apiKey =
        '1b49aa31d7c9e086949e09fddb98f657585448bbe62af3d3ce0ce2e18d204443';
    final query = '${widget.stateName} information';

    final url =
        'https://serpapi.com/search.json?engine=google&api_key=$apiKey&q=$query';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        knowledgeGraph = Map<String, dynamic>.from(data['knowledge_graph']);
        isLoading = false;
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                '${knowledgeGraph['description']}',
                style: TextStyle(fontSize: 19),
                textAlign: TextAlign.justify,
              ),
            ),
    );
  }
}
