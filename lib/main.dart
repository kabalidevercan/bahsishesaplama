import 'package:flutter/material.dart';

void main() {
  runApp(BahsisHesapMakinesi());
}

class BahsisHesapMakinesi extends StatefulWidget {
  BahsisHesapMakinesi({Key? key}) : super(key: key);

  @override
  State<BahsisHesapMakinesi> createState() => _BahsisHesapMakinesiState();
}

class _BahsisHesapMakinesiState extends State<BahsisHesapMakinesi> {
  final TextEditingController _bahsisController = TextEditingController();
  final TextEditingController _yuzdeController = TextEditingController();

  double sonuc = 0;
  double toplam = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Bahşiş Hesaplama"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: _bahsisController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Lütfen Ödenecek Tutarı girin",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: _yuzdeController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 3,
                      color: Colors.black,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Lütfen % giriniz",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 30),
                    primary: Colors.black87,
                  ),
                  onPressed: () {
                    double miktar = double.parse(_bahsisController.text);
                    double bahsis = double.parse(_yuzdeController.text);
                    setState(() {
                      sonuc = miktar * (bahsis / 100);
                      toplam = sonuc + miktar;
                    });
                  },
                  child: Text("Hesapla"),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  color: Colors.orange[500],
                  child: SizedBox(
                    width: 400,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ödenecek Bahşiş: "),
                        Text("$sonuc"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  color: Colors.orange[500],
                  child: SizedBox(
                    width: 400,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ödenecek Toplam Para: "),
                        Text("$toplam"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
