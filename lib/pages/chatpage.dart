import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 100, 114),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Color.fromARGB(255, 180, 221, 217),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "Name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 180, 221, 217),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 40),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(145, 158, 222, 230),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Text(
                      "Hello, How was the day?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 3),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(145, 208, 222, 230),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "Hello, The day was nice!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Spacer(),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30.0),),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(border: InputBorder.none,hintText: "Type a message",hintStyle: TextStyle(color: Colors.black45)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(color:Color.fromARGB(145, 158, 222, 230),borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Icon(Icons.send, color: Color.fromARGB(188, 30, 146, 82),),),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}
