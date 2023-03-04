import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late GoogleMapController _mapController;
  late Position _currentPosition;


  Future<bool> _checkGPS(BuildContext context) async{
    bool serviceEnabled;
    //var _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    //permission = await Geolocator.checkPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.      
      return Future<bool>.value(false);      

    }
    else{

      return Future<bool>.value(true);      
    }
  }
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition();
  }

  Future<void> turnOnGPS() => Geolocator.openLocationSettings();

  final _initialCameraPosition = const CameraPosition(
    target: LatLng(-2.198268,-79.932837),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: _checkGPS(context),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              if (snapshot.data == true){
                return GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                    zoom: 14.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('currentPosition'),
                      position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                      infoWindow: InfoWindow(
                        title: 'Mi ubicación',
                        snippet: 'Latitud: ${_currentPosition.latitude}, Longitud: ${_currentPosition.longitude}',
                      ),
                    ),
                  },
                );
              }
              else {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Para usar la APP necesita acceso a su localización. Debes habilitar el GPS", textAlign: TextAlign.center,),
                      ElevatedButton(
                        onPressed: (){
                          turnOnGPS();
                          //Navigator.popAndPushNamed(context,'/screenname');
                        }, 
                        child: const Text("Habilitar GPS"),
                      )
                    ]
                  ),
                );
              }
            }
            else{
              return const Center(child: CircularProgressIndicator());
            }            
          }
        )
      )
    );       
  }

}