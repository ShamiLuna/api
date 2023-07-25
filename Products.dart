class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;


  Products(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
    price =double.parse( json['price'].toString());
    description = json['description'].toString();
    category = json['category'].toString();
    image = json['image'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;

    return data;
  }
}

