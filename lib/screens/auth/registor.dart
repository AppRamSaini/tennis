import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tennis/styles/my_app_theme.dart';

class Registor extends StatefulWidget {
  const Registor({Key? key}) : super(key: key);

  @override
  State<Registor> createState() => _RegistorState();
}

class _RegistorState extends State<Registor> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool onError = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: MyAppTheme.whiteColor,
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      child: Stack(children: [
                        Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              style: TextStyle(color: Colors.amber, fontSize: 14),
                             // controller: emailEditingController,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.fromLTRB(30, 5, 10, 5),
                                labelText: "Enter Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 14),
                              ),
                              validator: (String? value) {
                                setState(() {
                                  onError = false;
                                });
                                if (value!.isEmpty) {
                                  setState(() {
                                    onError = true;
                                  });
                                  return null;
                                }
                                return null;
                              },
                            )),
                        onError
                            ? Positioned(
                            bottom: 0,
                            child: Text('this is an error msg',
                                style: TextStyle(color: Colors.red)))
                            : Container()
                      ]))),
              MaterialButton(
                  key: Key('login'),
                  minWidth: 150,
                  height: 50,
                  color: Colors.amber,
                  child: Text('login'),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState!.validate()) {}
                  }),
            ],
          ),
        ),
          ),
        )
        ,
      ),
    );
  }
}
