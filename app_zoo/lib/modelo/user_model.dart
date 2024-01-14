class User{
  @override
  final int? id;
  final String nombre;
  final String password;
  final String mail;
  
  const User({
    this.id,
    required this.nombre,
    required this.password,
    required this.mail,
  });
}