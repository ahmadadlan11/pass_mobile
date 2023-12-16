import 'dart:convert';

import 'package:flutter/foundation.dart';

class PassesModel {
  String? id;
  List<String>? images;
  PassesModel({
    this.id,
    this.images,
  });
  

  PassesModel copyWith({
    String? id,
    List<String>? images,
  }) {
    return PassesModel(
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

  factory PassesModel.fromMap(Map<String, dynamic> map) {
    return PassesModel(
      id: map['id'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PassesModel.fromJson(String source) => PassesModel.fromMap(json.decode(source));

  @override
  String toString() => 'PassesModel(id: $id, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PassesModel &&
      other.id == id &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode => id.hashCode ^ images.hashCode;
}
