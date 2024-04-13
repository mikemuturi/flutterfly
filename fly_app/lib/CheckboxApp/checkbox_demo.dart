import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {

  List<String>locations=[
    "Nairobi", "Kisumu", "Mombasa", "Nakuru"
  ];
  List<bool> selectedItemsIndex = [];
  int ?len;

  generateList(){
    len = locations.length;
    selectedItemsIndex = List.generate(len!, (index) => false);
    print(selectedItemsIndex);
  }

  showSelectedItems(){
    List selectedLocations = [];
    
    for(int i=0; i<locations.length; i++){
      if(selectedItemsIndex[i]){
        selectedLocations.add(locations[i]);
      }
    }
    print(selectedLocations);
  }

  @override
  void initState() {
    generateList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:  Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Select City"),
              const Text("Select Preference"),
          
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: locations.length,
                  itemBuilder: (_, index){
                    return Row(
                      children: [
                        Checkbox(
                          value: selectedItemsIndex[index],
                        onChanged: (value){
                      setState(() {
                        selectedItemsIndex[index] = !selectedItemsIndex[index];
                      });
                        }
                        ),
                        Text(locations[index]),
                      ],
                    );
                    
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}