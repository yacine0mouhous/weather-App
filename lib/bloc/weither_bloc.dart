import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
part 'weither_event.dart';
part 'weither_state.dart';

class WeitherBloc extends Bloc<WeitherEvent, WeitherState> {
  WeitherBloc() : super(WeitherInitial()) {
    on<fetchweither>((event, emit) async {
      emit(WeitherblocloadingState());
      try {
        WeatherFactory wf = WeatherFactory('ab461ce164ce8d81868b27142a83799b',
            language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeitherBlocSucces(weather));
      } catch (e) {
        emit(WeitherBlocFailureState());
      }
    });
  }
}
