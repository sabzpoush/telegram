import 'package:flutter/material.dart';
import 'new_message_page_body.dart';

class NewMessagePage extends StatefulWidget {
  const NewMessagePage({super.key});

  @override
  State<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends State<NewMessagePage> {
  String? firstName;
  String? lastName;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: newMessagePageAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.grey[850],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            context: context,
            builder: (context) {
              return Container(
                color: Colors.grey[850],
                height: 365,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                        left: 11,
                        bottom: 5,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'New Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    textFiledBuilder(
                      label: "First name (Required)",
                      optional: false,
                      textFiledController: firstNameController,
                    ),
                    textFiledBuilder(
                      label: 'Last name (Optional)',
                      optional: true,
                      textFiledController: lastNameController,
                    ),
                    numberBuilders(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 5,
                      ),
                      child: SizedBox(
                        height: 55,
                        width: 370,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                firstName = firstNameController.text;
                                lastName = lastNameController.text;
                                Navigator.of(context).pop();
                                firstNameController.text = '';
                                lastNameController.text = '';
                                personCount++;
                                listItem.add(
                                  listPeopleBuilder(
                                    index: personCount - 1,
                                    name: '$firstName $lastName',
                                    multipleBuildigMember: false,
                                  ),
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Create Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
      body: const NewMessagePageBody(),
    );
  }

  AppBar newMessagePageAppBar() {
    return AppBar(
      title: const Text(
        'New Message',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      backgroundColor: Colors.grey[800],
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget textFiledBuilder({required String label, required bool optional, required TextEditingController textFiledController}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textFiledController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: borderColor,
              style: BorderStyle.solid,
              strokeAlign: 2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: defaultBorderColor,
              style: BorderStyle.solid,
              strokeAlign: 2,
              width: 2,
            ),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelStyle: const TextStyle(
            color: Colors.white38,
          ),
          labelText: label,
          floatingLabelStyle: const TextStyle(
            color: Colors.lightBlue,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: defaultBorderColor,
              width: 3,
            ),
          ),
          // label: Text("$label ${optional ? "(Optional)" : "(required)"}", style: const TextStyle(color: Colors.white54))),
        ),
      ),
    );
  }

  Color borderColor = Colors.lightBlue;
  Color defaultBorderColor = Colors.white38;
  Row numberBuilders() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 4,
          ),
          child: SizedBox(
            height: 55,
            width: 100,
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              scrollPadding: EdgeInsets.zero,
              keyboardType: TextInputType.phone,
              scribbleEnabled: false,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelStyle: const TextStyle(
                  color: Colors.deepPurple,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    color: defaultBorderColor,
                    style: BorderStyle.solid,
                    strokeAlign: 2,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: defaultBorderColor,
                    style: BorderStyle.solid,
                    strokeAlign: 2,
                    width: 2,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.flag,
                  color: Colors.white,
                ),
                hintText: '+98',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            top: 10,
            bottom: 4,
          ),
          child: SizedBox(
            height: 55,
            width: 250,
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    color: borderColor,
                    style: BorderStyle.solid,
                    strokeAlign: 2,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: defaultBorderColor,
                    style: BorderStyle.solid,
                    strokeAlign: 2,
                    width: 2,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                hintText: '  000 000 0000',
                hintStyle: const TextStyle(
                  color: Colors.white38,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
