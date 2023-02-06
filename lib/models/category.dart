class Category{
  late int id;
  late String labelOfCat;

  Category({required this.id,required this.labelOfCat});

  factory Category.fromJson(Map<String,dynamic> json){
    return Category(
        id: json['id'],
        labelOfCat: json['labelOfCat']
    );
  }
}