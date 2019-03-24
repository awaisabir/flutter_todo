import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  String description;
  DateTime date;


  Todo({this.description, this.title, this.date}) {
    this.id = new Uuid().v4();
  }

  String getId() { return this.id; }
  String getTitle() { return this.title; }
  String getDescription() { return this.description; }
  String getDate() { 
    return "${this.date.day.toString()}/${this.date.month.toString()}/${this.date.year.toString()}";
  }

  void setTitle(String title) { this.title = title; }
  void setDescription(String description) { this.description = description; }
  void setDate(DateTime date) { this.date = date; }
}