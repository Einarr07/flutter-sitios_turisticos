import 'package:flutter/material.dart';
import 'registro_sitio_turistico_screen.dart';

class OpcionesScreen extends StatelessWidget {
  const OpcionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de registro de sitio turístico
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistroSitioTuristicoScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Reemplaza primary por backgroundColor
              ),
              child: const Text(
                'Registra un sitio turístico',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para ver sitios turísticos
                // Puedes navegar a la pantalla de visualización de sitios turísticos o realizar otras acciones.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Reemplaza primary por backgroundColor
              ),
              child: const Text(
                'Ver sitios turísticos',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
