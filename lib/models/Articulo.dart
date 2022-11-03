

class Articulo{

  String nombre;
  int cantidad;
  double precio;
  late double total;

  Articulo(this.nombre, this.cantidad, this.precio){
    total = cantidad * precio;
  }
}