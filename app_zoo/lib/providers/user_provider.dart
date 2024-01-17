import 'package:app_zoo/modelo/user_model.dart';

class _UserProvider{

  final List<User> _usuarios=[];

  bool exist({required String mail}){
    bool exist = false;

    if(_usuarios.isNotEmpty){
      for(User user in _usuarios){
        if(user.mail==mail){
          exist = true;
          break;
        }
      }
    }

    return exist;
  }

  User? selectUserFromCredentials({required String mail, required String password}){

    if(_usuarios.isNotEmpty){
      for(User user in _usuarios){
        if(user.mail==mail && user.password == password){
          return user;
        }
      }
    }

    return null;
  }

  void insert(User user){
    _usuarios.add(user);
  }
}

final userProvider = _UserProvider();