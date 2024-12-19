import 'package:vania/vania.dart';

class ProductController extends Controller {
  // Menampilkan daftar produk (GET /product)
  Future<Response> index(Request request) async {
    try {
      // Misalkan ini adalah daftar produk yang diambil dari database
      var products = [
        {'prod_id': 1, 'prod_name': 'Produk 1', 'prod_price': 100, 'prod_desc': 'Deskripsi produk 1', 'vend_id': 101},
        {'prod_id': 2, 'prod_name': 'Produk 2', 'prod_price': 200, 'prod_desc': 'Deskripsi produk 2', 'vend_id': 102},
      ];

      return Response.json({'data': products}, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal mengambil data produk',
        'error': e.toString(),
      }, 500);
    }
  }

  // Fungsi untuk membuat produk (POST /product)
  Future<Response> create(Request request) async {
    try {
      // Ambil data dari input
      final requestData = await request.input();

      // Validasi data
      if (requestData['name'] == null || requestData['price'] == null || requestData['vendor_id'] == null) {
        return Response.json({
          'message': 'Nama, harga produk, dan vendor_id harus diisi.',
        }, 400);
      }

      // Validasi harga (harus berupa angka)
      if (double.tryParse(requestData['price'].toString()) == null) {
        return Response.json({
          'message': 'Harga produk harus berupa angka.',
        }, 400);
      }

      // Data produk yang akan disimpan
      var product = {
        'prod_name': requestData['name'],
        'prod_price': requestData['price'],
        'prod_desc': requestData['description'] ?? '',  // opsional, jika tidak ada deskripsi
        'vend_id': requestData['vendor_id'],
      };

      // Simulasi penyimpanan produk ke database
      var insertedProduct = {
        'prod_id': 1,  // Ini akan dihasilkan oleh auto-increment di database
        'prod_name': product['prod_name'],
        'prod_price': product['prod_price'],
        'prod_desc': product['prod_desc'],
        'vend_id': product['vend_id'],
      };

      return Response.json({
        'message': 'Produk berhasil ditambahkan',
        'data': insertedProduct,
      }, 201);
    } catch (e) {
      return Response.json({
        'message': 'Terjadi kesalahan pada server, silakan coba lagi nanti',
        'error': e.toString(),
      }, 500);
    }
  }

  // Menampilkan produk berdasarkan ID (GET /product/{id})
  Future<Response> show(Request request, String id) async {
    try {
      // Misalkan produk dengan ID yang diminta
      var product = {
        'prod_id': id,
        'prod_name': 'Produk $id',
        'prod_price': 150,
        'prod_desc': 'Deskripsi produk $id',
        'vend_id': 101,
      };

      return Response.json({'data': product}, 200);
    } catch (e) {
      return Response.json({
        'message': 'Produk tidak ditemukan',
        'error': e.toString(),
      }, 404);
    }
  }

  // Fungsi untuk update produk (PUT /product/{id})
  Future<Response> update(Request request, String id) async {
    try {
      final requestData = await request.input();

      // Validasi data
      if (requestData['name'] == null || requestData['price'] == null || requestData['vendor_id'] == null) {
        return Response.json({
          'message': 'Nama, harga produk, dan vendor_id harus diisi.',
        }, 400);
      }

      // Validasi harga (harus berupa angka)
      if (double.tryParse(requestData['price'].toString()) == null) {
        return Response.json({
          'message': 'Harga produk harus berupa angka.',
        }, 400);
      }

      // Simulasi pembaruan produk di database
      var updatedProduct = {
        'prod_id': id,
        'prod_name': requestData['name'],
        'prod_price': requestData['price'],
        'prod_desc': requestData['description'] ?? '',  // opsional, jika tidak ada deskripsi
        'vend_id': requestData['vendor_id'],
      };

      return Response.json({
        'message': 'Produk berhasil diperbarui',
        'data': updatedProduct,
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Terjadi kesalahan pada server, silakan coba lagi nanti',
        'error': e.toString(),
      }, 500);
    }
  }

  // Fungsi untuk menghapus produk (DELETE /product/{id})
  Future<Response> destroy(Request request, String id) async {
    try {
      // Simulasi penghapusan produk dari database
      return Response.json({
        'message': 'Produk dengan ID $id berhasil dihapus',
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Terjadi kesalahan pada server, silakan coba lagi nanti',
        'error': e.toString(),
      }, 500);
    }
  }
}

final ProductController productController = ProductController();

