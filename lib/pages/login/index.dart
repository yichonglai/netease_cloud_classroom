import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/widgets/my_icons.dart';
import 'package:netease_cloud_classroom/http/dio.dart';
import 'package:netease_cloud_classroom/http/type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netease_cloud_classroom/router.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import './type.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  TextEditingController _userNameController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = ''; //用户名
  String _username = ''; //密码
  bool _isShowPwd = false; //是否显示密码
  bool _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    _userNameController.addListener(() {
      _isShowClear = _userNameController.text.length > 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  /// 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      _focusNodeUserName.unfocus();
    }
  }

  /// 验证用户名
  String validateUserName(value) {
    if (value.isEmpty) {
      return '用户名不能为空!';
    }
    return null;
  }
  /// 验证密码
  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空！';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确！';
    }
    return null;
  }

  /// 登录
  void login() async {
    _focusNodePassWord.unfocus();
    _focusNodeUserName.unfocus();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final res = await Http().post(url: '/user/signIn', data: {"userName": _username, "password": _password, "jwt": true});
        final String token = Token.fromJson(res.data).token;
        final prefs = await SharedPreferences.getInstance();
        final setTokenResult = await prefs.setString('user_token', token);
        if (setTokenResult) {
          Navigator.pushNamed(context, Router.homePage);
        }
      } catch(e) {
        Fluttertoast.showToast(
          msg: e.message,
          gravity: ToastGravity.CENTER,
          textColor: Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(),
        child: GestureDetector(
          onTap: () {
            _focusNodePassWord.unfocus();
            _focusNodeUserName.unfocus();
          },
          child: new ListView(
            children: <Widget>[
              SizedBox(height: 80),
              Container(
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 70),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _userNameController,
                        focusNode: _focusNodeUserName,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "请输入用户名",
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: (_isShowClear)
                              ? IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    _userNameController.clear();
                                  },
                                )
                              : null,
                        ),
                        validator: validateUserName,
                        onSaved: (String value) {
                          _username = value;
                        },
                      ),
                      TextFormField(
                        focusNode: _focusNodePassWord,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "请输入密码",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon((_isShowPwd)
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  _isShowPwd = !_isShowPwd;
                                },
                              );
                            },
                          ),
                        ),
                        obscureText: !_isShowPwd,
                        validator: validatePassWord,
                        onSaved: (String value) {
                          _password = value;
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 45.0,
                child: new RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: login
                ),
              ),
              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        Text('第三方登录'),
                        Container(
                          width: 80,
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    new SizedBox(height: 18),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          color: Colors.green[200],
                          icon: Icon(MyIcons.QQ),
                          iconSize: 40.0,
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Colors.green[200],
                          icon: Icon(MyIcons.wechat),
                          iconSize: 40.0,
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Colors.green[200],
                          icon: Icon(MyIcons.facebook),
                          iconSize: 40.0,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "忘记密码?",
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 16.0,
                        ),
                      ),
                      //忘记密码按钮，点击执行事件
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text(
                        "快速注册",
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 16.0,
                        ),
                      ),
                      //点击快速注册、执行事件
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
