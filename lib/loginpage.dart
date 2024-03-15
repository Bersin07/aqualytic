import 'package:aqualytic/components/my_button.dart';
import 'package:aqualytic/components/my_textfield.dart';
import 'package:aqualytic/components/square_title.dart';
import 'package:aqualytic/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()?onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controollers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in
  void signUserIn()async{
    


  //show loading circle
  showDialog(context:context, builder: (context){
    return const Center(
      child: CircularProgressIndicator(),
    );
    
  },

  
);
  

  //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
      );
      //pop the loading circle
      Navigator.pop(context);
      
    }on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
      
    }
      
    

    
  }

  //wrong email message popup
  void showErrorMessage(String message){
  showDialog(
    context:context, 
    builder: (context){
      return  AlertDialog(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
            ),
        ),
      );
    },
  );
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body:  SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              //logo
              Image.asset(
                'lib/images/logo.png',
                height: 150,
                ),
                const Text(
                  'AQUAlytic',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                  ),
                  
                const SizedBox(height: 10,),
          
              //welome back
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
          
              SizedBox(height: 25,),
          
                
              //username
              MyTextfield(
                controller: emailController,
                hintText: 'UserName',
                obsecureText: false,
              ),
          
          
              SizedBox(height: 25,),
          
              //pASSword
               MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
               ),
          
              SizedBox(height: 25,),
          
              //forget pass
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 25,),
                
              //sign buttton
              MyButton(
                text: "Sign In",
                onTap: signUserIn,
              ),
              SizedBox(height: 25,),
          
              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                        ),
                    ),
              
                    Expanded(
                      child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 25,),
          
               
              //google signin buton
          
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  //google
                  SquareTitle(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'lib/images/google.png'
                    ),
          
                    SizedBox(width: 25,),
                 
                  //facebook
                  SquareTitle(
                    onTap: () => AuthService1().signInWithFacebook(),
                    imagePath: 'lib/images/facebook.png'
                    ),
          
                ],
              ),
                SizedBox(height: 25,),
          
                
              //new ? register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                    ),
                  const SizedBox(width: 8,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),


                  








                ],
              )
            ],),
          ),
        ),
      ),
    );
  }
}