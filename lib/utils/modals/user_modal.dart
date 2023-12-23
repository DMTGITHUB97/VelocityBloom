class UserModal {
  UserModal({required this.name, required this.isActive, required this
      .lastSeen, required this.image, required this.email, required this
      .about});
  late String name;
  late bool isActive;
  late String lastSeen;
  late String image;
  late String email;
  late String about;

  UserModal.fromJson(Map<String, dynamic> json){
    name = json['name'] ?? '';
    isActive = json['isActive'] ?? '';
    lastSeen = json['lastSeen'] ?? '';
    image = json['image'] ?? '';
    email = json['email'] ?? '';
    about = json['about'] ?? '';
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data['name'] = name;
    data['isActive'] = isActive;
    data['lastSeen'] = lastSeen;
    data['image'] = image;
    data['email'] = email;
    data['about'] = about;
    return data;
}
}