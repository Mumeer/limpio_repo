import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:limpio/providers/user_provider.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/utils/text_fields.dart';
import 'package:provider/provider.dart';

class SelectName extends StatefulWidget {
  const SelectName({Key? key}) : super(key: key);

  @override
  State<SelectName> createState() => _SelectNameState();
}

class _SelectNameState extends State<SelectName> {
  List<String> namesOfRoom = [
    "new room",
    "class room",
    "text room",
    "persistent room",
    "ajeb room",
    "tera room"
        "mera room"
        "hamara room"
  ];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.secondary,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Home"),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                context.read<UserProvider>().logout(context);
              },
              child: Wrap(
                children: [
                  Text("Add"),
                  Icon(Icons.add),
                ],
              ))
        ],
      ),
      backgroundColor: AppColors.hint,
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: namesOfRoom.length,
                  itemBuilder: (context, index) {
                    String name = namesOfRoom[index];
                    return ListTile(
                      onTap: (){

                      },
                      title: Text(name),
                    );
                  }),
            ),
            Row(children: [
              Expanded(child: SearchTextField(
                cont: searchController,
                hint: "Search Name",
              ))
            ],)
          ],
        ),
      ),

    );
  }
}
