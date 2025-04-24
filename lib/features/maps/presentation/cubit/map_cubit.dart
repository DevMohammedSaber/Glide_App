import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/core/networking/app_apis.dart';
import 'package:glide/features/maps/presentation/widgets/custom_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:glide/features/maps/presentation/cubit/map_states.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapState(markers: const {}, polylines: const {}));

  void counterIncrementDecrement(int value) {
    emit(CounterState(value + 1));
  }

  final List<LatLng> _selectedPoints = [];

  void addMarker(LatLng position) async {
    if (_selectedPoints.length == 2) _selectedPoints.clear();

    _selectedPoints.add(position);

    Set<Marker> newMarkers = {};

    for (var i = 0; i < _selectedPoints.length; i++) {
      final bytes = await CustomMarkerWidget(label: String.fromCharCode(65 + i))
          .toBitmapDescriptor(
        logicalSize: const Size(80, 100),
        imageSize: const Size(160, 200),
      );

      final marker = Marker(
        markerId: MarkerId('point$i'),
        position: _selectedPoints[i],
        icon: bytes,
      );

      newMarkers.add(marker);
    }

    if (_selectedPoints.length == 2) {
      final polyline = await _createPolyline();
      emit(MapState(markers: newMarkers, polylines: {polyline}));
    } else {
      emit(MapState(markers: newMarkers, polylines: const {}));
    }
  }

  Future<Polyline> _createPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(
            _selectedPoints[0].latitude, _selectedPoints[0].longitude),
        destination: PointLatLng(
            _selectedPoints[1].latitude, _selectedPoints[1].longitude),
        mode: TravelMode.driving,
      ),
      googleApiKey: AppApis.googleKey,
    );

    final points =
        result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();

    return Polyline(
      polylineId: const PolylineId('route'),
      color: const Color(0xFF00C9A7),
      width: 6,
      points: points,
    );
  }
}
