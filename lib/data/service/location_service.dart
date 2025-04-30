import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // El servicio de ubicación no está habilitado, solicitar al usuario que lo active
      await Geolocator.openLocationSettings();
      return null;
    }

    // Verificar permisos de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permiso denegado
        return null;
      }
    }

    // Si el permiso está permanentemente denegado, necesitamos dirigir al usuario a los ajustes
    if (permission == LocationPermission.deniedForever) {
      // No se pueden solicitar permisos, dirigir al usuario a los ajustes
      return null;
    }

    // Obtener ubicación actual
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      print('Error al obtener la ubicación: $e');
      return null;
    }
  }
}