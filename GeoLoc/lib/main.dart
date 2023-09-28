import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Geolocalização',
      debugShowCheckedModeBanner: false,
      home: LocationPage(),
    );
  }
}

class LocationPage extends StatefulWidget{
  @override
State<StatefulWidget> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage>{
  String? _currentAddress;
  Position? _currentPosition;

  // criar uma classe para gerenciar as permissões
  Future<bool> _handleLocationPermission() async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Serviço de localização desabilitado, Habilite-o'),
      ));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Permissão Negada'),
        ));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Permissão Negada e voce nao pode requisitar essa permissão'),
      ));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async{
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high)
      .then( (Position position) {
        setState(() {
          _currentPosition = position;
        });
        _getAddressFromLatLng(_currentPosition!);
      }
    ).catchError((e){
      debugPrint(e);
    });

  }

  Future<void>_getAddressFromLatLng(Position position) async{
    await placemarkFromCoordinates(
      _currentPosition!.latitude,
      _currentPosition!.longitude)
        .then( (List<Placemark> placemarks) {
          Placemark place = placemarks[0];
          setState(() {
            _currentAddress =
                '${place.street}, ${place.subLocality}, '+
                    '${place.subAdministrativeArea}, ${place.postalCode}';
          });
    }).catchError((e)=> debugPrint(e));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:  Text("Geo Localização"),),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('Address: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32,),
              ElevatedButton(onPressed: (){
                _getCurrentPosition();
              },
                  child: const Text("Obter localização"))
            ],
          ),
        ),
      )
    );
  }
}

