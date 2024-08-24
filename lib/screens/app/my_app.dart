import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/config/internet/connect_internet.dart';
import 'package:music_app/config/routes/app_route.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: StreamProvider<NetworkStatus>(
        create: (_) => ConnectProvider().controller.stream,
        initialData: NetworkStatus.online,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoute.onGenerateRoute,
          home: Scaffold(
            body: Consumer<NetworkStatus>(
              builder: (context, networkStatus, child) {
                return Stack(
                  children: [
                    const Navigator(
                      onGenerateRoute: AppRoute.onGenerateRoute,
                    ),
                    if (networkStatus == NetworkStatus.offline)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(5.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.public, color: Colors.white),
                              SizedBox(
                                  width:
                                      5), // Thêm khoảng cách giữa Icon và Text
                              Text(
                                'No Internet Connection',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
