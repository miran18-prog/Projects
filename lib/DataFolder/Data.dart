class ListOf {
  String first_name;
  String last_name;
  ListOf({required this.first_name, required this.last_name});
}

List<ListOf> listOfStudents = [
  ListOf(first_name: "test", last_name: "test"),
  ListOf(first_name: "test1", last_name: "test2"),
  ListOf(first_name: "test3", last_name: "test3"),
];
