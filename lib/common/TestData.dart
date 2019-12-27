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

  static String userName = '吴自有';
  static int userAge = 37;
  static int userSex = 1;
  static var familyName = '邓美妹';
  static var userPhone = 13011234567;
  static String userID = '210309********1113';
  static String userHospitalId = 'NO3.141592653589';
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
  static var paymentInfos = [
    {
      'type': 'time',
      'time': DateTime(2019, 6, 1),
      'count': 1,
    },
    {
      'type': 'unuse',
      'time': DateTime(2019, 6, 1, 11, 22),
      'count': 1,
    },
    {
      'type': 'used',
      'time': DateTime(2019, 3, 5, 10, 11),
      'count': 1,
    },
  ];
  static var reports = [
    {
      'type': 'time',
      'time': DateTime(2019, 6, 1),
      'count': 2,
    },
    {
      'type': 'unuse',
      'time': DateTime(2019, 6, 1, 11, 22),
      'count': 1,
      'text': '血常规报告',
      'reportId': 1,
    },
    {
      'type': 'unuse',
      'time': DateTime(2019, 6, 1, 11, 41),
      'count': 1,
      'text': 'CT影片和报告',
      'reportId': 2,
    },
    {
      'type': 'used',
      'time': DateTime(2019, 3, 5, 12, 27),
      'count': 2,
    },
  ];
  static String version = 'v1.05';
  static String aboutText =
      '      沈阳市第零人民医院即沈阳未命名医院，始建于1977年，是沈阳城区东部区域性医疗服务中心。是以神经科为龙头、多科系协调发展的大型三级综合医院，神经内科是市临床重点专科和市特色专科。作为沈阳市属医院中唯一一家国家级脑卒中筛查与防治基地。  医院建筑面积达10万余平方米，编制床位1150张。';
  static String bingCardTip = '''1. 本过程是确定您通过哪一种方式进行就诊。

2. 选择身份证时，直接带身份证就诊即可。

3. 选择就医卡时，需要添加病历号和手机号。病历号为发票上以M开头共10位的字母数字组合；手机号位办卡时在窗口或者自助机上留存的手机号码。挂号成功后，携带该就医卡就诊即可。

4. 如果您忘记携带挂号时使用的就医卡，建议到门诊自助机进行预约补卡或咨询人工窗口。''';
  static String reportTip = '''查看报告注意事项：
1. 请确保进行了绑卡操作，具体操作步骤：

点击【我的】＞【绑定就诊卡】＞选择就诊人＞填写发票左上角的病历号（需要新的病历号）＞点击【更新】

2. 请确保姓名，手机号以及身份证号填写正确并且与医院预留信息一致。''';
  static String orderId = 'NO321226633';
  static String orderOffice = '耳鼻喉科';
  static double orderFee = 133.06;
  static String orderDetail = '''缴费项目明细：

1.  挂号费： 12元
2.  清热解毒软胶囊 1盒  33.06元
3. 甲帕依固龈液 2瓶  88元

''';
}
