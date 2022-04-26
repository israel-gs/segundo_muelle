import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:segundo_muelle/app/ui/home/pages/plate_selection_page.dart';

class TableSelectionPage extends StatefulWidget {
  const TableSelectionPage({Key? key}) : super(key: key);

  @override
  _TableSelectionPageState createState() => _TableSelectionPageState();
}

class _TableSelectionPageState extends State<TableSelectionPage> {
  var tables = [
    [1, 2],
    [3, 4],
    [5, 6],
    [7, 8],
    [9, 10]
  ];

  _buildTableItem(String name) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Get.to(PlateSelectionPage());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  children: [
                    SvgPicture.asset('lib/app/assets/table_icon.svg'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(name)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontFamily: 'Poppins', fontSize: 20),
      toolbarTextStyle: const TextStyle(
        color: Colors.black,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.menu),
        )
      ],
      title: Row(
        children: const [
          Text('Hola '),
          Text(
            'Israel',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFEDF0F4),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selecciona una mesa'),
                    const SizedBox(
                      height: 20,
                    ),
                    ...tables
                        .map((e) => Row(
                              children: [
                                _buildTableItem('Mesa ${e[0]}'),
                                const SizedBox(
                                  width: 20,
                                ),
                                _buildTableItem('Mesa ${e[1]}'),
                              ],
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
