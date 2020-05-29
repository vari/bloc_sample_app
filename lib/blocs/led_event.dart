import 'package:equatable/equatable.dart';

abstract class LEDEvent extends Equatable {
  const LEDEvent();

  @override
  List<Object> get props => [];
}

class GetLEDData extends LEDEvent {}