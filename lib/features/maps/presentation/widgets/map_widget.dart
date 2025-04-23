import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/maps/presentation/cubit/map_cubit.dart';
import 'package:glide/features/maps/presentation/cubit/map_states.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.993347833906675, 31.270195841789242),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit(),
      child: BlocBuilder<MapCubit, MapStates>(
        builder: (context, state) {
          if (state is MapState) {
            return GoogleMap(
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
              markers: state.markers,
              polylines: state.polylines,
              
              onTap: (position) {
                context.read<MapCubit>().addMarker(position);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
