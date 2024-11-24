import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuevaapp/producto.dart';


class Principalbotones extends StatefulWidget {
  const Principalbotones({super.key});

  @override
  State<Principalbotones> createState() => _PrincipalbotonesState();
}

class _PrincipalbotonesState extends State<Principalbotones> {
  String titulo = "Panadería Yadael";
  int contPan10 = 0;
  int contPan9 = 0;
  int contPan5 = 0;

  List<Producto> productos = [
    Producto(
        nombre: "Coca Cola",
        codigoDeBarras: "7501471898064",
        precio: 16,
        cantidad: 1),
    Producto(
        nombre: "Sabritas",
        codigoDeBarras: "9876543210987",
        precio: 20,
        cantidad: 1),
  ];

  List<Producto> productosEscaneados = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            titulo,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          actions: [
            SizedBox(
              height: 40,
              width: 80,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 142, 194, 146),
                child: Text(
                  "Pagar",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.brown,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Wrap(
                children: [
                  CardsPan("Pan 10", contPan10, (val) {
                    setState(() => contPan10 += val);
                  }, const Color.fromARGB(255, 173, 219, 175)),
                  CardsPan("Pan 9", contPan9, (val) {
                    setState(() => contPan9 += val);
                  }, const Color.fromARGB(255, 173, 199, 221)),
                  CardsPan("Pan 5", contPan5, (val) {
                    setState(() => contPan5 += val);
                  }, const Color.fromARGB(255, 173, 128, 128)),
                ],
              ),
              const SizedBox(height: 20),
              titleproductos(context),
              const SizedBox(height: 30),
              productosList(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "36", // Aquí podrías calcular el total real de los productos escaneados
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardsPan(
      String title, int contador, void Function(int) onUpdate, Color color) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 150,
          width: 105,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 8),
                Text(
                  '$contador',
                  style: GoogleFonts.roboto(fontSize: 25),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => onUpdate(-1),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () => onUpdate(1),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleproductos(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Productos",
            style: GoogleFonts.montserrat(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        IconButton(
          onPressed: () async {/*
            final codigoEscaneado = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CodigodeBarras()),
            );

            if (codigoEscaneado != null) {
              setState(() {
                bool found = false;
                for (var producto in productos) {
                  if (producto.codigoDeBarras == codigoEscaneado) {
                    productosEscaneados.add(producto);
                    found = true;
                    print("Producto encontrado: ${producto.nombre}");
                    print("Precio: ${producto.precio}");
                    break;
                  }
                }
                if (!found) {
                  print("No se encontró producto para el código: $codigoEscaneado");
                }
              });
            }*/
          },
          icon: const Icon(Icons.qr_code_scanner),
        ),
      ],
    );
  }

  Widget productosList() {
    return Column(
      children: productosEscaneados.map((producto) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              producto.cantidad.toString(),
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            Text(
              producto.nombre,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            Text(
              "\$ ${producto.precio}",
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ],
        );
      }).toList(),
    );
  }
}
