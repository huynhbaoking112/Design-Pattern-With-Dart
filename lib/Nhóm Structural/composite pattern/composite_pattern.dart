abstract class BaseComponent{
  size();
  summary();
}

class LeafFile implements BaseComponent{
  
  int totalSize;
  String name;
  LeafFile(this.name, this.totalSize);

  
  @override
  size() {
    print(this.totalSize.toString());
  }

  @override
  summary() {
    print(this.name);
  }

}

class FolderComposite implements BaseComponent{

  List<LeafFile> allFile;
  FolderComposite(this.allFile);
  
  @override
  size() {
    int k = 0;
    for(int i = 0; i < allFile.length; i++){
      k += allFile[i].totalSize;
    }
    print(k);
  }
  
  @override
  summary() {
    for(int i = 0; i < allFile.length; i++){
      allFile[i].summary();
    }
  }

}



main(){

  LeafFile lf1 = LeafFile('King', 12);
  LeafFile lf2 = LeafFile('King2', 20);
  LeafFile lf3 = LeafFile('King3', 32);

  FolderComposite fc = FolderComposite([lf1, lf2, lf3]);

  fc.summary();
  fc.size();

}