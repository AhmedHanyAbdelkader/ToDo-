import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/models/data_model.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/modules/to_do_body.dart';
import 'package:to_do_app/shared/styles/styles.dart';


class AddNewTask extends StatefulWidget {

  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool val=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task',style: appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
        //    myTextField(titleController),
            TextFormField(
              controller: titleController,
              onChanged: (val){
                val = titleController.text;
              },
              decoration: InputDecoration(
                labelText: 'TITLE',
                labelStyle: labelStyle,
                hintText: 'title',
                prefixIcon: Icon(Icons.title),
                 border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: descriptionController,
              onChanged: (value){
                value = descriptionController.text ;
              },
              decoration: InputDecoration(
                labelText: 'DESCRIPTION',
                labelStyle: labelStyle,
                hintText: 'description',
                prefixIcon: Icon(Icons.edit),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('IsComplete ?',style: isCompletStyle,
                ),
                Checkbox(
                    value: val,
                    onChanged: (value){
                      setState(() {
                       val =value;
                      });
                    },
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              height: 30, width: double.infinity,
              child: ElevatedButton(
                child: Text('Add',style: addButtonTextStyle,),
                onPressed: (){
                  Provider.of<DataProvider>(context,listen: false).addData('${titleController.text}', '${descriptionController.text}',val);
                  Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>All()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
