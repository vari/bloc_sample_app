import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class LEDState extends Equatable {
  const LEDState();

  @override
  List<Object> get props => [];
}

class LEDEmpty extends LEDState {}
class LEDLoading extends LEDState {}
class LEDLoaded extends LEDState {}
class LEDLoadFailed extends LEDState {
  final String errorMsg;

  const LEDLoadFailed({@required this.errorMsg}) : assert(errorMsg != null);

  @override
  List<Object> get props => [errorMsg];
}

