// To parse this JSON data, do
//
//     final trendingMovies = trendingMoviesFromJson(jsonString);

import 'dart:convert';

TrendingMovies trendingMoviesFromJson(String str) =>
    TrendingMovies.fromJson(json.decode(str));

String trendingMoviesToJson(TrendingMovies data) => json.encode(data.toJson());

class TrendingMovies {
  TrendingMovies({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory TrendingMovies.fromJson(Map<String, dynamic> json) => TrendingMovies(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}

class Result {
  Result({
    this.overview,
    this.id,
    this.adult,
    this.backdropPath,
    this.title,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.video,
    this.voteAverage,
    this.releaseDate,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.name,
    this.firstAirDate,
    this.originCountry,
  });

  String? overview;
  int? id;
  bool? adult;
  String? backdropPath;
  String? title;
  List<int>? genreIds;
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? posterPath;
  int? voteCount;
  bool? video;
  double? voteAverage;
  DateTime? releaseDate;
  double? popularity;
  MediaType? mediaType;
  String? originalName;
  String? name;
  DateTime? firstAirDate;
  List<String>? originCountry;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        overview: json["overview"] == null ? null : json["overview"],
        id: json["id"] == null ? null : json["id"],
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        title: json["title"] == null ? null : json["title"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : originalLanguageValues.map![json["original_language"]],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        mediaType: json["media_type"] == null
            ? null
            : mediaTypeValues.map![json["media_type"]],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        name: json["name"] == null ? null : json["name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "overview": overview == null ? null : overview,
        "id": id == null ? null : id,
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "title": title == null ? null : title,
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds!.map((x) => x)),
        "original_language": originalLanguage == null
            ? null
            : originalLanguageValues.reverse![originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "poster_path": posterPath == null ? null : posterPath,
        "vote_count": voteCount == null ? null : voteCount,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "popularity": popularity == null ? null : popularity,
        "media_type":
            mediaType == null ? null : mediaTypeValues.reverse![mediaType],
        "original_name": originalName == null ? null : originalName,
        "name": name == null ? null : name,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
  @override
  String tOString() {
    return super.toString();
  }
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, JA, TR }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "tr": OriginalLanguage.TR
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
