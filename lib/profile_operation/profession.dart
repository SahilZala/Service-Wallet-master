import 'package:crash_company_vendor/home/home_dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profession extends StatefulWidget
{
  _Profession createState() => _Profession();
}

class _Profession extends State<Profession>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0,0,102, 1),
        title: Text("Profession",   style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 0.6),),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
                "What work you do?",
                style:TextStyle(
                  fontFamily: 'RobotoSlab',
                  color: Color.fromRGBO(0,0,102, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
            ),
            Divider(
              height: 27.0,
              color: Colors.white,
            ),

            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  side: BorderSide(color: Colors.grey)
              ),
              onPressed: () => {},
              color: Colors.white,
              padding: EdgeInsets.all(15.0),
              child: Row( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon( Icons.search_rounded,color: Colors.grey),
                  Text("  search electrician, plumbers, etc",style:TextStyle(color: Colors.grey,))
                ],
              ),),
            Divider(
              height: 36.0,
              color: Colors.white,
            ),
            Text(
                "Categories",
                style:TextStyle(fontFamily: 'RobotoSlab', color: Color.fromRGBO(0,0,102, 1), fontWeight: FontWeight.bold, fontSize: 23,)
            ),
            Divider(height:5,color: Colors.white,),
            Column(children: [
              getProfessions(Image(image:AssetImage('assets/plumber.png'),),"Plumber",0),
              Divider(height: 19.0, color: Colors.grey,),
              //
              getProfessions(Image(image:AssetImage('assets/carpenter.png'),),"Carpenter",1),
              Divider(color: Colors.grey,),

              getProfessions(Image(image:AssetImage('assets/car-washing.png'),),"Car Washing",2),
              Divider(height: 19.0, color: Colors.grey,),

              // getProfessions(Image(image:AssetImage('assets/electrician.png'),),"Electrician",3),
              // Divider(  height: 19.0,color: Colors.grey,),
            ],),
          ],),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.0),
        child: SizedBox(
          height: 60,
          child: RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeDashbord()),
              );
            },
            color: Color.fromRGBO(0,0,102, 1),
            textColor: Colors.white,
            child: Text('Next',style: TextStyle(fontFamily: 'RobotoSlab', letterSpacing: 0.6,fontSize: 20),),
          ),
        ),
      ),
    );
  }

  List<bool> isTrue = [true,false,true];
  Widget getProfessions(Image image,String service,int index)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        Text(service, style: TextStyle(color:Colors.grey[600], fontSize: 16.0, letterSpacing:1.0, fontWeight: FontWeight.bold,),),
        Divider(color: Colors.grey,),

        Checkbox(value: isTrue[index], onChanged:(state){
          setState(() {
            if (isTrue[index]){
              isTrue[index] = false;
            }
            else{
              isTrue[index] = true;
            }
          });
        }),
      ],);
  }
}