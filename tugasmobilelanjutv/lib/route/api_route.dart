
import 'package:tugasmobilelanjutv/app/http/controllers/product_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    // Daftarkan route untuk API
    Router.post('/product', productController.create); // POST untuk membuat produk
    Router.get('/product', productController.index); // GET untuk mengambil daftar produk
    Router.get('/product/{id}', productController.show); // GET untuk mengambil produk berdasarkan ID
    Router.put('/product/{id}', productController.update); // PUT untuk memperbarui produk berdasarkan ID
    Router.delete('/product/{id}', productController.destroy); // DELETE untuk menghapus produk berdasarkan ID
  }
}

