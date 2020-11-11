class FunctionList {
  final String name;
  final String image;
  final String pageName;

  FunctionList(this.name, this.image, this.pageName);
}

List<FunctionList> functions = functionsData
    .map((item) => FunctionList(item['name'], item['image'], item['pageName']))
    .toList();

var functionsData = [
  {"name": "Schedule", 'image': "assets/images/exam.jpeg", 'pageName': "SchedulePage"},
  {"name": "Articles", 'image': "assets/images/articles.jpeg", 'pageName': "ArticlesPage"},
  {"name": "Revision", 'image': "assets/images/revision.jpeg", 'pageName': "RevisionPage"},
  {"name": "Camps", 'image': "assets/images/campfire.jpg", 'pageName': "CampsPage"},
];