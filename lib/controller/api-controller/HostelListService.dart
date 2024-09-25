
import 'dart:convert';
import 'dart:developer';


import 'package:bachelar_hostel/model/hostelListModel.dart';

import '../../database/hostelList.dart';

class HostelListService{
  static Future<List<Hostel>> hostelListService()async{
    log("+++++++++");
    try{
      HostelListModel allHostel=HostelListModel.fromJson(jsonDecode(jsonEncode(HostelList.hostelList)));
      log("${allHostel.hostel}");
      return allHostel.hostel??[];
    }
    catch(e){
      log("error:$e");
    }
    return [];

  }
}