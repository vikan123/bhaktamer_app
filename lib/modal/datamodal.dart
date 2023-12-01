

class DataModal{
  String id;
  String problem;
  String shloke;
  String image;
  String desc;
  String kavya;
  String mantra;

  DataModal(
  {
    required this.id,
    required this.problem,
    required this.shloke,
    required this.image,
    required this.desc,
    required this.kavya,
    required this.mantra,

}
      );
  factory DataModal.fromJson(Map<String, dynamic> json) {
    return DataModal(
      id: json['id'].toString(),
      problem: json['problem']??"",
        shloke: json['shloke']??"",
        image: json['image']??"",
        desc: json['desc']??"",
        kavya: json['kavya']??"",
        mantra: json['mantra']??""
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id']= id;
    data['problem']= problem;
    data['shloke']= shloke;
    data['image']= image;
    data['desc']= desc;
    data['kavya']= kavya;
    data['mantra']= mantra;
    return data;
  }
}

// factory DataList.fromJson(List<dynamic> parsedJson) {
// List<DataModal> datalist = <DataModal>[];
// datalist = parsedJson.map((i) => DataModal.fromJson(i)).toList();
// return DataList(datalist: datalist);
// }
//
