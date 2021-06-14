import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  final String kategoriadi;
  const Kategori({Key? key, required this.kategoriadi}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.set_meal_outlined),
              ),
              Text(widget.kategoriadi),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right_outlined))
        ],
      ),
    );
  }
}
