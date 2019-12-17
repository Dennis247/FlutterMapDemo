import 'package:example/custom_button.dart';
import 'package:example/place_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';

import 'places_nearby.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Demo',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              title: 'Places Nearby',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PlacesNearby()),
                );
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Place Picker',
              onPressed: () async {
                LocationResult result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlacePicker(API_KEY),
                  ),
                );

                // Handle the result in your way
                print(result);
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Place Autocomplete',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return PlaceAutocomplete();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
