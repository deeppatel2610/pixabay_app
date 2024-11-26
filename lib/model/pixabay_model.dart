class PixabayModel {
  int? total, totalHits;
  List<Hits>? hits;

  PixabayModel({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  factory PixabayModel.fromJson(Map m1) {
    return PixabayModel(
      total: m1['total'],
      totalHits: m1['totalHits'],
      hits: (m1['hits'] as List)
          .map(
            (e) => Hits.fromJson(e),
          )
          .toList(),
    );
  }
}

class Hits {
  int? id,
      previewWidth,
      previewHeight,
      webformatWidth,
      webformatHeight,
      imageWidth,
      imageHeight,
      imageSize,
      views,
      downloads,
      collections,
      likes,
      comments,
      user_id;
  String? pageURL,
      type,
      tags,
      previewURL,
      webformatURL,
      largeImageURL,
      user,
      userImageURL;

  Hits({
    required this.id,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.user,
    required this.userImageURL,
  });

  factory Hits.fromJson(Map m1) {
    return Hits(
      id: m1['id'],
      previewWidth: m1['previewWidth'],
      previewHeight: m1['previewHeight'],
      webformatWidth: m1['webformatWidth'],
      webformatHeight: m1['webformatHeight'],
      imageWidth: m1['imageWidth'],
      imageHeight: m1['imageHeight'],
      imageSize: m1['imageSize'],
      views: m1['views'],
      downloads: m1['downloads'],
      collections: m1['collections'],
      likes: m1['likes'],
      comments: m1['comments'],
      user_id: m1['user_id'],
      pageURL: m1['pageURL'],
      type: m1['type'],
      tags: m1['tags'],
      previewURL: m1['previewURL'],
      webformatURL: m1['webformatURL'],
      largeImageURL: m1['largeImageURL'],
      user: m1['user'],
      userImageURL: m1['userImageURL'],
    );
  }
}
