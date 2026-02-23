import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:runna/data/models/team.dart';
import 'package:runna/data/models/territory.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/provider/home_provider.dart';
import 'package:runna/presentation/provider/location_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Runna', style: GoogleFonts.caveat())),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: homeState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        noTeam: () => const Center(
          child: Text(
            'You are not part of any team. Please join or create a team to start conquering territories!',
          ),
        ),
        success: (List<Territory> territories) =>
            mapConqueredView(territories, ref),
        error: (String e) => Center(child: Text(e)),
      ),
    );
  }

  SafeArea mapConqueredView(List<Territory> territories, WidgetRef ref) {
    // final locationAsync = ref.watch(userLocationProvider);

    return SafeArea(child: 
    Column(children: [
      ElevatedButton(onPressed: (){
        ref.read(authNotifierProvider.notifier).logout();
      }, child: const Text("Salir")),
      const Text("essaa"),
    ],
    ));

    // return SafeArea(
    //   child: FlutterMap(
    //     options: const MapOptions(
    //       initialCenter: LatLng(-35.6596, -63.7562),
    //       initialZoom: 13.0,
    //     ),

    //     children: [
          // TileLayer(
          //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          //   userAgentPackageName: 'com.runna.app',
          // ),
          // MarkerLayer(
          //   markers: [
          //     locationAsync.when(
          //       data: (position) => Marker(
          //         point: LatLng(position.latitude, position.longitude),
          //         width: 40,
          //         height: 40,
          //         child: const Icon(
          //           Icons.directions_run, // El muñequito corriendo
          //           color: Colors.blue, // Color de tu equipo
          //           size: 40,
          //           shadows: [Shadow(blurRadius: 10, color: Colors.black)],
          //         ),
          //       ),
          //       // Si está cargando o error, no mostramos nada (o un spinner chiquito)
          //       loading: () => const Marker(
          //         point: LatLng(0, 0), // Punto dummy invisible
          //         child: SizedBox(),
          //       ),
          //       error: (_, __) =>
          //           const Marker(point: LatLng(0, 0), child: SizedBox()),
          //     ),
          //   ],
          // ),
          // PolygonLayer(
          //   polygons: territories
          //       .map((t) {
          //         return t.polygons
          //             .map(
          //               (points) => Polygon(
          //                 points: points,
          //                 color: _getTeamColor(t.team),
          //                 borderColor: _getTeamColor(t.team),
          //                 borderStrokeWidth: 2,
          //               ),
          //             )
          //             .toList();
          //       })
          //       .expand((list) => list)
          //       .toList(),
          // ),
          
    //     ],
    //   ),
    // );
  }

  Color _getTeamColor(Team team) {
    switch (team.name.toLowerCase()) {
      case 'red':
        return Colors.red.withValues(alpha: 0.3);
      case 'blue':
        return Colors.blue.withValues(alpha: 0.3);
      case 'green':
        return Colors.green.withValues(alpha: 0.3);
      default:
        return Colors.yellow.withValues(alpha: 0.3);
    }
  }
}
