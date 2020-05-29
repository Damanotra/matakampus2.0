import 'package:flutter/material.dart';

class CellItemLong extends StatelessWidget {
  final String name;
  final String location;
  final String date;
  final Function onClick;

  CellItemLong({this.name, this.location, this.date, this.onClick});

  


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left:20, right:20),
      height: 75,
      child:Card(
        //shape: Border(right: BorderSide(color: Colors.red, width: 5)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 1.5,
        child: Row(children: <Widget>[
          Container(height: 75,width: 75, decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: const Radius.circular(8.0), bottomLeft: const Radius.circular(8.0)), image: DecorationImage(alignment: Alignment.topCenter,fit: BoxFit.fill,image: AssetImage('assets/image/botol.png')))),
          Expanded(child: Container(
            margin: EdgeInsets.all(8),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
              
              Row(children: <Widget>[
                Expanded(child: Text(name,style: TextStyle(fontSize: 18))),
                Text(date,style: TextStyle(fontSize: 10))
              ]),

              SizedBox(height: 7),
              Row(children: <Widget>[
                Icon(Icons.location_on,size: 10),
                SizedBox(width: 4),
                Text(location,style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
              ]),
            ],),
          ))
        ],),
    ),);
  }
}
