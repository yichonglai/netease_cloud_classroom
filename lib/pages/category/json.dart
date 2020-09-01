import './type.dart';

List<String> navList = [
  '特别推荐',
  '职场提升',
  '编程与开发',
  'AI/数据科学',
  '产品与运营',
  '设计创意',
  '电商运营',
  '语言学习',
  '职业考试',
  '生活兴趣',
];

List<ContentType> contentList = [
  ContentType(type: 0, pic: 'temp/post18.png'),
  ContentType(type: 0, pic: 'temp/post17.jpg'),
  ContentType(type: 1, title: '人工智能', data: ['语言数学基础', '算法基础', '应用技术', '应用领域']),
  ContentType(type: 1, title: '数据科学', data: ['数据分析', '数据挖掘', '数据基础']),
  ContentType(type: 1, title: '大数据', data: ['语言工具基础', '大数据开发', '大数据应用']),
  ContentType(type: 1, title: '区块链', data: ['全部']),
];
