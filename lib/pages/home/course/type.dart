// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.code,
    this.message,
    this.result,
    this.uuid,
  });

  num code;
  String message;
  Result result;
  dynamic uuid;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    code: json["code"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result.toJson(),
    "uuid": uuid,
  };
}

class Result {
  Result({
    this.infoDtoList,
    this.focusDtoList,
    this.sectionDtoList,
    this.generalDtoList,
    this.iconDtoList,
  });

  dynamic infoDtoList;
  List<DtoList> focusDtoList;
  List<SectionDtoList> sectionDtoList;
  List<dynamic> generalDtoList;
  List<DtoList> iconDtoList;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    infoDtoList: json["infoDtoList"],
    focusDtoList: List<DtoList>.from(json["focusDtoList"].map((x) => DtoList.fromJson(x))),
    sectionDtoList: List<SectionDtoList>.from(json["sectionDtoList"].map((x) => SectionDtoList.fromJson(x))),
    generalDtoList: List<dynamic>.from(json["generalDtoList"].map((x) => x)),
    iconDtoList: List<DtoList>.from(json["iconDtoList"].map((x) => DtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "infoDtoList": infoDtoList,
    "focusDtoList": List<dynamic>.from(focusDtoList.map((x) => x.toJson())),
    "sectionDtoList": List<dynamic>.from(sectionDtoList.map((x) => x.toJson())),
    "generalDtoList": List<dynamic>.from(generalDtoList.map((x) => x)),
    "iconDtoList": List<dynamic>.from(iconDtoList.map((x) => x.toJson())),
  };
}

class DtoList {
  DtoList({
    this.id,
    this.targetType,
    this.targetTo,
    this.photoUrl,
    this.name,
    this.weight,
    this.onlineTime,
    this.targetUrl,
    this.offlineTime,
    this.remark,
    this.platform,
    this.photoStyle,
    this.categoryVo,
    this.courseCardVo,
  });

  dynamic id;
  num targetType;
  String targetTo;
  String photoUrl;
  String name;
  num weight;
  num onlineTime;
  dynamic targetUrl;
  num offlineTime;
  dynamic remark;
  num platform;
  num photoStyle;
  CategoryVo categoryVo;
  CourseCardVo courseCardVo;

  factory DtoList.fromJson(Map<String, dynamic> json) => DtoList(
    id: json["id"],
    targetType: json["targetType"],
    targetTo: json["targetTo"],
    photoUrl: json["photoUrl"],
    name: json["name"],
    weight: json["weight"],
    onlineTime: json["onlineTime"] == null ? null : json["onlineTime"],
    targetUrl: json["targetUrl"],
    offlineTime: json["offlineTime"] == null ? null : json["offlineTime"],
    remark: json["remark"],
    platform: json["platform"] == null ? null : json["platform"],
    photoStyle: json["photoStyle"] == null ? null : json["photoStyle"],
    categoryVo: json["categoryVo"] == null ? null : CategoryVo.fromJson(json["categoryVo"]),
    courseCardVo: json["courseCardVo"] == null ? null : CourseCardVo.fromJson(json["courseCardVo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "targetType": targetType,
    "targetTo": targetTo,
    "photoUrl": photoUrl,
    "name": name,
    "weight": weight,
    "onlineTime": onlineTime == null ? null : onlineTime,
    "targetUrl": targetUrl,
    "offlineTime": offlineTime == null ? null : offlineTime,
    "remark": remark,
    "platform": platform == null ? null : platform,
    "photoStyle": photoStyle == null ? null : photoStyle,
    "categoryVo": categoryVo == null ? null : categoryVo.toJson(),
    "courseCardVo": courseCardVo == null ? null : courseCardVo.toJson(),
  };
}

class CategoryVo {
  CategoryVo({
    this.id,
    this.name,
    this.parentId,
    this.parentName,
    this.children,
    this.level,
    this.imgUrl,
    this.bigImgUrl,
    this.targetUrl,
    this.description,
    this.isExists,
  });

  num id;
  String name;
  num parentId;
  dynamic parentName;
  List<dynamic> children;
  dynamic level;
  dynamic imgUrl;
  dynamic bigImgUrl;
  dynamic targetUrl;
  dynamic description;
  num isExists;

  factory CategoryVo.fromJson(Map<String, dynamic> json) => CategoryVo(
    id: json["id"],
    name: json["name"],
    parentId: json["parentId"],
    parentName: json["parentName"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
    level: json["level"],
    imgUrl: json["imgUrl"],
    bigImgUrl: json["bigImgUrl"],
    targetUrl: json["targetUrl"],
    description: json["description"],
    isExists: json["isExists"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parentId": parentId,
    "parentName": parentName,
    "children": List<dynamic>.from(children.map((x) => x)),
    "level": level,
    "imgUrl": imgUrl,
    "bigImgUrl": bigImgUrl,
    "targetUrl": targetUrl,
    "description": description,
    "isExists": isExists,
  };
}

class CourseCardVo {
  CourseCardVo({
    this.courseType,
    this.courseId,
    this.targetUrl,
    this.isPromStatus,
    this.yocCourseCard,
    this.mocCourseCard,
    this.yktCourseCard,
    this.yktCourseCardv,
    this.yktAggregationVo,
    this.type,
    this.expiredTime,
    this.status,
    this.rawData,
  });

  num courseType;
  num courseId;
  dynamic targetUrl;
  bool isPromStatus;
  dynamic yocCourseCard;
  dynamic mocCourseCard;
  dynamic yktCourseCard;
  YktCourseCardv yktCourseCardv;
  dynamic yktAggregationVo;
  dynamic type;
  dynamic expiredTime;
  dynamic status;
  dynamic rawData;

  factory CourseCardVo.fromJson(Map<String, dynamic> json) => CourseCardVo(
    courseType: json["courseType"],
    courseId: json["courseId"],
    targetUrl: json["targetUrl"],
    isPromStatus: json["isPromStatus"],
    yocCourseCard: json["yocCourseCard"],
    mocCourseCard: json["mocCourseCard"],
    yktCourseCard: json["yktCourseCard"],
    yktCourseCardv: YktCourseCardv.fromJson(json["yktCourseCardv"]),
    yktAggregationVo: json["yktAggregationVo"],
    type: json["type"],
    expiredTime: json["expiredTime"],
    status: json["status"],
    rawData: json["rawData"],
  );

  Map<String, dynamic> toJson() => {
    "courseType": courseType,
    "courseId": courseId,
    "targetUrl": targetUrl,
    "isPromStatus": isPromStatus,
    "yocCourseCard": yocCourseCard,
    "mocCourseCard": mocCourseCard,
    "yktCourseCard": yktCourseCard,
    "yktCourseCardv": yktCourseCardv.toJson(),
    "yktAggregationVo": yktAggregationVo,
    "type": type,
    "expiredTime": expiredTime,
    "status": status,
    "rawData": rawData,
  };
}

class YktCourseCardv {
  YktCourseCardv({
    this.id,
    this.pid,
    this.categoryId,
    this.categoryName,
    this.auditStatus,
    this.smallPhotoUrl,
    this.bigPhotoUrl,
    this.descriptionVideoId,
    this.name,
    this.creatorId,
    this.creatorNick,
    this.provider,
    this.providerType,
    this.description,
    this.gmtCreate,
    this.gmtModified,
    this.targetUser,
    this.mark,
    this.price,
    this.commonDiscountPrice,
    this.commonDiscountRate,
    this.providerPhotoUrl,
    this.providerLink,
    this.recommend,
    this.recommendForQrRepo,
    this.weightForQrRepo,
    this.commentCount,
    this.learnerCount,
    this.lectors,
    this.learningProgress,
    this.learningLessonId,
    this.learningLessonName,
    this.learningLessonPosition,
    this.started,
    this.learningStatus,
    this.compatibleLearningStatus,
    this.middlePhotoUrl,
    this.providerDesc,
    this.published,
    this.courseUrl,
    this.continueLearningUrl,
    this.aliasNameForUrl,
    this.ended,
    this.termId,
    this.lessonsCount,
    this.translatedCount,
    this.releaseType,
    this.videoUrl,
    this.hdVideoUrl,
    this.shdVideoUrl,
    this.videoImgUrl,
    this.activeFlag,
    this.notPublishedDraft,
    this.bought,
    this.feeValidType,
    this.deadlineTimeOfFee,
    this.periodTimeOfFee,
    this.boughtInfoDto,
    this.iosVisible,
    this.webVisible,
    this.cpVisible,
    this.tags,
    this.liveFlag,
    this.ownerType,
    this.ownerId,
    this.firstPublishTime,
    this.lastSubmtReviewTime,
    this.categoryRels,
    this.watchDuration,
    this.allCount,
    this.forumTagLector,
    this.tagLectorTime,
    this.hasCoupon,
    this.startTime,
    this.endTime,
    this.restWeek,
    this.eduIapItemDto,
    this.universalCoupon,
    this.tagIap,
    this.production,
    this.categoryNames,
    this.bayesAverageScore,
    this.scoreLevel,
    this.vipContentType,
    this.vipStarttime,
    this.vipEndtime,
    this.vipPrice,
    this.viewCount,
    this.courseType,
    this.followUp,
    this.boughtExpired,
    this.draft,
  });

  num id;
  dynamic pid;
  dynamic categoryId;
  dynamic categoryName;
  num auditStatus;
  String smallPhotoUrl;
  String bigPhotoUrl;
  num descriptionVideoId;
  String name;
  num creatorId;
  dynamic creatorNick;
  String provider;
  num providerType;
  String description;
  num gmtCreate;
  num gmtModified;
  String targetUser;
  num mark;
  num price;
  num commonDiscountPrice;
  num commonDiscountRate;
  dynamic providerPhotoUrl;
  String providerLink;
  dynamic recommend;
  dynamic recommendForQrRepo;
  dynamic weightForQrRepo;
  num commentCount;
  num learnerCount;
  dynamic lectors;
  dynamic learningProgress;
  dynamic learningLessonId;
  dynamic learningLessonName;
  dynamic learningLessonPosition;
  dynamic started;
  dynamic learningStatus;
  dynamic compatibleLearningStatus;
  String middlePhotoUrl;
  String providerDesc;
  num published;
  dynamic courseUrl;
  dynamic continueLearningUrl;
  dynamic aliasNameForUrl;
  bool ended;
  dynamic termId;
  num lessonsCount;
  dynamic translatedCount;
  num releaseType;
  dynamic videoUrl;
  dynamic hdVideoUrl;
  dynamic shdVideoUrl;
  dynamic videoImgUrl;
  num activeFlag;
  bool notPublishedDraft;
  bool bought;
  num feeValidType;
  num deadlineTimeOfFee;
  num periodTimeOfFee;
  BoughtInfoDto boughtInfoDto;
  num iosVisible;
  num webVisible;
  num cpVisible;
  dynamic tags;
  num liveFlag;
  num ownerType;
  num ownerId;
  num firstPublishTime;
  num lastSubmtReviewTime;
  dynamic categoryRels;
  num watchDuration;
  dynamic allCount;
  num forumTagLector;
  num tagLectorTime;
  bool hasCoupon;
  dynamic startTime;
  dynamic endTime;
  dynamic restWeek;
  Map<String, num> eduIapItemDto;
  dynamic universalCoupon;
  num tagIap;
  dynamic production;
  dynamic categoryNames;
  dynamic bayesAverageScore;
  dynamic scoreLevel;
  dynamic vipContentType;
  dynamic vipStarttime;
  dynamic vipEndtime;
  dynamic vipPrice;
  dynamic viewCount;
  num courseType;
  bool followUp;
  bool boughtExpired;
  bool draft;

  factory YktCourseCardv.fromJson(Map<String, dynamic> json) => YktCourseCardv(
    id: json["id"],
    pid: json["pid"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    auditStatus: json["auditStatus"],
    smallPhotoUrl: json["smallPhotoUrl"],
    bigPhotoUrl: json["bigPhotoUrl"],
    descriptionVideoId: json["descriptionVideoId"],
    name: json["name"],
    creatorId: json["creatorId"],
    creatorNick: json["creatorNick"],
    provider: json["provider"],
    providerType: json["providerType"],
    description: json["description"],
    gmtCreate: json["gmtCreate"],
    gmtModified: json["gmtModified"],
    targetUser: json["targetUser"],
    mark: json["mark"].toDouble(),
    price: json["price"].toDouble(),
    commonDiscountPrice: json["commonDiscountPrice"] == null ? null : json["commonDiscountPrice"],
    commonDiscountRate: json["commonDiscountRate"] == null ? null : json["commonDiscountRate"].toDouble(),
    providerPhotoUrl: json["providerPhotoUrl"],
    providerLink: json["providerLink"],
    recommend: json["recommend"],
    recommendForQrRepo: json["recommendForQrRepo"],
    weightForQrRepo: json["weightForQrRepo"],
    commentCount: json["commentCount"],
    learnerCount: json["learnerCount"],
    lectors: json["lectors"],
    learningProgress: json["learningProgress"],
    learningLessonId: json["learningLessonId"],
    learningLessonName: json["learningLessonName"],
    learningLessonPosition: json["learningLessonPosition"],
    started: json["started"],
    learningStatus: json["learningStatus"],
    compatibleLearningStatus: json["compatibleLearningStatus"],
    middlePhotoUrl: json["middlePhotoUrl"],
    providerDesc: json["providerDesc"],
    published: json["published"],
    courseUrl: json["courseUrl"],
    continueLearningUrl: json["continueLearningUrl"],
    aliasNameForUrl: json["aliasNameForUrl"],
    ended: json["ended"],
    termId: json["termId"],
    lessonsCount: json["lessonsCount"],
    translatedCount: json["translatedCount"],
    releaseType: json["releaseType"],
    videoUrl: json["videoUrl"],
    hdVideoUrl: json["hdVideoUrl"],
    shdVideoUrl: json["shdVideoUrl"],
    videoImgUrl: json["videoImgUrl"],
    activeFlag: json["activeFlag"],
    notPublishedDraft: json["notPublishedDraft"],
    bought: json["bought"],
    feeValidType: json["feeValidType"],
    deadlineTimeOfFee: json["deadlineTimeOfFee"],
    periodTimeOfFee: json["periodTimeOfFee"],
    boughtInfoDto: BoughtInfoDto.fromJson(json["boughtInfoDto"]),
    iosVisible: json["iosVisible"],
    webVisible: json["webVisible"],
    cpVisible: json["cpVisible"],
    tags: json["tags"],
    liveFlag: json["liveFlag"],
    ownerType: json["ownerType"],
    ownerId: json["ownerId"],
    firstPublishTime: json["firstPublishTime"],
    lastSubmtReviewTime: json["lastSubmtReviewTime"],
    categoryRels: json["categoryRels"],
    watchDuration: json["watchDuration"],
    allCount: json["allCount"],
    forumTagLector: json["forumTagLector"] == null ? null : json["forumTagLector"],
    tagLectorTime: json["tagLectorTime"] == null ? null : json["tagLectorTime"],
    hasCoupon: json["hasCoupon"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    restWeek: json["restWeek"],
    eduIapItemDto: Map.from(json["eduIapItemDto"]).map((k, v) => MapEntry<String, num>(k, v == null ? null : v.toDouble())),
    universalCoupon: json["universalCoupon"],
    tagIap: json["tagIap"],
    production: json["production"],
    categoryNames: json["categoryNames"],
    bayesAverageScore: json["bayesAverageScore"],
    scoreLevel: json["scoreLevel"],
    vipContentType: json["vipContentType"],
    vipStarttime: json["vipStarttime"],
    vipEndtime: json["vipEndtime"],
    vipPrice: json["vipPrice"],
    viewCount: json["viewCount"],
    courseType: json["courseType"],
    followUp: json["followUp"],
    boughtExpired: json["boughtExpired"],
    draft: json["draft"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pid": pid,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "auditStatus": auditStatus,
    "smallPhotoUrl": smallPhotoUrl,
    "bigPhotoUrl": bigPhotoUrl,
    "descriptionVideoId": descriptionVideoId,
    "name": name,
    "creatorId": creatorId,
    "creatorNick": creatorNick,
    "provider": provider,
    "providerType": providerType,
    "description": description,
    "gmtCreate": gmtCreate,
    "gmtModified": gmtModified,
    "targetUser": targetUser,
    "mark": mark,
    "price": price,
    "commonDiscountPrice": commonDiscountPrice == null ? null : commonDiscountPrice,
    "commonDiscountRate": commonDiscountRate == null ? null : commonDiscountRate,
    "providerPhotoUrl": providerPhotoUrl,
    "providerLink": providerLink,
    "recommend": recommend,
    "recommendForQrRepo": recommendForQrRepo,
    "weightForQrRepo": weightForQrRepo,
    "commentCount": commentCount,
    "learnerCount": learnerCount,
    "lectors": lectors,
    "learningProgress": learningProgress,
    "learningLessonId": learningLessonId,
    "learningLessonName": learningLessonName,
    "learningLessonPosition": learningLessonPosition,
    "started": started,
    "learningStatus": learningStatus,
    "compatibleLearningStatus": compatibleLearningStatus,
    "middlePhotoUrl": middlePhotoUrl,
    "providerDesc": providerDesc,
    "published": published,
    "courseUrl": courseUrl,
    "continueLearningUrl": continueLearningUrl,
    "aliasNameForUrl": aliasNameForUrl,
    "ended": ended,
    "termId": termId,
    "lessonsCount": lessonsCount,
    "translatedCount": translatedCount,
    "releaseType": releaseType,
    "videoUrl": videoUrl,
    "hdVideoUrl": hdVideoUrl,
    "shdVideoUrl": shdVideoUrl,
    "videoImgUrl": videoImgUrl,
    "activeFlag": activeFlag,
    "notPublishedDraft": notPublishedDraft,
    "bought": bought,
    "feeValidType": feeValidType,
    "deadlineTimeOfFee": deadlineTimeOfFee,
    "periodTimeOfFee": periodTimeOfFee,
    "boughtInfoDto": boughtInfoDto.toJson(),
    "iosVisible": iosVisible,
    "webVisible": webVisible,
    "cpVisible": cpVisible,
    "tags": tags,
    "liveFlag": liveFlag,
    "ownerType": ownerType,
    "ownerId": ownerId,
    "firstPublishTime": firstPublishTime,
    "lastSubmtReviewTime": lastSubmtReviewTime,
    "categoryRels": categoryRels,
    "watchDuration": watchDuration,
    "allCount": allCount,
    "forumTagLector": forumTagLector == null ? null : forumTagLector,
    "tagLectorTime": tagLectorTime == null ? null : tagLectorTime,
    "hasCoupon": hasCoupon,
    "startTime": startTime,
    "endTime": endTime,
    "restWeek": restWeek,
    "eduIapItemDto": Map.from(eduIapItemDto).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
    "universalCoupon": universalCoupon,
    "tagIap": tagIap,
    "production": production,
    "categoryNames": categoryNames,
    "bayesAverageScore": bayesAverageScore,
    "scoreLevel": scoreLevel,
    "vipContentType": vipContentType,
    "vipStarttime": vipStarttime,
    "vipEndtime": vipEndtime,
    "vipPrice": vipPrice,
    "viewCount": viewCount,
    "courseType": courseType,
    "followUp": followUp,
    "boughtExpired": boughtExpired,
    "draft": draft,
  };
}

class BoughtInfoDto {
  BoughtInfoDto({
    this.infoType,
    this.periodTimeLeft,
    this.feeValidType,
    this.deadlineTimeOfFee,
    this.periodTimeOfFee,
    this.activeFlag,
    this.watchedTime,
  });

  num infoType;
  num periodTimeLeft;
  num feeValidType;
  num deadlineTimeOfFee;
  num periodTimeOfFee;
  num activeFlag;
  dynamic watchedTime;

  factory BoughtInfoDto.fromJson(Map<String, dynamic> json) => BoughtInfoDto(
    infoType: json["infoType"],
    periodTimeLeft: json["periodTimeLeft"],
    feeValidType: json["feeValidType"],
    deadlineTimeOfFee: json["deadlineTimeOfFee"],
    periodTimeOfFee: json["periodTimeOfFee"],
    activeFlag: json["activeFlag"],
    watchedTime: json["watchedTime"],
  );

  Map<String, dynamic> toJson() => {
    "infoType": infoType,
    "periodTimeLeft": periodTimeLeft,
    "feeValidType": feeValidType,
    "deadlineTimeOfFee": deadlineTimeOfFee,
    "periodTimeOfFee": periodTimeOfFee,
    "activeFlag": activeFlag,
    "watchedTime": watchedTime,
  };
}

class SectionDtoList {
  SectionDtoList({
    this.sectionTitleImage,
    this.sectionName,
    this.sectionIndex,
    this.sectionTemplate,
    this.priceVisible,
    this.sectionVisible,
    this.wordLinkDto,
    this.elementDtoList,
  });

  String sectionTitleImage;
  String sectionName;
  num sectionIndex;
  String sectionTemplate;
  bool priceVisible;
  bool sectionVisible;
  dynamic wordLinkDto;
  List<DtoList> elementDtoList;

  factory SectionDtoList.fromJson(Map<String, dynamic> json) => SectionDtoList(
    sectionTitleImage: json["sectionTitleImage"],
    sectionName: json["sectionName"],
    sectionIndex: json["sectionIndex"],
    sectionTemplate: json["sectionTemplate"],
    priceVisible: json["priceVisible"],
    sectionVisible: json["sectionVisible"],
    wordLinkDto: json["wordLinkDto"],
    elementDtoList: List<DtoList>.from(json["elementDtoList"].map((x) => DtoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sectionTitleImage": sectionTitleImage,
    "sectionName": sectionName,
    "sectionIndex": sectionIndex,
    "sectionTemplate": sectionTemplate,
    "priceVisible": priceVisible,
    "sectionVisible": sectionVisible,
    "wordLinkDto": wordLinkDto,
    "elementDtoList": List<dynamic>.from(elementDtoList.map((x) => x.toJson())),
  };
}
