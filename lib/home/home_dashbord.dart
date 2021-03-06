import 'dart:developer';
import 'dart:io';

import 'package:crash_company_vendor/profile_operation/create_profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';

import '../last_page.dart';

class HomeDashbord extends StatefulWidget
{
  _HomeDashbord createState() => _HomeDashbord();
}

class _HomeDashbord extends State<HomeDashbord>
{
  int _selectedIndex = 1;
  List<Widget> _widgetOptions;

  File _image = null;

  var picker = ImagePicker();
  _imgFromGallery() async{

   try{
     File image = await ImagePicker.pickImage(
         source: ImageSource.gallery, imageQuality: 50
     );
     setState(() {
       _image = image;
     });
   }
   catch(e)
    {
      print(e);
    }
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    _widgetOptions = <Widget>[
      Text('JOBS', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      getHome(),
      getMapScreen()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor:Color.fromRGBO(0,0,102,1),
        elevation:14.0,

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_rounded),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Setting Icon',
            onPressed: ()=>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>Last_Page(),
              ),
            ),
          ), //IconButton
        ], //<Widget>[]

    ),
      bottomNavigationBar:BottomNavigationBar(
        fixedColor: Color.fromRGBO(0,0,102, 1),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          // Respond to item press.
          setState(() => _selectedIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('NEW',style: TextStyle(fontFamily: 'RobotoSlab', color:Colors.grey[600],),),
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            title: Text('DASHBORD', style: TextStyle(fontFamily: 'RobotoSlab', color:Colors.grey[600],),),
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            title: Text( 'KC around you', style: TextStyle(fontFamily: 'RobotoSlab', color:Colors.grey[600],),),
            icon: Icon(Icons.map),
          ),
        ],
      ),


      body: Container(
        margin: new EdgeInsets.all(10),
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,

       child: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               Center(
                 child: _widgetOptions.elementAt(_selectedIndex),
               ),
             ],
           ),
         ),
       ),
     ),

   );
  }

  Widget getHome()
  {
    return Column(
      children: [
        getFirstBanner(),
        getMenuBanners("Training Center","video about how to start with service",(){}),
        getMenuBanners("Onboarding Documents","Pan, Address Proof, Documents for loan",(){}),
        getMenuBanners("About me","Details about me",(){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>CreateProfile()),
          );

        }),
        getMenuBanners("Bank Details","Payout will be deposited in your account",(){}),
        getContainerForPrice()
      ],
    );
  }

  Widget getFirstBanner()
  {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Profile Progress",style: TextStyle(
                fontFamily: 'RobotoSlab',color:Color.fromRGBO(0,0,102,1),fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Complete the below steps to",style: TextStyle(color: Color.fromRGBO(0,0,102,1),fontSize: 15),textAlign: TextAlign.start,),
                SizedBox(height: 5,),
                Text("Become a KC Partner",style: TextStyle(color: Color.fromRGBO(0,0,102,1),fontSize: 15),textAlign: TextAlign.start,)

              ],
            ),
          ),

          GestureDetector(
            onTap: (){_showPicker(context);},
            child: Container(
              alignment: Alignment.centerRight,
              height: 80,
              width: 80,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(52, 73, 94, 1))
              ),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    _image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),
        ],


      ),
    );
  }

  Widget getMenuBanners(String s1,String s2,callFunc)
  {
    return GestureDetector(
      onTap: (){
        callFunc();
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(10),
              child: Container(

                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s1,style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(s2,style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 12),)

                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.navigate_next,size: 30,color: Color.fromRGBO(52, 73, 94, 1),),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget getContainerForPrice()
  {
    return Column(

      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(

          padding: EdgeInsets.all(10),

          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                  child: Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        elevation: 0,
                        onPressed: (){

                        },
                        child: Text(
                          "Submit for Approval",
                          style: TextStyle(
                              fontFamily: 'RobotoSlab',
                              fontSize: 20,
                              color: Color.fromRGBO(0, 0, 102, 1)
                          ),
                        ),
                        // color: Color.fromRGBO(0, 0, 102, 1),
  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0),
        side: BorderSide(color: Color.fromRGBO(0, 0, 102, 1)),
    ),
                      )
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getMapScreen()
  {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),

          child: Text("KC Around You",style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 25,fontWeight: FontWeight.bold),),
        ),


        Container(

          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),

          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New jobs around you",style: TextStyle(color: Colors.grey,fontSize: 20),),

              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.shopping_bag,size: 20,color: Color.fromRGBO(52, 73, 94, 1)),
                  SizedBox(width: 10,),
                  Text("0 jobs",style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 18),),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Icon(Icons.money,size: 20,color: Color.fromRGBO(52, 73, 94, 1)),
                  SizedBox(width: 10,),
                  Text("Worth ???0",style: TextStyle(color: Color.fromRGBO(52, 73, 94, 1),fontSize: 18),),
                ],

              ),

              SizedBox(height: 15),

              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(52, 73, 94, 1),
                height: 1,
              ),

              SizedBox(height: 5),

              Text("Last updated at 4 pm",style: TextStyle(color: Colors.grey,fontSize: 12),),

              SizedBox(height: 5),




            ],
          ),
          

        ),

      ],
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}