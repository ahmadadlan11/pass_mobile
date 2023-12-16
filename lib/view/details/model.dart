import 'dart:convert';

import 'package:flutter/foundation.dart';

class DetailsModel {
  String? id;
  List<String>? images;
  DetailsModel({
    this.id,
    this.images,
  });
  

  DetailsModel copyWith({
    String? id,
    List<String>? images,
  }) {
    return DetailsModel(
      id: id ?? this.id,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(images != null){
      result.addAll({'images': images});
    }
  
    return result;
  }

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      id: map['id'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsModel.fromJson(String source) => DetailsModel.fromMap(json.decode(source));

  @override
  String toString() => 'DetailsModel(id: $id, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DetailsModel &&
      other.id == id &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode => id.hashCode ^ images.hashCode;
}
