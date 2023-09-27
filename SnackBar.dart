import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



showInSnackBar(String value, Color backgroundColor, Color textColor, int duration,BuildContext context, GlobalKey<ScaffoldState>_scaffoldKey ){

  FocusScope.of(context).requestFocus(FocusNode());
  ScaffoldMessenger.of(_scaffoldKey.currentContext).removeCurrentSnackBar();
  //_scaffoldKey.currentState?.removeCurrentSnackBar();
  ScaffoldMessenger.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(
    content: Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color:textColor,
                fontSize: 16,

            ),
          ),
        ),
      ),

    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    duration: Duration(seconds: duration),
  )
  );
}
/*
* (SnackBar(

  content: Container(
    height: 50,
    width: double.maxFinite,
    decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          value,
        textAlign: TextAlign.center,
          style: TextStyle(
            color:textColor,
            fontSize: 18,
            fontFamily: "WorkSansSemiBold"),
          ),
      ),
      ),

    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    duration: Duration(seconds: duration),
  ));
* */
//child: Text('Don\'t Have an Account ?',
//               style: GoogleFonts.lato(color: Colors.white.withOpacity(0.5),
//                 fontSize: 13,
//               ),),

showInWaitingSnackBar(String value, Color backgroundColor, Color textColor,BuildContext context, GlobalKey<ScaffoldState>_scaffoldKey ){
  FocusScope.of(context).requestFocus(FocusNode());
  ScaffoldMessenger.of(_scaffoldKey.currentContext).removeCurrentSnackBar();
  //_scaffoldKey.currentState?.removeCurrentSnackBar();
  ScaffoldMessenger.of(_scaffoldKey.currentContext).showSnackBar(SnackBar(
    content: Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color:textColor,
              fontSize: 16,

            ),
          ),
        ),
      ),

    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    duration: Duration(seconds: 1000),
  )
  );
}
