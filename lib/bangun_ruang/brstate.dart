part of 'brcubit.dart';


abstract class BangunRuangState {}

class BangunRuangInitial extends BangunRuangState {}

class BangunRuangCalculated extends BangunRuangState {
  final double volume;
  BangunRuangCalculated(this.volume);
}