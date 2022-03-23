import 'package:json_annotation/json_annotation.dart'; 
  
part 'photo_data.g.dart';


List<PhotoData> getPhotoDataList(List<dynamic> list){
    List<PhotoData> result = [];
    list.forEach((item){
      result.add(PhotoData.fromJson(item));
    });
    return result;
  }
@JsonSerializable()
  class PhotoData extends Object {

  @JsonKey(name: 'albumId')
  int albumId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'thumbnailUrl')
  String thumbnailUrl;

  PhotoData(this.albumId,this.id,this.title,this.url,this.thumbnailUrl,);

  factory PhotoData.fromJson(Map<String, dynamic> srcJson) => _$PhotoDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PhotoDataToJson(this);

}

  
