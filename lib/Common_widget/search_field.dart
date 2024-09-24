import 'package:bachelar_hostel/Common_widget/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
   SearchField({super.key,
    required this.onChanged});
  final void Function(String) onChanged;
var value=-1;
  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide:  const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:CupertinoColors.systemGrey3),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide:  const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
        labelText: "Search Hostel",
        suffixIcon: InkWell(
            onTap: (){
              Get.defaultDialog(
                  title: "Filter",
                  titleStyle: const TextStyle(
                      color:Colors.red, fontWeight: FontWeight.bold),
                  content: Column(
                    children: [
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.black))),
                          value: value,
                          items: const [
                            DropdownMenuItem(
                              value: -1,
                              child: Text("Room "),
                            ),
                            DropdownMenuItem(
                                value: 0,
                                child: Text("Single")),
                            DropdownMenuItem(
                                value: 1,
                                child: Text("Double")),
                            DropdownMenuItem(
                                value: 2,
                                child: Text("Multi"))
                          ],
                          onChanged: (v) {}),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.black))),
                          value: value,
                          items: const [
                            DropdownMenuItem(
                              value: -1,
                              child: Text("Range"),
                            ),
                            DropdownMenuItem(
                                value: 0,
                                child: Text("2000-4000 TK")),
                            DropdownMenuItem(
                                value: 1,
                                child: Text("4000-6000 Tk")),
                            DropdownMenuItem(
                                value: 2,
                                child: Text("6000-8000 Tk"))
                          ],
                          onChanged: (v) {}),
                      const SizedBox(height: 10),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Colors.black))),
                          value: value,
                          items: const [
                            DropdownMenuItem(
                              value: -1,
                              child: Text("Environment"),
                            ),
                            DropdownMenuItem(
                                value: 0,
                                child: Text("AC")),
                            DropdownMenuItem(
                                value: 1,
                                child: Text("Non-AC")),
                          ],
                          onChanged: (v) {}),
                      const SizedBox(height: 10),
                      CommonButton(
                          buttonName: "Search", onTap: () => Get.back())
                    ],
                  ));
            },
            child: const Card(color:Colors.red,child: Icon(Icons.search,color: Colors.white,)))
      ),
    );
  }
}
