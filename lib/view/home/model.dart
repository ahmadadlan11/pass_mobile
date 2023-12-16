import 'dart:convert';

import 'package:flutter/foundation.dart';

class PackageModel {
  String? id;
  List<String>? images;
  PackageModel({
    this.id,
    this.images,
  });
  

  PackageModel copyWith({
    String? id,
    List<String>? images,
  }) {
    return PackageModel(
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

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageModel.fromJson(String source) => PackageModel.fromMap(json.decode(source));

  @override
  String toString() => 'PackageModel(id: $id, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PackageModel &&
      other.id == id &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode => id.hashCode ^ images.hashCode;
}
