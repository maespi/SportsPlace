
library sports_place.AppData;
//The use of this file is to be used as a database
var accounts = {};
var profiles = {};

class User {
  final String Name;
  final String Email;
  final String About;

  User(this.Name, this.Email, this.About);
}