import 'dart:convert';

import 'package:flutter/foundation.dart';

class FavoritesModel {
  String? id;
  List<String>? images;
  FavoritesModel({
    this.id,
    this.images,
  });
  

  FavoritesModel copyWith({
    String? id,
    List<String>? images,
  }) {
    return FavoritesModel(
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

  factory FavoritesModel.fromMap(Map<String, dynamic> map) {
    return FavoritesModel(
      id: map['id'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesModel.fromJson(String source) => FavoritesModel.fromMap(json.decode(source));

  @override
  String toString() => 'FavoritesModel(id: $id, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FavoritesModel &&
      other.id == id &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode => id.hashCode ^ images.hashCode;
}
