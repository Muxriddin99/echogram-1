import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echogram/pages/chatpage.dart';
import 'package:echogram/service/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;

  var queryResultSet = [];
  var tempSerchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSerchStore = [];
      });
      setState(() {
        search = true;
      });
      var capitalizedValue =
          value.substring(0, 1).toUpperCase() + value.substring(1);
      if (queryResultSet.length == 0 && value.length == 1) {
        DatabaseMethods().Search(value).then((QuerySnapshot docs) {
          for (int i = 0; i < docs.docs.length; ++i) {
            queryResultSet.add(docs.docs[i].data());
          }
        });
      } else {
        tempSerchStore = [];
        queryResultSet.forEach((element) {
          if (element['username'].startsWith(capitalizedValue)) {
            setState(() {
              tempSerchStore.add(element);
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 100, 114),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, right: 20.0, left: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  search
                      ? Expanded(
                          child: TextField(
                          onChanged: (value) {
                            initiateSearch(value.toUpperCase());
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Serch User',
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ))
                      : Text(
                          "ChatUp",
                          style: TextStyle(
                              color: Color.fromARGB(255, 180, 221, 217),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                  GestureDetector(
                    onTap: () {
                      search = true;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 131, 118),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 180, 221, 217),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: search
                    ? MediaQuery.of(context).size.height / 1.19
                    : MediaQuery.of(context).size.height / 1.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    search
                        ? ListView(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            primary: false,
                            shrinkWrap: true,
                            children: tempSerchStore.map((element) {
                              return buildResultCard(element);
                            }).toList(),
                          )
                        : Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatPage()));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.asset(
                                        "images/bb.jpg",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Mark",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Hello, how are you?",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      "04:30 PM",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.asset(
                                      "images/ilon.jpg",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Musk",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Hello",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "14:30 PM",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget buildResultCard(data) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["Name"],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  data["username"],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
