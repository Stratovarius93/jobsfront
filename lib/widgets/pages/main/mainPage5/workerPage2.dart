import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/mainInputDropdown.dart';
import 'package:AppWork/widgets/generics/sliverPersistenceTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Theme.of(context).brightness,
            statusBarIconBrightness: Theme.of(context).brightness),
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            floatingActionButton: FloatingActionButton(
              backgroundColor:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              onPressed: () {
                Navigator.pushNamed(context, 'workerPage3');
              },
              child: Icon(
                Ionicons.arrow_forward_outline,
                color: Colors.white,
              ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                            suffixIcon: Icon(Ionicons.location_sharp,
                                color: Theme.of(context)
                                    .inputDecorationTheme
                                    .suffixStyle
                                    .color),
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
                            suffixIcon: Icon(
                              Icons.edit,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .suffixStyle
                                  .color,
                            ),
                            maxLines: 3,
                            minLines: 1,
                            scrollPhysics: BouncingScrollPhysics(),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
