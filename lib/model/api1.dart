class TopApi {
  List<MainStickyMenu>? mainStickyMenu;
  List<OfferCodeBanner>? offerCodeBanner;
  String? status;
  String? message;

  TopApi(
      {this.mainStickyMenu, this.offerCodeBanner, this.status, this.message});

  TopApi.fromJson(Map<String, dynamic> json) {
    if (json['main_sticky_menu'] != null) {
      mainStickyMenu = <MainStickyMenu>[];
      json['main_sticky_menu'].forEach((v) {
        mainStickyMenu!.add(new MainStickyMenu.fromJson(v));
      });
    }
    if (json['offer_code_banner'] != null) {
      offerCodeBanner = <OfferCodeBanner>[];
      json['offer_code_banner'].forEach((v) {
        offerCodeBanner!.add(new OfferCodeBanner.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainStickyMenu != null) {
      data['main_sticky_menu'] =
          this.mainStickyMenu!.map((v) => v.toJson()).toList();
    }
    if (this.offerCodeBanner != null) {
      data['offer_code_banner'] =
          this.offerCodeBanner!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class MainStickyMenu {
  String? title;
  String? image;
  String? sortOrder;
  List<SliderImages>? sliderImages;

  MainStickyMenu({this.title, this.image, this.sortOrder, this.sliderImages});

  MainStickyMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    if (json['slider_images'] != null) {
      sliderImages = <SliderImages>[];
      json['slider_images'].forEach((v) {
        sliderImages!.add(new SliderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    if (this.sliderImages != null) {
      data['slider_images'] =
          this.sliderImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderImages {
  String? title;
  String? image;
  String? sortOrder;
  String? cta;

  SliderImages({this.title, this.image, this.sortOrder, this.cta});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    data['cta'] = this.cta;
    return data;
  }
}

class OfferCodeBanner {
  String? bannerImage;
  String? type;

  OfferCodeBanner({this.bannerImage, this.type});

  OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['type'] = this.type;
    return data;
  }
}