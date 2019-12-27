class TestData {
  static var messages = [
    {
      'time': DateTime(2019, 6, 1, 14, 12),
      'text': '您有2份体检报告，请前往2楼2016诊室请医生验看。',
      'type': 'pe'
    },
    {
      'time': DateTime(2019, 6, 1, 15, 1),
      'text': '您有1份处方，3种药品，请就近交费后前往1楼左侧药局取药。',
      'type': 'medicine'
    },
  ];

  static var userName = '吴自有';
  static var familyName = '邓美妹';
  static var userPhone = 13011234567;
  static var registerInfos = [
    {
      'type': 'time',
      'time': DateTime(2019, 6, 1),
    },
    {
      'type': 'unuse',
      'time': DateTime(2019, 6, 1, 11, 22),
      'text': '已挂号耳鼻喉科专家号，请到3楼东侧3003室分诊台就诊。'
    },
    {
      'type': 'used',
      'time': DateTime(2019, 3, 5, 10, 11),
      'text': '曾挂号耳鼻喉科专家号，并于当日就诊。'
    },
  ];
  static String version = 'v1.05';
  static String aboutText =
      '      沈阳市第零人民医院即沈阳未命名医院，始建于1977年，是沈阳城区东部区域性医疗服务中心。是以神经科为龙头、多科系协调发展的大型三级综合医院，神经内科是市临床重点专科和市特色专科。作为沈阳市属医院中唯一一家国家级脑卒中筛查与防治基地。  医院建筑面积达10万余平方米，编制床位1150张。';
}
