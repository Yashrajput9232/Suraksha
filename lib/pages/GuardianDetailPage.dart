// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, avoid_function_literals_in_foreach_calls, unnecessary_null_comparison, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suraksha/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GuardianDetailPage extends StatefulWidget {
  const GuardianDetailPage({Key? key}) : super(key: key);

  @override
  _GuardianDetailPageState createState() => _GuardianDetailPageState();
}

class _GuardianDetailPageState extends State<GuardianDetailPage> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();
  TextEditingController _controllerRelation = TextEditingController();
  List<Item> guardiandetails = [];
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var record = await FirebaseFirestore.instance
        .collection('Guardian Details')
        .doc(_auth.currentUser!.email)
        .get();
    Item item = mapRecords(record);
    _controllerName.text = item.name!;
    _controllerNumber.text = item.number!;
    _controllerRelation.text = item.relation!;
    setState(() {});
  }

  Item mapRecords(DocumentSnapshot<Map<String, dynamic>> records) {
    return Item.fromJson(records.data() ??
        {
          'name': "",
          'number': "",
          'relation': "",
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 103, 82, 181),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                "Update \nGuardian's details",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: _controllerName,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: _controllerNumber,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Number",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: _controllerRelation,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Your Relation",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    const Color.fromARGB(255, 189, 191, 199),
                                child: IconButton(
                                    color:
                                        const Color.fromARGB(255, 29, 28, 28),
                                    onPressed: () {
                                      Map<String, String> dataToSave = {
                                        'name': _controllerName.text,
                                        'number': _controllerNumber.text,
                                        'relation': _controllerRelation.text,
                                      };
                                      setState(() {
                                        isLoading = true;
                                      });
                                      FirebaseFirestore.instance
                                          .collection('Guardian Details')
                                          .doc(_auth.currentUser!.email)
                                          .set(dataToSave)
                                          .then((value) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.black,
                                                content: Text(
                                                    "Details Updated Successfully!",style: TextStyle(color: Colors.white),)));
                                      });
                                    },
                                    icon: isLoading
                                        ? const SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.update,
                                          )),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
