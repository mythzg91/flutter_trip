
// config Object NonNull
// bannerList Array NonNull
// LocalNavList Array NonNull
// gridMav Object NonNull
// subNavList Array NonNull
// salesBox Object NonNull
class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String,dynamic>json){
    return ConfigModel(
      searchUrl: json['searchUrl']
    );
  }
  Map<String, dynamic> toJson(){
    return {searchUrl: searchUrl};
  }

}