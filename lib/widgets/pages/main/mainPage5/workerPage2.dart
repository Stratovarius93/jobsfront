import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/mainInputDropdown.dart';
import 'package:AppWork/widgets/generics/sliverPersistenceTitle.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: backgroundColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorPrimaryButton,
            onPressed: () {
              Navigator.pushNamed(context, 'workerPage3');
            },
            child: Icon(Ionicons.arrow_forward_outline),
          ),
          body: SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverPersistenceTitle(
                      title: 'Contratar',
                      enableBackArrow: true,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
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
                )
              ],
            ),
          )),
    );
  }
}
