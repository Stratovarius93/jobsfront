import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/sliverPersistenceTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intl/intl.dart';

class WorkerPage1 extends StatefulWidget {
  @override
  _WorkerPage1State createState() => _WorkerPage1State();
}

class _WorkerPage1State extends State<WorkerPage1> {
  String _date = '';
  TextEditingController _inputFieldDateController = TextEditingController();
  TextEditingController _inputFieldDateController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorPrimaryButton,
        onPressed: () {
          Navigator.pushNamed(context, 'workerPage2');
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                        'https://album.mediaset.es/eimg/10000/2021/01/14/clipping_VNB9Tj_e4de.jpg?w=480'),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GenericLoginCategoryText(
                        title: 'Fecha de inicio',
                      ),
                    ),
                    GenericMainInput(
                      controller: _inputFieldDateController,
                      suffixIcon: Icon(Ionicons.calendar_sharp),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context, _inputFieldDateController);
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GenericLoginCategoryText(
                        title: 'Fecha de fin (opcional)',
                      ),
                    ),
                    GenericMainInput(
                      controller: _inputFieldDateController2,
                      suffixIcon: Icon(Ionicons.calendar_sharp),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context, _inputFieldDateController2);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));
    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _date = DateFormat('yyyy/MM/dd').format(picked);
        controller.text = _date;
      });
    }
  }
}
