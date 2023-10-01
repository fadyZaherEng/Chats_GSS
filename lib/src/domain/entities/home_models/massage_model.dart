class MassageModel {
  dynamic text, dateTime, senderId, receiverId, image, createdAt;
  MassageModel(
      {required this.createdAt,
      required this.image,
      required this.text,
      required this.dateTime,
      required this.receiverId,
      this.senderId});

  MassageModel.fromJson(Map<String, dynamic>? json) {
    senderId = json!['senderId'];
    image = json!['image'];
    receiverId = json['receiverId'];
    text = json['text'];
    dateTime = json['dateTime'];
    createdAt = json['createdAt'];
  }
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'text': text,
      'image': image,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'createdAt': createdAt
    };
  }
}
