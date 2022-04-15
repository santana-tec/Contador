import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Contador',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void decrementar() {
    setState(() {
      contador--;
    });

  }

  void incrementar() {
    setState(() {
      contador++;
    });

  }

  bool get isEmpty => contador == 0;
  bool get isFull => contador >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contador"),
        backgroundColor: const Color(0xFF2BC619),
      ),
      body: Container(

        decoration: const BoxDecoration(

          image: DecorationImage(
            image: AssetImage('assets/images/luffy.jpg'),
               fit:BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              isFull ? "Lotado" : "Pode Entrar",
              style: const TextStyle(
                  fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Text(
              "$contador",
              style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed:  isEmpty ? null : decrementar,
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? const Color(0xFF2BC619).withOpacity(0.2) :  const Color(0xFF2BC619),
                      //padding: EdgeInsets.all(32),
                      fixedSize: const Size(150, 150),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    child: const Text("Saiu",
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                    onPressed: isFull ? null : incrementar,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? const Color(0xFF2BC619).withOpacity(0.2) : const Color(0xFF2BC619),
                      //padding: EdgeInsets.all(32),
                      fixedSize: const Size(150, 150),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    child: const Text("Entrou",
                        style: TextStyle(fontSize: 25, color: Colors.white))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
