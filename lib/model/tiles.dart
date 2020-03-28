
class Tiles{
   String id;
 String date;
  String  fixture;

  Tiles({ this.date, this.id , this.fixture});

   factory Tiles.fromJson(Map<String, dynamic> json) => Tiles(
       id: json['_id'],
       date: json['date_created'],
       fixture: json ['fixture'],

   );

 }