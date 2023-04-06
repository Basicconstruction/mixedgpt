import 'dart:convert';
import 'package:mixedgpt/model/chat/conversation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConversationManager {
  List<ConversationModel> conversations;

  ConversationManager(this.conversations);

  /// 生成对话管理
  static Future<ConversationManager?> generate() async {
    List<ConversationModel>? model = await loadConversation();
    if (model == null) {
      return ConversationManager([]);
    } else {
      return ConversationManager(model);
    }
  }

  /// 从Share_preferences中读取所有的对话
  static Future<List<ConversationModel>?> loadConversation() async {
    final prefs = await SharedPreferences.getInstance();
    String? conversationBody = await prefs.getString('conversationIds');
    if (conversationBody == null) {
      return null;
    }
    List<int> conversationIds = (jsonDecode(
        conversationBody))['conversationList'];
    List<ConversationModel> models = [];
    for (var element in conversationIds) {
      ConversationModel? model = await getConversation('conversation$element');
      if (model != null) {
        models.add(model);
      }
    }
    return models;
  }

  /// 存储所有的对话
  static Future<bool> saveAllConversation(
      List<ConversationModel> conversations) async {
    final prefs = await SharedPreferences.getInstance();
    List<int> conversationIds =
    conversations.map((conversation) => conversation.id).toList();
    final conversationIdList =
    jsonEncode({'conversationList': conversationIds});
    bool fx = await prefs.setString('conversationIds', conversationIdList);
    await Future.wait(conversations
        .map((e) async => {await saveConversation('conversation${e.id}', e)}));
    return fx;
  }

  static Future<bool> saveConversation(String conversationKey,
      ConversationModel conversation) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(conversation.toStorageJson());
    return prefs.setString(conversationKey, jsonString);
  }

  static Future<ConversationModel?> getConversation(
      String conversationKey) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(conversationKey);
    if (jsonString != null) {
      return ConversationModel.fromStorageJson(jsonDecode(jsonString));
    } else {
      return null;
    }
  }
}
