
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:chronos_mobile/common/input/number_input.dart';
import 'package:chronos_mobile/common/input/name_input.dart';

part 'create_alarm_state.dart';

class CreateAlarmCubit extends Cubit<CreateAlarmState> {
  CreateAlarmCubit() : super(const CreateAlarmState());

  void horaChanged(int horaNueva, int minutosNuevos, int segundosNuevos) {
    final hora = Number.dirty(horaNueva);
    final minutos = Number.dirty(minutosNuevos);
    final segundos = Number.dirty(segundosNuevos);

    emit(
      state.copyWith(
        hora: hora,
        isValid: Formz.validate([hora, minutos, segundos, state.nombre]),
      ),
    );
  }

  void minutosChanged(int value) {
    final minutos = Number.dirty(value);
    emit(
      state.copyWith(
        minutos: minutos,
        isValid: Formz.validate([
          state.hora,
          minutos,
          state.segundos,
          state.nombre,
        ]),
      ),
    );
  }

  void segundosChanged(int value) {
    final segundos = Number.dirty(value);
    emit(
      state.copyWith(
        segundos: segundos,
        isValid: Formz.validate([
          state.hora,
          state.minutos,
          segundos,
          state.nombre,
        ]),
      ),
    );
  }

  void nombreChanged(String value) {
    final nombre = Name.dirty(value);
    emit(
      state.copyWith(
        nombre: nombre,
        isValid: Formz.validate([
          state.hora,
          state.minutos,
          state.segundos,
          nombre,
        ]),
      ),
    );
    print(state);
  }

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        hora: Number.dirty(state.hora.value),
        minutos: Number.dirty(state.minutos.value),
        segundos: Number.dirty(state.segundos.value),
        nombre: Name.dirty(state.nombre.value),
        sonido: state.sonido,
        progressive: state.progressive,
        activateLocation: state.activateLocation,
        isValid: Formz.validate([
          state.hora,
          state.minutos,
          state.segundos,
          state.nombre,
        ]),
      ),
    );
    print(state);
  }
}
