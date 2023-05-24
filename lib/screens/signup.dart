import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {

  @override
  State<SignUP> createState() => _SignUPState();
}

final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
 String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);
bool obserText=true;

class _SignUPState extends State<SignUP> {

  void validation() {
    final FormState form =  _formKey.currentState!;
    if(form.validate()) {
      print("Yes");
    }
    else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      Text("Register", style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,  
                      ),
                      ),
                    ],
                  ),
                ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 400,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextFormField(
                          validator: (value){
                            if(value != null && value.length < 6) {
                              return "Username Is Too Short";
                            }
                            else if (value == "") {
                              return "Please Fill Username";
                            }
                          },
                          decoration:  const InputDecoration(
                            hintText: "Username",
                            icon: Icon(Icons.verified_user),
                            hintStyle:  TextStyle(
                              color: Colors.black,
                            ),
                            border:  OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value == "") {
                              return "Please Fill Email";
                            }
                            else if (!regExp.hasMatch(value!)) {
                              return "Email Is Invalid";
                            }
                            return "";
                          },
                          decoration:  const InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.email),
                            hintStyle:  TextStyle(
                              color: Colors.black,
                            ),
                            border:  OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          obscureText: obserText,
                          validator: (value) {
                            if(value == "") {
                              return "Please Fill Password";
                            }
                            else if(value != null && value.length < 8) {
                              return "Password Is Too Short";
                            }
                            return "";
                          },
                          decoration:   InputDecoration(
                            
                            hintText: "Password",
        
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText=!obserText;
                                });
                                FocusScope.of(context).unfocus();
                              } ,
                              child: const Icon(
                                //obserText==true? Icons.visibility,
                                Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            icon: const Icon(Icons.password),
                            hintStyle:  const TextStyle(
                              color: Colors.black,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value == "") {
                              return "Please Fill Phone Number";
                            }
                            else if(value != null && value.length < 10) {
                              return "Short Phone Number (06 xx xx xx xx)";
                            }
                            return "";
                          },
                          decoration:  const InputDecoration(
                            hintText: "Phone Number",
                            icon: Icon(Icons.phone),
                            hintStyle:  TextStyle(
                              color: Colors.black,
                            ),
                            border:  OutlineInputBorder(),
                          ),
                        ),
                        //Raisedbutton depraceted since 2021 so I used RaisedButton 
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black, // Background color
                              ),
                           onPressed: () {
                              validation();
                           },
                           child: const Text("Register"),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            const Text("I Have Already An Account!"),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                                 ),
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}