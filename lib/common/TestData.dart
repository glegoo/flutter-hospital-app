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
}
