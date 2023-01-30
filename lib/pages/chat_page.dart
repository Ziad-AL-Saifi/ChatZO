import 'package:chat_app/const/constant.dart';
import 'package:chat_app/model/massege_model.dart';
import 'package:chat_app/widgets/massege_from.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/my_massege.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'chat';
  CollectionReference masseges =
      FirebaseFirestore.instance.collection(kMassege);
  String? newMassege;
  TextEditingController textInputConnection = TextEditingController();
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String emailID = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: masseges.orderBy('time', descending: true).snapshots(),
      builder: (context, snapshot) {
        List<MassegModel> listMassege = [];
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            listMassege
                .add(MassegModel.getMassegeModel(snapshot.data!.docs[i]));
          }
        }
        return Scaffold(
          appBar: AppBar(backgroundColor: kcolor, title: Text('Chat')),
          body: Column(children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: listMassege.length,
                itemBuilder: (context, index) {
                  return listMassege[index].id == emailID
                      ? MyMasseges(massege: listMassege[index])
                      : MassgeFome(massege: listMassege[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textInputConnection,
                decoration: InputDecoration(
                    hintText: 'Massege',
                    suffixIcon: IconButton(
                        onPressed: () {
                          Map<String, dynamic> newMessage = {
                            kMassege: newMassege,
                            'time': DateTime.now(),
                            'id': emailID,
                          };
                          masseges.add(newMessage);
                          textInputConnection.clear();
                          _controller.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        icon: Icon(Icons.send))),
                onChanged: (value) {
                  newMassege = value;
                },
                onSubmitted: (value) {
                  Map<String, dynamic> newMessage = {
                    kMassege: value,
                    'time': DateTime.now(),
                    'id': emailID,
                  };
                  masseges.add(newMessage);
                  textInputConnection.clear();
                },
                autofocus: true,
              ),
            ),
          ]),
        );
      },
    );
  }
}
