import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var list = [];
  int page = 0;
  bool isLoading = false; //是否正在请求新数据
  bool showMore = false; //是否显示底部加载中提示
  bool offState = false; //是否显示进入页面时的圆形进度条

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('滑动到了最底部${scrollController.position.pixels}');
        setState(() {
          showMore = true;
        });
        getMoreData();
      }
    });
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RefreshIndicator(
          child: ListView.builder(
            controller: scrollController,
            itemCount: list.length + 1, //列表长度+底部加载中提示
            itemBuilder: choiceItemWidget,
          ),
          onRefresh: _onRefresh,
        ),
        Offstage(
          offstage: offState,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    //手动停止滑动监听
    scrollController.dispose();
  }

  /// 加载哪个子组件
  Widget choiceItemWidget(BuildContext context, int position) {
    if (position < list.length) {
      return ListTile(title: list[position]);
    } else if (showMore) {
      return showMoreLoadingWidget();
    } else {
      return null;
    }
  }

  /// 加载更多提示组件
  Widget showMoreLoadingWidget() {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '加载中...',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  /// 模拟进入页面获取数据
  void getListData() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        offState = true;
        list = List.generate(20, (i) {
          return Text("ListView的一行数据$i");
        });
      });
    });
  }

  /// 模拟到底部加载更多数据
  void getMoreData() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
      page++;
    });
    print('上拉刷新开始,page = $page');
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        showMore = false;
        list.addAll(List.generate(3, (i) {
          return Text("上拉添加ListView的一行数据$i");
        }));
        print('上拉刷新结束,page = $page');
      });
    });
  }

  /// 模拟下拉刷新
  Future<void> _onRefresh() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
      page = 0;
    });

    print('下拉刷新开始,page = $page');

    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;

        List tempList = List.generate(3, (i) {
          return Text("下拉添加ListView的一行数据$i");
        });
        tempList.addAll(list);
        list = tempList;
        print('下拉刷新结束,page = $page');
      });
    });
  }
}
