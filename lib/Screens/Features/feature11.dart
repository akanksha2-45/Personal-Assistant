import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Feature11 extends StatefulWidget {
  @override
  _Feature11State createState() => _Feature11State();
}

class _Feature11State extends State<Feature11> {
  String _url = "https://owlbot.info/api/v4/dictionary/";
  String _token = "a8809df4453f7e583c9797bfe2d8783e68cc1b6d";

  TextEditingController _controller = TextEditingController();

  StreamController _streamController;
  Stream _stream;

  Timer _debounce;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    Response response = await get(_url + _controller.text.trim(),
        headers: {"Authorization": "Token " + _token});
    _streamController.add(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 156, 156 , 1),
        title: Padding(
          padding: EdgeInsets.only(left: 26.0, top: 20.0),
          child: Text("Dictionary", 
          style: TextStyle(
            fontSize: 45, 
            color: Colors.black,
            fontFamily: 'Ramaraja',
            )
            ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(88.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, bottom: 15.0),
                  padding: const EdgeInsets.only(right:10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rasa',
                      fontSize: 22.0
                    ),
                    onChanged: (String text) {
                      if (_debounce?.isActive ?? false) _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                    
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.only(bottom:10.0),
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  _search();
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Text("Search a word"),
              );
            }

            if (snapshot.data == "waiting") {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data["definitions"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListBody(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFEBEE),
                        border: Border.all(
                          color:Colors.black,
                          width:2.0
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black12,
                            child: ListTile(
                              leading: snapshot.data["definitions"][index]
                                          ["image_url"] ==
                                      null
                                  ? null
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data["definitions"][index]
                                              ["image_url"]),
                                    ),
                              title: Text(
                                _controller.text.trim() + " " +
                                    "(" +
                                    snapshot.data["definitions"][index]
                                        ["type"] +
                                    ")",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold, 
                                  color: Color.fromRGBO(72, 12, 107 , 1),
                                  fontFamily: 'Kurale',
                                  ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(snapshot.data["definitions"][index]
                                ["definition"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  ),
                                ),
                          ),
                          SizedBox(height:20.0),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
