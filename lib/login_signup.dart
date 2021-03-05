
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'otp_verification.dart';
class LoginSignup extends StatefulWidget{
  _LoginSignup createState() => _LoginSignup();
}

class _LoginSignup extends State<LoginSignup>
{


  TextEditingController _editingController;
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

            ),
            child: Stack(
             children: [
               Container(
                 padding: EdgeInsets.all(10),
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                 child: Form(
                   key: _formKey,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       getLogo(),
                       SizedBox(height: 50,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             child: DropdownButtonHideUnderline(
                               child: DropdownButton(
                                 value: _selectedCompany,
                                 items: _dropdownMenuItems,
                                 onChanged: onChangeDropdownItem,
                               ),
                             ),
                             decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.fromLTRB(10,2, 10, 2),
                           ),

                           SizedBox(width: 5,),

                           Expanded(
                             child: TextFormField(
                               controller: _editingController,
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter some text';
                                 }
                                 else if(value.length < 10)
                                 {
                                   return 'please enter 10 digit number';
                                 }
                                 return null;
                               },

                               keyboardType: TextInputType.number,
                               maxLength: 10,
                               decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                   borderSide: BorderSide(width: 1)
                                 ),
                                 hintText: "enter mobile no.",
                                 focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(width: 1,color: Color.fromRGBO(52, 73, 94, 1))
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),

                       MaterialButton(onPressed: (){
                         if(_formKey.currentState.validate())
                         {
                          // print(_editingController.text);

                           //pushData();
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => OTPVerification()),
                           );
                         }
                       },
                           padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                         child: Container(
                           height: 50,
                           width: MediaQuery.of(context).size.width,
                           child: Text("SUBMIT",  style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 0.6,color: Colors.white),),
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             color: Color.fromRGBO(0,0,102,1),
                             borderRadius: BorderRadius.circular(5)
                           ),
                         )
                       )
                     ],
                   ),
                 ),
               ),
             ],
            ),
          ),
        ),
      )
    );
  }

  List<Country> _companies = Country.getCompanies();
  List<DropdownMenuItem<Country>> _dropdownMenuItems;
  Country _selectedCompany;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {

    _scrollController = new ScrollController();
    _editingController = new TextEditingController();
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Country>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country country in companies) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(country.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Country selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  Widget getLogo()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 90,
          width: 220,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

        ),

      ],
    );
  }

  // final firestoreInstance = Firestore.instance;
  //
  // void pushData() {
  //   firestoreInstance.collection("users").add(
  //       {
  //         "name" : "john",
  //         "age" : 50,
  //         "email" : "example@example.com",
  //         "address" : {
  //           "street" : "street 24",
  //           "city" : "new york"
  //         }
  //       }).then((value){
  //     print(value.documentID);
  //   });
  //}

}

class Country {
  int id;
  String name;
  String c_name;

  Country(this.id, this.name,this.c_name);

  static List<Country> getCompanies() {
    return <Country>[
      Country(1, '+1',"USA"),
      Country(91, '+91',"IND"),
    ];
  }

}

