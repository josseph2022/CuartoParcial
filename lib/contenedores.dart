import 'package:firebase_flutter/Reservas.dart';
import 'package:firebase_flutter/Usuarios.dart';
import 'package:firebase_flutter/vuelos.dart';
import 'package:flutter/material.dart';

class Contenedores extends StatefulWidget {
  Contenedores({Key? key}) : super(key: key);

  @override
  State<Contenedores> createState() => _ContenedoresState();
}

class _ContenedoresState extends State<Contenedores> {
  int menu_activo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      bottomNavigationBar: spotFooter(),
      body: spotBody(),
    );
  }

  Widget spotBody() {
    return IndexedStack(
        index: menu_activo, children: [usuarios(), reservas(), vuelos()]);
  }

  Widget spotFooter() {
    List items = [
      "Usuarios",
      "Reservas",
      "Vuelos",
    ];

    return Container(
      height: 60,
      decoration: BoxDecoration(color: Color.fromARGB(255, 194, 15, 15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(3, (index) {
            return FloatingActionButton(
                onPressed: () {
                  setState(() {
                    menu_activo = index;
                  });
                },
                child: Text(items[index],
                    style: TextStyle(
                        color: menu_activo == index
                            ? Color.fromARGB(255, 63, 171, 9)
                            : Color.fromARGB(255, 31, 27, 27))));
          }),
        ),
      ),
    );
  }
}
