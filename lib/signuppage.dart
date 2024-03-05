import 'package:aqualytic/components/my_textfield.dart';
import 'package:aqualytic/components/signupbutton.dart';
import 'package:aqualytic/loginpage.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});


   //text editing controollers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonenocontroller = TextEditingController();
  final confirmpasswordController = TextEditingController();


  //signup user in
  void signUserUp(){

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
                  
                SizedBox(height: 10,),
          
              //welome back
              const Text(
                'Register Your Account!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
          
              SizedBox(height: 20,),
          
                
              //username
              MyTextfield(
                controller: usernameController,
                hintText: 'UserName',
                obsecureText: false,
              ),
             const SizedBox(height: 20,),


              //email
              MyTextfield(
                controller: emailcontroller,
                hintText: 'Email',
                obsecureText: false,
              ),
          
          
              const SizedBox(height: 20,),

              //phone
              MyTextfield(
                controller: phonenocontroller,
                hintText: 'Phone Number',
                obsecureText: false,
              ),
              const SizedBox(height: 20,),
          
              //pASSword
               MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
               ),
          
              const SizedBox(height: 20,),
          
              //confirm pass
               MyTextfield(
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
               ), 
                             const SizedBox(height: 20,),

                
              //sign buttton
              MysignupButton(
                onTap: signUserUp,
              ),

              const SizedBox(height: 25,),
          
             
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
                  const SizedBox(width: 7,),
                  TextButton(
                    style: TextButton.styleFrom(
                  
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: const Text('Login now'),
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