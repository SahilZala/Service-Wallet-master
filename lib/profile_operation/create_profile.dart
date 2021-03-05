import 'package:crash_company_vendor/home/home_dashbord.dart';
import 'package:crash_company_vendor/profile_operation/profession.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget
{
  _CreateProfile createState () => _CreateProfile();
}
class _CreateProfile extends State<CreateProfile>
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Color.fromRGBO(0,0,102, 1),
       elevation: 0,
       // iconTheme: IconThemeData(color: Color.fromRGBO(0,0,102, 1)),
     ),

     body: Stack(
       children: [
         Container(
           padding: EdgeInsets.all(20),
           child: SingleChildScrollView(
             child: Column(children: [

               Container(
                 width: MediaQuery.of(context).size.width,
                 child: Text("Almost done!",
                   style:TextStyle(fontFamily: 'RobotoSlab', color: Color.fromRGBO(0,0,102, 1), fontWeight: FontWeight.bold, fontSize: 43,),
                   textAlign: TextAlign.start,
                 ),
               ),

               SizedBox(height: 10,),

               Container(
                 width: MediaQuery.of(context).size.width,
                 child: Text("Tell us few things about you",
                   style:TextStyle( color: Color.fromRGBO(0,0,102, 1), fontWeight: FontWeight.bold, fontSize: 15,),

                   textAlign: TextAlign.start,
                 ),
               ),


               SizedBox(height: 50,),
               Form(
                 key: _formKey,
                 child: Column(
                   children: [
                     Container(
                       child: Column(children: [
                         Container(
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                           child: Text("NAME",
                             style: TextStyle(
                               fontFamily: 'RobotoSlab',
                               color: Color.fromRGBO(101, 101, 101, 1),
                               fontSize: 20,
                             ),

                             textAlign: TextAlign.start,
                           ),
                         ),



                         Container(
                           width: MediaQuery.of(context).size.width,
                           padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                           child: TextFormField(
                             controller: _nameEditingController,
                             validator: (value) {
                               if (value.isEmpty) {
                                 return 'Please enter some text';
                               }
                               return null;
                             },

                             decoration: InputDecoration(
                               border: OutlineInputBorder(
                                   borderSide: BorderSide(width: 1)
                               ),
                               hintText: "name",
                               focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(width: 1,color: Color.fromRGBO(52, 73, 94, 1))
                               ),
                             ),
                           ),
                         ),


                       ],),
                     ),




                     Container(
                       child: Column(children: [
                         Container(
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                           child: Text("EMAIL",
                             style: TextStyle(
                               fontFamily: 'RobotoSlab',
                               color: Color.fromRGBO(101, 101, 101, 1),
                               fontSize: 20,
                             ),

                             textAlign: TextAlign.start,
                           ),
                         ),



                         Container(
                           width: MediaQuery.of(context).size.width,
                           padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                           child: TextFormField(
                             controller: _emailEditingController,
                             validator: (value) {
                               if (value.isEmpty) {
                                 return 'Please enter your email';
                               }
                               return null;
                             },

                             decoration: InputDecoration(
                               border: OutlineInputBorder(
                                   borderSide: BorderSide(width: 1)
                               ),
                               hintText: "email",
                               focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(width: 1,color: Color.fromRGBO(52, 73, 94, 1))
                               ),
                             ),
                           ),
                         ),


                       ],),
                     ),





                     Container(
                       child: Column(children: [
                         Container(
                           padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                           child: Text("CITY",
                             style: TextStyle(
                               fontFamily: 'RobotoSlab',
                               color: Color.fromRGBO(101, 101, 101, 1),
                               fontSize: 20,
                             ),

                             textAlign: TextAlign.start,
                           ),
                         ),


                         Container(
                           width: MediaQuery.of(context).size.width,
                           child: DropdownButtonHideUnderline(
                             child: DropdownButton(
                               value: _selectedCompany,
                               items: _dropdownMenuItems,
                               onChanged: onChangeDropdownItem,
                             ),
                           ),
                           decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey),borderRadius: BorderRadius.circular(5)),
                           padding: EdgeInsets.fromLTRB(10,0, 10, 2),
                         ),
                       ],),
                     ),
                   ],
                 ),
               )

             ],)
           ),
         ),


         getContainerForPrice(),
       ],
     )
   );
  }

  TextEditingController _nameEditingController;
  TextEditingController _emailEditingController;
  final _formKey = GlobalKey<FormState>();

  List<City> _companies = City.getCompanies();
  List<DropdownMenuItem<City>> _dropdownMenuItems;
  City _selectedCompany;


  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();

    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;




  }


  List<DropdownMenuItem<City>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<City>> items = List();
    for (City country in companies) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(country.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(City selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  Widget getContainerForPrice()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0,0,102, 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                  child: Container(
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profession()),
                          );
                        },
                        child: Text("SUBMIT", style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 0.6, color: Colors.white), ),
                        color: Color.fromRGBO(0,0,102, 1),

                      )
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class City {
  int id;
  String name;
  City(this.id, this.name);

  static List<City> getCompanies() {
    return <City>[
      City(1, 'PUNE'),
      City(2, 'DELHI'),
    ];
  }

}

