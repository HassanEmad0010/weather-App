abstract class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherGetState extends WeatherState {}

class WeatherFailedState extends WeatherState {}
