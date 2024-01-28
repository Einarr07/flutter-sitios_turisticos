import 'package:flutter/material.dart';
import 'registro_sitio_turistico_screen.dart'; // Asegúrate de ajustar la ruta según la ubicación de tu pantalla de registro

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
              child: const Text('Registra un sitio turístico'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para ver sitios turísticos
                // Puedes navegar a la pantalla de visualización de sitios turísticos o realizar otras acciones.
              },
              child: const Text('Ver sitios turísticos'),
            ),
          ],
        ),
      ),
    );
  }
}
