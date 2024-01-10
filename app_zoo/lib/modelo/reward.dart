class Reward{
  int points;
  String imagePath;
  bool _claim = false; 

  Reward({required this.points,required this.imagePath});

  void claimReward(){
    _claim = true;
  }

  bool isAvailable(){
    return _claim == false;
  }
}