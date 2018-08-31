class PropertyItem {
  final String unitType;
  final int netPurchasePrice;
  final String city;
  final String country;

  PropertyItem({this.unitType, this.city, this.country, this.netPurchasePrice});

  factory PropertyItem.fromJson(Map<String, dynamic> json){
    return PropertyItem(
      unitType: json['unit_type'],
      netPurchasePrice: json[''],
      city: json['city'],
      country: json['country']
    );
  }
}
