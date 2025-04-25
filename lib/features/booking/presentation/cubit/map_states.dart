import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapStates extends Equatable {}

class MapLoadedState extends MapStates {
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  MapLoadedState({required this.markers, required this.polylines});

  MapLoadedState copyWith({
    Set<Marker>? markers,
    Set<Polyline>? polylines,
  }) {
    return MapLoadedState(
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
    );
  }

  @override
  List<Object?> get props => [markers, polylines];
}

class InitialMapState extends MapStates {
  @override
  List<Object?> get props => [];
}

class CounterState extends MapStates {
  final int count;
  CounterState(this.count);
  @override
  List<Object?> get props => [count];
}

class SelectedTwoLocationsState extends MapStates {
  @override
  List<Object?> get props => [];
}
