import 'dart:io';

// Component Interface
abstract class FileSystemEntity {
  void showDetails([int indent = 0]);
}

// Leaf Class - File
class FileEntity implements FileSystemEntity {
  String name;

  FileEntity(this.name);

  @override
  void showDetails([int indent = 0]) {
    print('${' ' * indent}- $name');
  }
}

// Composite Class - Folder
class Folder implements FileSystemEntity {
  String name;
  List<FileSystemEntity> children = [];

  Folder(this.name);

  void add(FileSystemEntity entity) {
    children.add(entity);
  }

  @override
  void showDetails([int indent = 0]) {
    print('${' ' * indent}[Folder] $name');
    for (var child in children) {
      child.showDetails(indent + 2);
    }
  }
}

// Main function to test the Composite Pattern
void main() {
  var root = Folder('Root');
  var subFolder = Folder('SubFolder');

  root.add(FileEntity('file1.txt'));
  root.add(subFolder);
  subFolder.add(FileEntity('file2.txt'));
  subFolder.add(FileEntity('file3.txt'));

  root.showDetails();
}
