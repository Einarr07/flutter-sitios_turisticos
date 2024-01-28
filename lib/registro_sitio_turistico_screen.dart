import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ver_sitios_turisticos_screen.dart';

import 'sitio_turistico.dart'; 

class RegistroSitioTuristicoScreen extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _imagenUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Sitio Turístico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre del sitio'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _imagenUrlController,
              decoration: const InputDecoration(labelText: 'URL de la imagen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Enviar información a Firebase
                final nuevoSitio = SitioTuristico(
                  nombre: _nombreController.text,
                  descripcion: _descripcionController.text,
                  imagenUrl: _imagenUrlController.text,
                );

                // Agregar la lógica para enviar la información a Firebase (Firestore)
                FirebaseFirestore.instance.collection('sitios_turisticos').add({
                  'nombre': nuevoSitio.nombre,
                  'descripcion': nuevoSitio.descripcion,
                  'imagenUrl': nuevoSitio.imagenUrl,
                });

                // Puedes mostrar un mensaje de éxito o realizar otras acciones después de enviar la información.
                Navigator.pop(context); // Vuelve a la pantalla de opciones
              },
              child: const Text('Registrar Sitio Turístico'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de "Ver Sitios Turísticos"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerSitiosTuristicosScreen()),
                );
              },
              child: const Text('Ver Sitios Turísticos'),
            ),
          ],
        ),
      ),
    );
  }
}
