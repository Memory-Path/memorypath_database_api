import 'MemoryPointDb.dart';

class MemoryPathDb {
  final int id;
  final String name;
  final String topic;
  final List<MemoryPointDb> memoryPoints;

  MemoryPathDb({this.id, this.name, this.topic, this.memoryPoints});

  //Named-Constructor: From Map
  MemoryPathDb.fromMap(Map<String,dynamic> memoryPath, List<MemoryPointDb> memoryPoints) :
        id =  memoryPath['id'],
        name =  memoryPath['name'],
        topic = memoryPath['topic'],
        memoryPoints = memoryPoints;



    Map<String,dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'topic': topic,
    };
  }


}