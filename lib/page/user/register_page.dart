import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixedgpt/component/big_button.dart';
import 'package:mixedgpt/component/item_text_field.dart';
import 'package:mixedgpt/component/logo_container.dart';
import 'package:mixedgpt/component/show_message.dart';
import 'package:mixedgpt/config/color.dart';
import 'package:mixedgpt/config/index.dart';
import 'package:mixedgpt/model/person/user_model.dart';
import 'package:mixedgpt/service/http_service.dart';
import 'package:mixedgpt/utils/router_util.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController? _supplierController;
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  final FocusNode _supplierNode = FocusNode();
  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _supplierController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MColor.primaryColor,
        elevation: 0,
        title: const Text(MString.registerTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LogoContainer(),
            SizedBox(
              height: 80,
            ),
            _registerContent(context),
            MBigButton(
              text: MString.registerTitle,
              onPressed: () {
                if (_checkInput()) {
                  _register();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _registerContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          _itemTitle(MString.userTitle),
          SizedBox(
            height: 10,
          ),
          ItemTextField(
            icon: const Icon(Icons.support_agent),
            controller: _supplierController,
            focusNode: _supplierNode,
            title: MString.supplier,
            hintText: MString.pleaseInputSupplier,
          ),
          const SizedBox(
            height: 20,
          ),
          ItemTextField(
            icon: const Icon(Icons.person),
            controller: _usernameController,
            focusNode: _usernameNode,
            title: MString.userTitle,
            hintText: MString.pleaseInputUsername,
          ),
          const SizedBox(
            height: 20,
          ),
          ItemTextField(
            icon: const Icon(Icons.lock),
            controller: _passwordController,
            focusNode: _passwordNode,
            title: MString.passwordTitle,
            hintText: MString.pleaseInputPassword,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _itemTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      ),
    );
  }

  bool _checkInput() {
    if (_supplierController?.text.length == 0) {
      return false;
    }
    if (_usernameController?.text.length == 0) {
      return false;
    }
    if (_passwordController?.text.length == 0) {
      return false;
    }
    return true;
  }

  _register() async {
    var formData = {
      'username': _usernameController?.text.toString(),
      'password': _passwordController?.text.toString()
    };
    String supplier = _supplierController?.text.toString() ?? '';
    if (supplier.isEmpty) {
      return;
    }
    var response =
        await HttpService.post('$supplier/${ApiUrl.register}', param: formData);
    if (response != null) {
      UserModel model = UserModel.fromJson(response['data']); // 没有额外处理，没保存注册状态
      // print(model.username);
      RouterUtil.toMemberPage(context); //不兼容因素
      MessageWidget.show(MString.registerSuccess);
    } else {
      MessageWidget.show(MString.registerFail);
    }
  }
}
