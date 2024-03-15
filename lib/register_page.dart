import 'package:aqualytic/components/my_button.dart';
import 'package:aqualytic/components/my_textfield.dart';
import 'package:aqualytic/components/square_title.dart';
import 'package:aqualytic/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()?onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controollers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  //sign user up
  void signUserUp()async{

  //show loading circle
  showDialog(context:context, builder: (context){
    return const Center(
      child: CircularProgressIndicator(),
    );
  },
);
  

  //try creating the user
    try {
      // check if password is confirmed
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
      );
      }else{
        //show error message, pass doesnt match
        showErrorMessage("Password don't match!");
      }
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
                height: 130,
                ),
                const Text(
                  'AQUAlytic',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  ),
                  
                const SizedBox(height: 10,),
          
              //lets create an account
              const Text(
                'Let\'s create an account for you!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
          
              const SizedBox(height: 25,),
          
                
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

              //pASSword confirm
               MyTextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
               ),
          
          
              
              SizedBox(height: 25,),
                
              //sign buttton
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
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
                    onTap: () {
                      
                    },
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
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey[700]
                    ),
                    ),
                  const SizedBox(width: 8,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                      ),

                  ),
              

                ],
                
              ),
              SizedBox(height: 25,)

              
            ],),
            
          ),
        ),
      ),
    );
  }
}