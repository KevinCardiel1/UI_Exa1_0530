import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  final String base = "https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/main/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: Text("Catálogo de Flores", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFE1F5FE),
        actions: [Icon(Icons.search, color: Colors.black), SizedBox(width: 15)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("Nuestras Variedades", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _circleImg("${base}girasol.png"),
              _circleImg("${base}jasmineflower.png"),
              _circleImg("${base}ajoloteflor.PNG"),
              _circleImg("${base}no.png"),
              _circleImg("${base}omaiga.PNG"),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10),
              children: [
                _listTile(context, "Arreglo Girasol", "8:00 AM - 8:00 PM", "${base}ramodegirasoles.png"),
                _listTile(context, "Especial Jazmín", "9:00 AM - 7:00 PM", "${base}jasmineflower.png"),
                _listTile(context, "Promo Ajolote", "Disponible ahora", "${base}ajoloteflor.PNG"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _circleImg(String url) {
    return Container(
      width: 60, height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle, 
        border: Border.all(color: Colors.pink[100]!, width: 2),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
      ),
    );
  }

  Widget _listTile(BuildContext context, String t, String h, String img) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.pink[50], backgroundImage: NetworkImage(img)),
        title: Text(t, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(h),
        trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.pink),
        onTap: () => Navigator.pushNamed(context, '/pantalla3'),
      ),
    );
  }
}