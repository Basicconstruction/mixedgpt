///聊天信息数据模型，标识对话中用户或系统的信息
///
class ChatModel {
  int id;
  String role;
  String prompt;

  ChatModel({required this.id, required this.role, required this.prompt});

  ChatModel.user(int id, String prompt)
      : this(id: id, role: 'user', prompt: prompt);

  ChatModel.system(int id, String prompt)
      : this(id: id, role: 'system', prompt: prompt);

  ChatModel.assistant(int id, String prompt)
      : this(id: id, role: 'assistant', prompt: prompt);

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': prompt,
    };
  }

  Map<String, dynamic> toStorageJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['role'] = role;
    data['prompt'] = prompt;
    return data;
  }

  factory ChatModel.fromStorageJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      role: json['role'],
      prompt: json['prompt'],
    );
  }

  @override
  String toString() {
    return 'ChatModel{id: $id, role: $role, prompt: $prompt}';
  }
}
