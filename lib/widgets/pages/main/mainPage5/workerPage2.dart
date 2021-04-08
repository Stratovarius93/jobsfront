import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/mainInputDropdown.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

List<String> _list = [
  'Categoria 1',
  'Categoria 2',
  'Categoria 3',
  'Categoria 4'
];
String _dropdownValue = _list[0];

class WorkerPage2 extends StatefulWidget {
  @override
  _WorkerPage2State createState() => _WorkerPage2State();
}

class _WorkerPage2State extends State<WorkerPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorPrimaryButton,
          onPressed: () {
            Navigator.pushNamed(context, 'workerPage3');
          },
          child: Icon(Ionicons.arrow_forward_outline),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GenericLoginTitle(title: 'Contratar'),
                      SizedBox(
                        height: 16,
                      ),
                      Image.network(
                          'https://album.mediaset.es/eimg/10000/2021/01/14/clipping_VNB9Tj_e4de.jpg?w=480'),
                      SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Categoria',
                        ),
                      ),
                      GenericMainInputDropdown(
                        items: _list,
                        dropdownValue: _dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            _dropdownValue = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Lugar',
                        ),
                      ),
                      GenericMainInput(
                        textInputType: TextInputType.streetAddress,
                        suffixIcon: Icon(Ionicons.location_sharp),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Descripcion',
                        ),
                      ),
                      GenericMainInput(
                        suffixIcon: Icon(Icons.edit),
                        maxLines: 3,
                        minLines: 1,
                        scrollPhysics: BouncingScrollPhysics(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BackArrow(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ]));
  }
}
