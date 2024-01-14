
class Reward{
  
  @override
  final int? id;
  final int points;
  final String imagePath;
  bool claimed; 

  Reward({this.id, required this.points,required this.imagePath, this.claimed=false});

  void claimReward(){
    claimed = true;
  }

  bool isAvailable(){
    return claimed == false;
  }

  
}