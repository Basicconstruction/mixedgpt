class DataCenter{
  static MyDataCenter? _instance;
  static MyDataCenter? getInstance(){
    _instance ??= MyDataCenter();
    return _instance;
  }
}

class MyDataCenter {
}