class PromptModel {
  int id;
  String name;
  String description;
  String content;

  PromptModel(this.id, this.name, this.description, this.content);

  @override
  String toString() {
    return 'PromptModel{id: $id, name: $name, description: $description, content: $content}';
  }
}
