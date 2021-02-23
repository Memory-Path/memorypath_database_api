class MemoryPointDb {

  final int id;
  final String image;
  final String question;
  final String answer;
  final double lat;
  final double long;

  MemoryPointDb({this.id, this.image, this.question, this.answer, this.lat, this.long});

  //Named-Constructor: From Map
  MemoryPointDb.fromMap(Map<String,dynamic> memoryPoint) :
        id =  memoryPoint['id'],
        image =  memoryPoint['image'],
        question = memoryPoint['question'],
        answer = memoryPoint['answer'],
        lat = memoryPoint['lat'],
        long = memoryPoint['long'];


  Map<String,dynamic> toMap(int memoryPathId){
    return {
      'id': id,
      'image': image,
      'question': question,
      'answer': answer,
      'lat': lat,
      'long': long,
      'memorypathid': memoryPathId
    };
  }
}