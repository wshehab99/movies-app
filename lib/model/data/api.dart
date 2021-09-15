import 'dart:math';

import '../PageBAseRespons.dart';

class Pages extends PageBAseRespons {
  int? num;
  Results? reesluts;

  Pages.fromJSON(Map<String, dynamic> json) {
    num = json['page'];
    reesluts = Results.fromMap(json['results']);
  }
}

class Results {
  List<Result>? listOfResults;
  Results.fromMap(List<dynamic> z) {
    listOfResults = z.map<Result>((element) {
      return Result.fromJSON(element);
    }).toList();
  }
}

class Result {
  bool? adult;
  String? backdrop_path;
  List? genre_ids;
  dynamic id;
  String? original_language;
  String? original_title;
  String? overview;
  dynamic popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  dynamic vote_average;
  dynamic vote_count;

  Result.fromJSON(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    genre_ids = json['genre_ids'];
    id = json['id'];
    original_language = json['original_language'];
    original_title = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    poster_path = json['poster_path'];
    release_date = json['release_date'];
    title = json['title'];
    video = json['video'];
    vote_average = json['vote_average'];
    vote_count = json['vote_count'];
  }
}
