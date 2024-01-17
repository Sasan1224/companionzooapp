
class Reward{
  
  final int points;
  final String imagePath;
  bool claimed; 

  Reward({required this.points,required this.imagePath, this.claimed=false});

  void claimReward(){
    claimed = true;
  }

  bool isAvailable(){
    return claimed == false;
  }

  
}