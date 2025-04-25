import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:glide/features/booking/presentation/cubit/booking_states.dart';
import 'package:glide/features/booking/presentation/cubit/map_cubit.dart';
import 'package:glide/features/booking/presentation/cubit/map_states.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final Key _mapKey = UniqueKey();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.993347833906675, 31.270195841789242),
    zoom: 14.4746,
  );

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  bool canAddMarker = true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cubit = context.read<MapCubit>();
    return BlocListener<MapCubit, MapStates>(
      listener: (context, state) {
        if (state is MapLoadedState) {
          setState(() {
            _markers = state.markers;
            _polylines = state.polylines;
          });
        }
      },
      child: BlocListener<BookingCubit, BookingStates>(
        listener: (context, state) {
          if (state is RideStatusSuccessState) {
            canAddMarker = false;
          }
        },
        child: GoogleMap(
          key: _mapKey,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          markers: _markers,
          polylines: _polylines,
          onTap: (position) {
            if (canAddMarker) {
              cubit.addMarker(position);
            }
          },
        ),
      ),
    );
  }
}
