class Task {
  String title;
  int number;
  var userSelectedValue;

  Task({this.title, this.number});
}

List<Task> tasks = [
  Task(title: 'Enter Weight', number: 1),
  Task(title: 'Eat Right', number: 2),
  Task(title: 'Meditation', number: 3),
  Task(title: 'Exercise', number: 4),
  Task(title: 'Introspection', number: 5),
];
