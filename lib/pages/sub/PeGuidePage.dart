import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';

class PeGuidePage extends StatefulWidget {
  PeGuidePageState createState() => new PeGuidePageState();
}

class PeGuidePageState extends State<PeGuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('体检简介'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            '体检中心简介',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            GlobalConfig.appName + '体检中心简介',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '''        中国医科大学附属盛京医院体检中心成立于2003年。本 中心拥有四层独立大楼，建筑面积约1.2万平方米，设有内 科、外科、妇科、五官科、心电图、超声、颅内多普勒、 放射线（DR、CT、MRI、PET-CT)等多间功能检查室。
        中心拥有相对独立的体检系统，由多名资深专家提供健康 评估、健康咨询、健康宣教、健康干预、健康跟踪等服 务，并根据年龄、职业、性别、身体状况、经济基础等不 同情况，设计了各种体检套餐，以方便受检者的选择。
        中心流程设计合理，环境优雅舒适，依托盛京医院雄厚 的医疗技术、先进的诊疗设备、优秀的医护团队和完善的 信息化网络系统，为广大受检者提供了快速、准确、可靠 的检查结果和健康保障，以及高效的后续服务和永久的健 康档案，搭建了一个优质的健康服务平台。
        多年来，盛京医院体检中心一直秉持"科技管理健康，爱 心呵护生命”的管理理念，得到了社会各界的广泛认可。目 則，已接待体检人数十余万人次，与700余家大中型单fii建 立了长期的合作关系，有效的为广大体检客户完成了科学 的健康管理与服务。''',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            height: 20,
          ),
          Text(
            '体检中心联系方式',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            GlobalConfig.appName + '体检中心',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '''检前预约电话：96615-66711，66712，66713 检后咨询电话：96615…66716 团体预约电话：96615-66718，66720 E-mail:tjzx@sj-hospital.org# wlb@sj-hospital.org 传真：（024) 96615…66718 邮编：110023
地址：沈阳市铁西区滑翔路39号（中国医大盛京医院滑翔 院区5号楼体检中心）
乘车路线：乘278、266、117、165、258、203、269、 123路公共汽车至盛京医院（滑翔院区）车站下车即是。''',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
