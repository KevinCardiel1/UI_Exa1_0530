import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  @override
  _Pantalla3State createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  // 1. Variable de estado para controlar la categoría seleccionada
  String categoriaSeleccionada = "Ajolote";

  // 2. Método para obtener los productos según la categoría
  List<Widget> _obtenerProductos() {
    if (categoriaSeleccionada == "Ajolote") {
      return [
        _buildFlorItem("Promo Ajolote", "10:00AM - 12:00PM", "Kevin", Icons.pets, Colors.pink[100]!),
        _buildFlorItem("Taller Ajolote", "4:00PM - 5:00PM", "Kevin", Icons.brush_sharp, Colors.green[100]!),
      ];
    } else if (categoriaSeleccionada == "Rosas") {
      return [
        _buildFlorItem("Ramo Sabrina", "8:30AM - 9:30AM", "Sabrina", Icons.local_florist, Colors.pink[200]!),
        _buildFlorItem("Diseño Sabrina", "9:30AM - 10:30AM", "Sabrina", Icons.auto_awesome_mosaic, Colors.purple[100]!),
      ];
    } else if (categoriaSeleccionada == "Girasol") {
      return [
        _buildFlorItem("Arreglo Girasol", "1:00PM - 2:00PM", "Tom", Icons.filter_vintage, Colors.orange[100]!),
        _buildFlorItem("Envío Especial", "2:30PM - 3:30PM", "Tom", Icons.delivery_dining, Colors.blue[100]!),
      ];
    } else {
      return [
        Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: Text("Próximamente más arreglos de $categoriaSeleccionada")),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDF5),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Florería Ajolote",
          style: TextStyle(color: Color(0xFFC71585), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFE0F2F1),
        elevation: 2,
        actions: [
          Icon(Icons.notifications_active, color: Colors.pink),
          SizedBox(width: 10),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Color(0xFFC71585),
        unselectedItemColor: Colors.teal[300],
        backgroundColor: Color(0xFFE6E6FA),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Citas"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Pedidos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Colección: $categoriaSeleccionada",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown[700]),
              ),
            ),
            // Fila de categorías interactiva
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryIcon(Icons.pets, "Ajolote"),
                _buildCategoryIcon(Icons.local_florist, "Rosas"),
                _buildCategoryIcon(Icons.filter_vintage, "Girasol"),
                _buildCategoryIcon(Icons.spa, "Loto"),
                _buildCategoryIcon(Icons.card_giftcard, "Regalos"),
              ],
            ),
            SizedBox(height: 25),
            // 3. Mostramos la lista dinámica según el estado
            Column(children: _obtenerProductos()),
          ],
        ),
      ),
    );
  }

  // Widget para los botones de categorías con detección de clic
  Widget _buildCategoryIcon(IconData icon, String label) {
    bool isActive = categoriaSeleccionada == label;

    return GestureDetector(
      onTap: () {
        // Actualizamos el estado para redibujar la pantalla
        setState(() {
          categoriaSeleccionada = label;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Color(0xFFFFE4E1) : Colors.white,
              border: Border.all(color: isActive ? Color(0xFFC71585) : Colors.black12, width: 2),
              boxShadow: [
                if (isActive) BoxShadow(color: Colors.pink.withOpacity(0.2), blurRadius: 8)
              ],
            ),
            child: Icon(icon, color: isActive ? Color(0xFFC71585) : Colors.grey, size: 28),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10, color: Colors.brown, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildFlorItem(String titulo, String hora, String encargado, IconData florIcon, Color circuloColor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFFFE4E1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: circuloColor, shape: BoxShape.circle),
            child: Icon(florIcon, size: 24, color: Colors.brown[800]),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFFC71585))),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.teal),
                    Text(" $hora   ", style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    Icon(Icons.person_pin, size: 14, color: Colors.teal),
                    Text(" $encargado", style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.pink[100]),
        ],
      ),
    );
  }
}