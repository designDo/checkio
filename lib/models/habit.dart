import 'dart:convert';

import 'package:equatable/equatable.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
// ignore: must_be_immutable
class HabitRecord extends Equatable {
  String habitId;
  int time;
  String content;

  HabitRecord({this.time, this.content, this.habitId});

  @override
  String toString() {
    return 'HabitRecord{time: $time, content: $content, habitId: $habitId}';
  }

  HabitRecord.fromJson(Map<String, dynamic> json) {
    habitId = json['habitId']?.toString();
    time = json["time"]?.toInt();
    content = json["content"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['habitId'] = habitId;
    data["time"] = time;
    data["content"] = content;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [habitId, time, content];

  HabitRecord copyWith({String habitId, int time, String content}) {
    return HabitRecord(habitId: habitId, time: time, content: content);
  }
}

// ignore: must_be_immutable
class Habit extends Equatable {
  ///唯一id uuid v4
  String id;
  String name;
  String iconPath;
  int mainColor;
  String mark;

  ///提醒时间 每天 10: 20，eg
  ///转化为 json String 存储 ["10:20","11:50"]
  List<String> remindTimes;

  ///完成时间
  /// 0 任意 1 早上 2 上午 3 中午 4 下午 5 晚上
  int completeTime;

  ///按周时 完成的day
  /// 1-7，周一 -- 周日
  List<int> completeDays;

  ///周期
  /// 0 按天
  /// 1 按周
  /// 2 按月
  int period;

  ///创建时间
  int createTime;

  ///修改时间
  int modifyTime;

  ///是否完成
  bool completed;

  ///次数
  int doNum;

  Habit(
      {this.id,
      this.name,
      this.iconPath,
      this.mainColor,
      this.mark,
      this.remindTimes,
      this.completeDays,
      this.completeTime,
      this.period,
      this.createTime,
      this.modifyTime,
      this.completed,
      this.doNum});

  @override
  String toString() {
    return 'Habit{id: $id, name: $name, iconPath: $iconPath, mainColor: $mainColor, mark: $mark,'
        ' remindTimes: $remindTimes, completeTime: $completeTime, completeDays:$completeDays, period: $period, '
        'createTime: $createTime, modifyTime: $modifyTime, completed: $completed, doNum: $doNum,';
  }

  Habit.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    name = json["name"]?.toString();
    iconPath = json["iconPath"]?.toString();
    mainColor = json["mainColor"]?.toInt();
    mark = json["mark"]?.toString();
    if (json["remindTimes"] != null) {
      var timesJson = jsonDecode(json["remindTimes"]);
      var times = List<String>();
      timesJson.forEach((json) {
        times.add(json.toString());
      });
      remindTimes = times;
    }
    if (json["completeDays"] != null) {
      var daysJson = jsonDecode(json["completeDays"]);
      var days = List<int>();
      daysJson.forEach((json) {
        days.add(json.toInt());
      });
      completeDays = days;
    }
    completeTime = json['completeTime']?.toInt();
    period = json["period"]?.toInt();
    createTime = json["createTime"]?.toInt();
    modifyTime = json["modifyTime"]?.toInt();
    completed = json["completed"]?.toInt() == 1 ? true : false;
    doNum = json["doNum"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["iconPath"] = iconPath;
    data["mainColor"] = mainColor;
    data["mark"] = mark;
    //转化为String 存储
    if (remindTimes != null) {
      var times = remindTimes;
      var temp = List();
      times.forEach((time) {
        temp.add(time);
      });
      data["remindTimes"] = jsonEncode(temp);
    }
    if (completeDays != null) {
      var days = completeDays;
      var temp = List();
      days.forEach((day) {
        temp.add(day);
      });
      data["completeDays"] = jsonEncode(temp);
    }

    data['completeTime'] = completeTime;
    data["period"] = period;
    data["createTime"] = createTime;
    data["modifyTime"] = modifyTime;
    data["completed"] = completed ? 1 : 0;
    data["doNum"] = doNum;
    return data;
  }

  static Habit createHabit(String key) {
    return Habit(
      id: 'id__$key',
      name: 'name__$key',
      iconPath: 'assets/images/tab_1.png',
      mainColor: 122,
      mark: 'mark__$key',
      remindTimes: ['time1', 'time2'],
      period: 1,
      createTime: 1111,
      modifyTime: 0,
      completed: false,
      doNum: 0,
    );
  }

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.iconPath,
        this.mainColor,
        this.mark,
        this.remindTimes,
        this.completeDays,
        this.completeTime,
        this.period,
        this.createTime,
        this.modifyTime,
        this.completed,
        this.doNum,
      ];

  Habit copyWith({
    String id,
    String name,
    String iconPath,
    int mainColor,
    String mark,
    List<String> remindTimes,
    List<int> completeDays,
    int completeTime,
    int period,
    int createTime,
    int modifyTime,
    bool completed,
    int doNum,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      mainColor: mainColor ?? this.mainColor,
      mark: mark ?? this.mark,
      remindTimes: remindTimes ?? this.remindTimes,
      completeDays: completeDays ?? this.completeDays,
      completeTime: completeTime ?? this.completeTime,
      period: period ?? this.period,
      createTime: createTime ?? this.createTime,
      modifyTime: modifyTime ?? this.modifyTime,
      completed: completed ?? this.completed,
      doNum: doNum ?? this.doNum,
    );
  }
}
