import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test11/Modules/SnackBar.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}): super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthanticationPageState();
}


class _AuthanticationPageState extends State<AuthenticationPage> {
  GlobalKey<ScaffoldState>_scaffoldKey= new GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecurePasswordText = true;
  bool isSLoginActivated= true;
  TextEditingController signUpFirstLastNameController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible:isSLoginActivated ,
          //Login design
          child: loginScreenDesign(context),
          //SignUp design
          replacement: signUpScreenDesign(context),

        )
      ),


    );

  }


  Widget loginScreenDesign(BuildContext context){
    return ListView(
      children: [
        Center(
          child: Img('assets/images/parkerAVP.jpg',shape: BoxShape.circle,
            height: 200,
            width: 200,
            margin: EdgeInsets.all(60),),
        ),
        Center(
          child: Text(
            'Login',
            style: GoogleFonts.lato(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.07,fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration( color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white24,
                      blurRadius: 5.0,
                      offset: Offset(0,3)
                  )]
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,width: 2,
                        ),
                      )
                  ),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Email',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),

                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,width: 3,
                        ),
                      )
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: obsecurePasswordText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: obsecurePasswordText== true? const Icon(Icons.remove_red_eye):const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          if(obsecurePasswordText == true){
                            setState(() {
                              obsecurePasswordText = false;
                            });
                          }else{
                            setState(() {
                              obsecurePasswordText = true;
                            });
                          }
                        },

                      ),

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 80,),
        Center(
          child: InkWell(
            onTap: (){
              print('Login Button Pressed');
              userLogInInputValidation();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(0, 74, 173, 0.5),
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.lato(color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 70,),
        Center(
          child: GestureDetector(
            onTap:(){ print('Forget Pass');
            } ,
            child: Text('Forget Password ? ',
              style: GoogleFonts.lato(color: Colors.white.withOpacity(0.5),
                fontSize: 13,
              ),),
          ),
        ),
        const SizedBox(height: 20,),
        Center(
          child: GestureDetector(
            onTap:(){ setState(() {
              isSLoginActivated = false;
            });
            } ,
            child: Text('Don\'t Have an Account ?',
              style: GoogleFonts.lato(color: Colors.white.withOpacity(0.5),
                fontSize: 13,
              ),),
          ),
        ),





      ],
    );
  }

  Widget signUpScreenDesign(BuildContext context){
    return ListView(
      children: [
        const Center(
          child: Img('assets/images/parkerAVP.jpg',shape: BoxShape.circle,
            height: 200,
            width: 200,
            margin: EdgeInsets.all(60),),
        ),
        Center(
          child: Text(
            'Sign Up',
            style: GoogleFonts.lato(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.07,fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration( color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white24,
                      blurRadius: 5.0,
                      offset: Offset(0,3)
                  )]
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,width: 2,
                        ),
                      )
                  ),
                  child: TextField(
                    controller: signUpFirstLastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First and Last Name',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),

                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,width: 2,
                        ),
                      )
                  ),
                  child: TextField(
                    controller: signUpPhoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),

                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,width: 2,
                        ),
                      )
                  ),
                  child: TextField(
                    controller: signUpEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Email',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),

                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,width: 3,
                        ),
                      )
                  ),
                  child: TextField(
                    controller: signUpPasswordController,
                    obscureText: obsecurePasswordText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: obsecurePasswordText== true? const Icon(Icons.remove_red_eye):const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          if(obsecurePasswordText == true){
                            setState(() {
                              obsecurePasswordText = false;
                            });
                          }else{
                            setState(() {
                              obsecurePasswordText = true;
                            });
                          }
                        },

                      ),

                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
        const SizedBox(height: 60,),
        Center(
          child: InkWell(
            onTap: (){
              print('SignUp Button Pressed');
              userSignUpInputValidation();
            },
            child: Container(
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(0, 74, 173, 0.5),
              ),
              child: Center(
                child: Text(
                  'Create Account',
                  style: GoogleFonts.lato(color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20,),
        Center(
          child: GestureDetector(
            onTap:(){
              setState(() {
                isSLoginActivated = true;
              });
            } ,
            child: Text('Have an Account ?',
              style: GoogleFonts.lato(color: Colors.white.withOpacity(0.5),
                fontSize: 13,
              ),),
          ),
        ),





      ],
    );
  }

  void userLogInInputValidation(){

     if (emailController.text == null || emailController.text.contains('@')== false || emailController.text.contains('.com')== false){
      print('Invalid Email');
      showInSnackBar('Invalid Email', Colors.red,Colors.white ,5, context, _scaffoldKey);
    }else if (passwordController.text==null || passwordController.text.length<8){
      print('Invalid Password');
      showInSnackBar('Password Incorrect', Colors.red,Colors.white ,5, context, _scaffoldKey);
     }else{
      print('Validation Completed');
      showInWaitingSnackBar('Loading, please wait ...', Colors.white, Colors.indigo, context, _scaffoldKey);
      Future.delayed(Duration(seconds: 3),(){
        loginUser();
      });
    }
  }

  void userSignUpInputValidation(){
    if (signUpFirstLastNameController.text== null || signUpFirstLastNameController.text.length<6) {
      print('Invalid First And Last Name');
    } else if(signUpPhoneNumberController.text== null || signUpPhoneNumberController.text.contains('05')== false || signUpPhoneNumberController.text.length<10){
      print('Invalid Phone Number');
    }else if (signUpEmailController.text == null || signUpEmailController.text.contains('@')== false || signUpEmailController.text.contains('.com')== false){
      print('Invalid Email');
    }else if (signUpPasswordController.text==null || signUpPasswordController.text.length<8){
      print('Invalid Password');
    }else{
      print('Validation Completed');
    }
  }



  Future loginUser()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text ,
          password: passwordController.text).then((value){
            if(value.user.uid != null){
              print('UserID'+ value.user.uid);
              ScaffoldMessenger.of(_scaffoldKey.currentContext).hideCurrentSnackBar();

              //_scaffoldKey.currentState.removeCurrentSnackBar();
            }
      });

    }
    on FirebaseAuthException catch(e){
      print(e.message);
    }

  }
}
/*class WaitingSnackBar extends SnackBar {
  WaitingSnackBar()
      : super(
    content: Row(
      children: const [
        CircularProgressIndicator(),
        SizedBox(width: 18),
        Text('Loading, please wait ...',),
      ],
    ),
  );
}
 */
/*
*
*  0x004AAD
*color: Color.fromRGBO(0, 74, 173, 0.5),
*
*
*  height: 50,
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),
                color: Color(0x004AAD),
              ),
              *

*  */