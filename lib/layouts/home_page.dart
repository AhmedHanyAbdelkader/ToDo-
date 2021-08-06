import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/modules/add_page.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/modules/complete_body.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/modules/incomplete_body.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/modules/to_do_body.dart';
import 'package:to_do_app/shared/styles/styles.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:  Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.add,size: 30,color: Colors.orangeAccent,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTask()));
                  })
            ],
            title: Text('ToDo',style: appBarTextStyle,
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Tasks',style: tabbarTextStyle,),),
                Tab(child:Text('InComp',style: tabbarTextStyle,),),
                Tab(child:Text('Comp',style: tabbarTextStyle,),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              All(),
              InComplete(),
              Complete(),
            ],
          ),
      ),
    );
  }
}
