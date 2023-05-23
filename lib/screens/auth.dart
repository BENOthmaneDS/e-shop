// This is a module
import 'package:flutter/material.dart';
import 'home.dart';
class Authentication extends StatefulWidget {
  const  Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _emailController=TextEditingController();

  final _pwdController=TextEditingController();

  var isValid=false;
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Authentication')
      ),  //Named parameter
      body: Column(
        children:  [
          SizedBox(
            height: MediaQuery.of(context).size.height/6,
          ),
          const Icon(Icons.login,size: 50,),
          const Padding(padding: EdgeInsets.all(10)),
          Center(
            child: SizedBox(
            width: MediaQuery.of(context).size.width/1.2,
            child: Column(
              children:  [
                 TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: 'email',
                    label: Text('email')
                  ),
                ),
              const Padding(padding: EdgeInsets.all(10)),
               TextField(
                controller: _pwdController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                hintText: 'password',
                label: Text('password')
              ),
            ),
              ],
            ),
          ),
          ),
          
       const Padding(padding: EdgeInsets.all(10)),
       ElevatedButton(onPressed: (){
        if(_emailController.text.isEmpty || _pwdController.text.isEmpty) {
            setState(() {
              isValid = true;
            });
        } else {
          setState(() {
            //isValid = false;
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Home()));
          });
        }
        /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_emailController.text)));*/
       }, child: const Text('Login')),
         const Padding(padding: EdgeInsets.all(10)),
         Text(isValid==false?'':'email or password is empty', style: const TextStyle(color:Colors.red,))
          ]),
    );  
  }
}