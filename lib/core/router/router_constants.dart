class RouteInfo {
  final String path;
  final String name;

  const RouteInfo({required this.path, required this.name});
}

class Routes {
  Routes._();
  static const signIn = RouteInfo(path: '/sign_in', name: 'sign_in');
  static const home = RouteInfo(path: '/', name: 'home');
  static const signUp = RouteInfo(path: '/sign_up', name: 'sign_up');
  static const emailSent = RouteInfo(path: '/email_sent', name: 'email_sent');
  static const room = RouteInfo(path: '/room:room_code', name: 'room');
}
