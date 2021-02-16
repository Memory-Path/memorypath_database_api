import 'MemoryPoint.dart';

class MemoryPath {
  final int id;
  final String name;
  final String topic;
  final List<MemoryPoint> memoryPoints;

  MemoryPath({this.id, this.name, this.topic, this.memoryPoints});

  //Named-Constructor: From Map
  MemoryPath.fromMap(Map<String,dynamic> memoryPath, List<MemoryPoint> memoryPoints) :
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