import 'dart:convert';
import 'package:flutter/material.dart';

import '../../database/hostelInfo.dart';
import '../../model/hostelInfoModel.dart';
class HostelInfoService {
  static Future<List<Hostel>> hostelInfoService({required String id}) async {
    try {
     HostelInfoModel descriptionModel = HostelInfoModel.fromJson(jsonDecode(jsonEncode(HostelInfoData.hostelInfoData)));
      return descriptionModel.hostel??[];
    } catch (e) {
      debugPrint("Error : $e");
    }
    return [];
  }
}
