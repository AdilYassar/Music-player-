class MySongModel {
  final int id;
  final String title;

  final String data;

  MySongModel({
    required this.id,
    required this.title,
    required this.data,
  });

  factory MySongModel.fromJson(Map<String, dynamic> json) {
    return MySongModel(
      id: json['id'],
      title: json['title'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'data': data,
    };
  }
}
