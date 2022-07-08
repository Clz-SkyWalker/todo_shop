import 'package:flutter/material.dart';

import '../manager/export_normal_manager.dart';

/// 时间格式化枚举
enum FormatDateTime {
  yyyyMmDd,
  yyyyMm,
}

class UtilTime {
  /// 获取本周七天的日期
  static List<DateTime> getWeekDate(DateTime date) {
    var weekday = formatDateTime(FormatDateTime.yyyyMmDd,
        date.subtract(Duration(days: date.weekday - 1)));
    final result = <DateTime>[];
    for (var i = 0; i < 7; i++) {
      result.add(weekday);
      weekday = weekday.add(const Duration(days: 1));
    }
    return result;
  }

  /// 获取本月40天，不足的话获取上下月最近的天数补齐
  static List<DateTime> get35Day(DateTime date) {
    final result = <DateTime>[];
    var firstDay = formatDateTime(FormatDateTime.yyyyMmDd,
        date.subtract(Duration(days: date.day)).add(const Duration(days: 1)));
    final monthTotalDay =
        DateUtils.getDaysInMonth(firstDay.year, firstDay.month);

    // 补全第一周上个月的几天
    if (firstDay.weekday != DateTime.monday) {
      final preWeek = getWeekDate(firstDay);
      for (final value in preWeek) {
        if (value.isBefore(firstDay)) {
          result.add(value);
          continue;
        }
        break;
      }
    }

    // 添加当月全部天数
    result.add(firstDay);
    for (var i = 0; i < monthTotalDay - 1; i++) {
      firstDay = firstDay.add(const Duration(days: 1));
      result.add(firstDay);
    }

    // 补全下月全部天数
    if (firstDay.weekday != DateTime.sunday) {
      final nextWeek = getWeekDate(firstDay);
      for (final value in nextWeek) {
        if (value.isAfter(firstDay)) {
          result.add(value);
        }
      }
    }
    return result;
  }

  /// 格式化日期对象
  static DateTime formatDateTime(FormatDateTime format, DateTime date) {
    switch (format) {
      case FormatDateTime.yyyyMmDd:
        return DateTime(date.year, date.month, date.day);
      case FormatDateTime.yyyyMm:
        return DateTime(date.year,date.month,1);
    }
  }

  /// 根据周几转文字，支持翻译
  static String weekToString(int week) {
    switch (week) {
      case DateTime.monday:
        return S.current.monday;
      case DateTime.tuesday:
        return S.current.tuesday;
      case DateTime.wednesday:
        return S.current.wednesday;
      case DateTime.thursday:
        return S.current.thursday;
      case DateTime.friday:
        return S.current.friday;
      case DateTime.saturday:
        return S.current.saturday;
      case DateTime.sunday:
        return S.current.sunday;
      default:
        return '';
    }
  }

  /// 获取 dateTime 该月份左右几个月
  static List<DateTime> getNextAndPreDate(
      DateTime dateTime, int pre, int next) {
    final result = <DateTime>[];
    dateTime = formatDateTime(FormatDateTime.yyyyMmDd, dateTime);
    result.add(dateTime);
    for (var i = 1; i <= pre; i++) {
      final preDt = DateUtils.addMonthsToMonthDate(dateTime, -i);
      result.add(preDt);
    }

    for (var i = 1; i <= next; i++) {
      final preDt = DateUtils.addMonthsToMonthDate(dateTime, i);
      result.add(preDt);
    }
    return result;
  }
}
