class MilladApi {
  List<Category>? category;
  List<Unstitched>? unstitched;
  List<BoutiqueCollection>? boutiqueCollection;
  String? status;
  String? message;

  MilladApi(
      {this.category,
        this.unstitched,
        this.boutiqueCollection,
        this.status,
        this.message});

  MilladApi.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['Unstitched'] != null) {
      unstitched = <Unstitched>[];
      json['Unstitched'].forEach((v) {
        unstitched!.add(new Unstitched.fromJson(v));
      });
    }
    if (json['boutique_collection'] != null) {
      boutiqueCollection = <BoutiqueCollection>[];
      json['boutique_collection'].forEach((v) {
        boutiqueCollection!.add(new BoutiqueCollection.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.unstitched != null) {
      data['Unstitched'] = this.unstitched!.map((v) => v.toJson()).toList();
    }
    if (this.boutiqueCollection != null) {
      data['boutique_collection'] =
          this.boutiqueCollection!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Category {
  String? categoryId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  Category(
      {this.categoryId, this.name, this.tintColor, this.image, this.sortOrder});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    tintColor = json['tint_color'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['tint_color'] = this.tintColor;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}

class Unstitched {
  String? rangeId;
  String? name;
  String? image;

  Unstitched({this.rangeId, this.name, this.image});

  Unstitched.fromJson(Map<String, dynamic> json) {
    rangeId = json['range_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['range_id'] = this.rangeId;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class BoutiqueCollection {
  String? bannerImage;
  String? bannerType;
  String? bannerId;

  BoutiqueCollection({this.bannerImage, this.bannerType, this.bannerId});

  BoutiqueCollection.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    bannerType = json['banner_type'];
    bannerId = json['banner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['banner_type'] = this.bannerType;
    data['banner_id'] = this.bannerId;
    return data;
  }
}