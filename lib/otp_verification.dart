import 'package:crash_company_vendor/profile_operation/create_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatefulWidget{
  _OTPVerification createState() => _OTPVerification();
}

class _OTPVerification extends State<OTPVerification>
{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: Color.fromRGBO(0,0,102,1),
        //
        // ),
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0,0,102, 1),
        title: Text("Login/Signup", style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 0.6),),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: 50,),
            Text("Enter verification code ",
              style: TextStyle(
                color: Color.fromRGBO(0,0,102, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15,),
            Text("we have sent you a 4 digit verification code on",
              style: TextStyle(
                  color: Color.fromRGBO(52, 73, 94, 1),
                  fontSize: 15
              ),
            ),

            SizedBox(height: 15,),
            Text("+91 8459888289",
              style: TextStyle(
                  color: Color.fromRGBO(0,0,102, 1),
                  fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),


           SizedBox(height: 15,),

           Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Form(
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  backgroundColor: Colors.transparent,
                    appContext: context, length: 4,
                    pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(5),
                    activeColor: Color.fromRGBO(0,0,102, 1),
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.black,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    ),mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  onCompleted: (value)
                  {
                    print(value);
                  },
                ),
              ),
            )

          ],
        ),



      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //
      //
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => CreateProfile()),
      //     );
      //   },
      // ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0),
        child: SizedBox(
          height: 60,
          child: RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>CreateProfile()),
              );
            },
            color: Color.fromRGBO(0,0,102, 1),
            textColor: Colors.white,
            child: Text('Next',  style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 0.6),),
          ),
        ),
      ),
    );
  }
}