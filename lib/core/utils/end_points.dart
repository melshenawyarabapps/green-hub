
class EndPoints {

  static EndPoints? _instance ;
  static EndPoints get instance => _instance ??= EndPoints._();
  EndPoints._();
  final String gold = '/gold-prices';
  final String bullion = '/bullion-prices';
  final String currencies = '/currencies';


}
