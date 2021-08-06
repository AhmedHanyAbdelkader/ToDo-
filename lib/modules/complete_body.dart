import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/modules/add_page.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/models/data_model.dart';
import 'package:to_do_app/shared/styles/styles.dart';



class Complete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
        builder: (context3 , CP ,child){
          return (CP.getData.length >0)  ? ListView.separated(
            itemBuilder: (context3 , index){
              return CP.getData[index].isComplete==true ?myListTile(CP, index, context) : SizedBox();
            },
            separatorBuilder: (context , index){
              return separator();
            },
            itemCount: CP.getData.length,
          ): indicator(context);
        }
    );
  }



  Widget myListView(CP) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return myListTile(CP, index, context);
      },
      separatorBuilder: (context, index) {
        return separator();
      },
      itemCount: CP.getData.length,
    );
  }

  Widget myListTile(CP, index, context) {
    return ListTile(
      title: Text('${CP.getData[index].title}'),
      subtitle: Text('${CP.getData[index].description}'),
      leading: Checkbox(
        value: CP.getData[index].isComplete,
        onChanged: (value) {
          Provider.of<DataProvider>(context, listen: false).EditCheckBox(index, value);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          Provider.of<DataProvider>(context, listen: false).removeData(index);
        },
      ),
    );
  }

  Widget separator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Colors.blueGrey,
        height: 1,
      ),
    );
  }

  Widget indicator(context){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            TextButton(
              child: Text(
                'Add New Task . . . ',
                style: addNewTaskTextStyle,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewTask()));
              },
            ),
          ],
        ));
  }

}

