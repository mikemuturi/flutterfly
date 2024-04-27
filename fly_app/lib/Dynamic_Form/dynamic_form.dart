import 'package:flutter/material.dart';


class DynamicForm extends StatefulWidget {
  const DynamicForm({super.key});

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  int teamCount = 0;

  List<Map<String, dynamic>> teamMemberData=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child:   SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("Create team", style:  TextStyle(color: Colors.black, fontSize: 22),),
              const SizedBox(height: 10,),
              const Divider(thickness: 1.2, color: Colors.teal,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text("No of Team Members", style: TextStyle(color: Colors.black, fontSize: 18,),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        teamCount++;
                        teamMemberData.add({
                          'name' : '',
                          'designation' : '',
                          'domain' : '',
          
                        });
                      });
                    },
                    icon: const Icon(Icons.add, size: 34,)),
                     SizedBox(
                      width: 50,
                      child: Text("$teamCount", style: const TextStyle(color: Colors.black, fontSize: 35),),
                    )
                  ],
                )
              ],),
              if(teamCount > 0)
              for(int i = 0; i<teamCount; i++)
               Card(
                color: const Color(0Xff262626),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                       Text("Team Member ${i + 1} ", style: const TextStyle(color: Colors.white, fontSize: 18),),
                      IconButton(onPressed: (){
                        setState(() {
                          teamMemberData.remove(i);
                          teamCount--;
                        });
                        print(teamMemberData);
                      },
                       icon: const Icon(Icons.remove, size: 34,color: Colors.white,)),

                          ],
                        ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Name",
                        ),
                        onChanged: (value) {
                          teamMemberData[i]['name']=value??'';
                        },
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Designation",
                        ),
                        onChanged: (value) {  
                          teamMemberData[i]['Designation']=value??'';
                        },
                      ),
                        TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Domain",
                        ),
                        onChanged: (value) {
                          teamMemberData[i]['Domain']=value??'';
                         },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              teamCount>=1? Center(
                child: ElevatedButton(onPressed: (){
                  print(teamMemberData);
                }
                ,
                child: const Text("Save")),
              ):const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}