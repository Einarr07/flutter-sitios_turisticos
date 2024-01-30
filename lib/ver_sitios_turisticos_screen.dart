import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'sitio_turistico.dart';

class VerSitiosTuristicosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Sitios Turísticos'),
      ),
      body: _buildSitiosTuristicosList(),
    );
  }

  Widget _buildSitiosTuristicosList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('sitios_turisticos').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
          return const Center(
            child: Text('No hay datos disponibles'),
          );
        }

        var sitios = snapshot.data?.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return SitioTuristico(
            nombre: data['nombre'] ?? '',
            descripcion: data['descripcion'] ?? '',
            imagenUrl: data['imagenUrl'] ?? '',
          );
        }).toList();

        return ListView.builder(
          itemCount: sitios?.length ?? 0,
          itemBuilder: (context, index) {
            var sitio = sitios?[index];
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    sitio?.nombre ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Image.network(sitio?.imagenUrl ?? '', width: double.infinity),
                  SizedBox(height: 8),
                  Text(
                    sitio?.descripcion ?? '',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
