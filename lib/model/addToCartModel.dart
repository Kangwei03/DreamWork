class AddToCart {
  final int? id;
  String productName;
  int quantity;

  AddToCart({
    this.id,
    required this.productName,
    required this.quantity,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'productName': productName,
      'id': id,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.

  @override
  String toString() {
    return 'AddToCart{quantity: $quantity, productName: $productName, id: $id}';
  }
}
