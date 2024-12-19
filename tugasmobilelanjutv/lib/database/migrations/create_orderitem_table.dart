import 'package:vania/vania.dart';

class CreateOrderitemTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('orderitem', () {
      integer('order_item', length: 11);
      integer('order_num', length: 11);
      string('prod_id', length:10);
      integer('quantity', length: 11);
      integer('size', length: 11);
      primary('order_item');
      foreign('order_num', 'orders', 'order_num');
      foreign('prod_id', 'product', 'prod_id');
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('orderitem');
  }
}
