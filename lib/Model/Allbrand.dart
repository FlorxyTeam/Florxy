class AllBrands {
  String? sId;
  int? count;

  AllBrands({this.sId, this.count});

  AllBrands.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['count'] = this.count;
    return data;
  }
}