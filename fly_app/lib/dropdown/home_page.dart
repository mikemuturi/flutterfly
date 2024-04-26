import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  Color backColor = Colors.white;
  String ? _country;
  List<String> countries =[
    "Kenya",
     "Uganda",
      "Tanzania",
      "Egypt", 
      "Somali"].toSet().toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: backColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Change background Color"),
            DropdownMenu(
              controller: colorController,
              requestFocusOnTap: true,
              width: 200,
              leadingIcon: const Icon(Icons.color_lens),
              trailingIcon: const Icon(Icons.arrow_back_ios),
              onSelected: (color){
                if(color != null){

                  setState(() {
                    backColor = color;
                  });
                }

              },

              dropdownMenuEntries: const[
                DropdownMenuEntry(value: Colors.red, label: "Red"),
                DropdownMenuEntry(value: Colors.teal, label: "Teal"),
                DropdownMenuEntry(value: Colors.orange, label: "Orange"),
                DropdownMenuEntry(value: Colors.blue, label: "Blue"),
                DropdownMenuEntry(value: Colors.purple, label: "Purple"),


              ]),
              const Text("Select Country"),
              DropdownMenu(
                controller: countryController,
                requestFocusOnTap: true,
                enableSearch: true,
                onSelected: (country){
                  if(country!=null){
                    setState(() {
                      _country = country;
                    });
                  }
                },
                dropdownMenuEntries: countries.map((country) =>
                DropdownMenuEntry(value: country, label: country)) .toList() ),
          ] ),
      ),
    );
  }
}