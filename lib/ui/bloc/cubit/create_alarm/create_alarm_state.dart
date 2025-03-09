part of 'create_alarm_cubit.dart';

enum FormStatus { invalid, valid, validating }

class CreateAlarmState extends Equatable {
  const CreateAlarmState({
    this.hora = const Number.pure(),
    this.minutos = const Number.pure(),
    this.segundos = const Number.pure(),
    this.nombre = const Name.pure(),
    this.sonido = "",
    this.progressive = false,
    this.activateLocation = false,
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  final Number hora;
  final Number minutos;
  final Number segundos;
  final Name nombre;
  final String sonido;
  final bool progressive;
  final bool activateLocation;

  final bool isValid;
  final FormStatus formStatus;

  CreateAlarmState copyWith({
    FormStatus? formStatus,
    Number? hora,
    Number? segundos,
    Number? minutos,
    Name? nombre,
    String? sonido,
    bool? progressive,
    bool? activateLocation,
    bool? isValid,
  }) => CreateAlarmState(
    formStatus: formStatus ?? this.formStatus,
    hora: hora ?? this.hora,
    segundos: segundos ?? this.segundos,
    minutos: minutos ?? this.minutos,
    nombre: nombre ?? this.nombre,
    sonido: sonido ?? this.sonido,
    progressive: progressive ?? this.progressive,
    activateLocation: activateLocation ?? this.activateLocation,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [
    formStatus,
    hora,
    minutos,
    segundos,
    nombre,
    sonido,
    progressive,
    activateLocation,
  ];
}
