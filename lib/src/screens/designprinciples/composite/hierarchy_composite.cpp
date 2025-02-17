#include <iostream>
#include <vector>
#include <memory>

// Component Interface
class FileSystemEntity {
public:
    virtual void showDetails(int indent = 0) const = 0;
    virtual ~FileSystemEntity() = default;
};

// Leaf Class - File
class File : public FileSystemEntity {
    std::string name;
public:
    File(const std::string& name) : name(name) {}
    void showDetails(int indent = 0) const override {
        std::cout << std::string(indent, ' ') << "- " << name << "\n";
    }
};

// Composite Class - Folder
class Folder : public FileSystemEntity {
    std::string name;
    std::vector<std::shared_ptr<FileSystemEntity>> children;
public:
    Folder(const std::string& name) : name(name) {}

    void add(const std::shared_ptr<FileSystemEntity>& entity) {
        children.push_back(entity);
    }

    void showDetails(int indent = 0) const override {
        std::cout << std::string(indent, ' ') << "[Folder] " << name << "\n";
        for (const auto& child : children) {
            child->showDetails(indent + 2);
        }
    }
};

int main() {
    auto root = std::make_shared<Folder>("Root");
    auto subFolder = std::make_shared<Folder>("SubFolder");

    root->add(std::make_shared<File>("file1.txt"));
    root->add(subFolder);
    subFolder->add(std::make_shared<File>("file2.txt"));
    subFolder->add(std::make_shared<File>("file3.txt"));

    root->showDetails();
    return 0;
}
