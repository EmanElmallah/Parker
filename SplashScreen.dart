import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test11/Authentication/AuthPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}): super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterDuration();
    super.initState();
  }
  void navigateAfterDuration(){
    Future.delayed( const Duration(seconds: 4), (){
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (BuildContext context) => const AuthenticationPage()));

    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children:  <Widget>[
               const Img('assets/images/parkerAVP.jpg',shape: BoxShape.circle,
                height: 300,
                width: 300,
                margin: EdgeInsets.all(10),),
                Text(
                'Automated Valet Parking service',
                style: GoogleFonts.lato(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.04,fontWeight: FontWeight.bold,
                ),
                ),
              const Visibility(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                  child: CircularProgressIndicator(color: Colors.indigo,),
                ),
              ),
              ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text('Loading . . .', style: GoogleFonts.lato(color: Colors.indigo, fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.bold,
            ),
            ),
          ),


            ],



          ),
        ),
        )
    );

  }
}
/*

              ),



const[Text('hel',
             style:TextStyle(color:Color(0xff101467) ,
                 fontSize: 40),
               )

            ],




Text(
                'Loading...',
                style: GoogleFonts.lato(color: Colors.indigo, fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.bold,
                ),
              ),


Padding(
                padding: EdgeInsets.only(bottom: 200, ),
                child:  CircularProgressIndicator(
                  color: Colors.indigo,
                ),
              ),


             */