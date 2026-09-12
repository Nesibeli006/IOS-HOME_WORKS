void main() {
  double order1 = processOrder(
    orderId: 101,
    itemPrice: 2000.0,
  );

  double order2 = processOrder( orderId: 102,
    itemPrice: 5000.0,
    promoCode: 'SAVE10',
    deliveryFee: 300.0,
  );
  
  double grandTotal = order1 + order2;
  print("SUM OF TOTAL ORDERS: $grandTotal ₸");
}


double processOrder ({
  required int orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}){
  double finalDelivery = deliveryFee ?? 500.0;
  
  double finalItemPrice = itemPrice;
  if(promoCode == 'SAVE10'){
    finalItemPrice = itemPrice * 0.9;
  }
  
  double total = finalItemPrice + finalDelivery;
  
  print("Order #$orderId\nSummary:");
  print("Item Price: $finalItemPrice ₸");
  print("Delivery Fee: $finalDelivery ₸");
  print("Total: $total ₸\n");

  return total;
}