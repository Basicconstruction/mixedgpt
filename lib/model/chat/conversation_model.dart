import 'package:mixedgpt/model/chat/chat_model.dart';

///
/// 对话数据模型
class ConversationModel {
  int id;
  List<ChatModel> chatList;

  ConversationModel({required this.id, required this.chatList});

  bool addChat(ChatModel chatModel) {
    chatList.add(chatModel);
    return true;
  }

  bool removeByChatId(int id) {
    chatList.removeWhere((element) => element.id == id);
    return true;
  }

  /// 把列表转化为 json列表
  List<Map<String, dynamic>> chatModelsToJson(List<ChatModel> chatModels) {
    List<Map<String, dynamic>> result = [];
    for (var chatModel in chatModels) {
      result.add(chatModel.toJson());
    }
    return result;
  }

  /// 存储序列化
  Map<String, dynamic> toStorageJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chatList'] = chatList.map((e) => e.toJson()).toList();
    return data;
  }

  /// 存储反序列化
  factory ConversationModel.fromStorageJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'],
      chatList: List<ChatModel>.from(
          json['chatList'].map((x) => ChatModel.fromStorageJson(x))),
    );
  }

  /// 请求可用的 message解构
  Map<String, dynamic> conversationToJson(List<ChatModel> chatModels) {
    return {'message': chatModelsToJson(chatModels)};
  }
}
