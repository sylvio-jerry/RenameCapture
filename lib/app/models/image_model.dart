class ImageModel {
  final int? id;
  final String name;
  final String path;

  ImageModel({this.id, required this.name, required this.path});

  // Convert a ImageModel into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'path': path,
    };
  }

  // Implement toString to make it easier to see information about
  // each image when using the print statement.
  @override
  String toString() {
    return 'ImageModel{id: $id, name: $name, path: $path}';
  }
}
