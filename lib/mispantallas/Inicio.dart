import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  final String base = "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/main/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F5),
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.black),
        // CORRECCIÓN: URL de imagen limpia
        title: Image.network(
          "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/ajolotelogo.png", 
          height: 45
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFB6C1),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart_outlined, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text("Kevin Cardiel - Grupo 6I", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink[800])),
            ),
            // Cuadros de categorías superiores (Estilo Wireframe)
            Container(
              height: 80,
              child: GridView.count(
                crossAxisCount: 5,
                children: [
                  _catSquare("${base}girasol.png"),
                  _catSquare("${base}jasmineflower.png"),
                  _catSquare("${base}omaiga.PNG"),
                  _catSquare("${base}no.png"),
                  _catSquare("${base}ajoloteflor.PNG"),
                ],
              ),
            ),
            // Lista de productos principales
            _productItem(context, "Ramo de Girasoles", "Especial Verano", "${base}ramodegirasoles.png"),
            _productItem(context, "Ramo Romántico", "Detalle Ajolote", "${base}ramo.png"), // Corregido ram.png a ramo.png
            _productItem(context, "Captura Especial", "Venta del día", "${base}Captura.PNG"),
            _productItem(context, "Jazmín Premium", "Aroma Natural", "${base}jasmineflower.png"),
          ],
        ),
      ),
    );
  }

  Widget _catSquare(String url) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink[100]!), 
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }

  Widget _productItem(BuildContext context, String t, String s, String img) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/pantalla2'),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12), 
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)]
        ),
        child: Row(
          children: [
            Container(
              width: 100, 
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                child: Image.network(img, fit: BoxFit.cover)
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(s, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  Row(children: [Icon(Icons.star, size: 14, color: Colors.amber), Text(" Florería Ajolote", style: TextStyle(fontSize: 12))]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}