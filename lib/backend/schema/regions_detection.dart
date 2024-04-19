import 'dart:convert'; // Import dart:convert to parse JSON

class CustomRegion {
  final Map<String, dynamic> boundingBox;
  final String name;

  CustomRegion({required this.boundingBox, required this.name});

  factory CustomRegion.fromJson(Map<String, dynamic> json) {
    return CustomRegion(
      boundingBox: json['region_info']['bounding_box'],
      name: json['data']['concepts'][0]['name'],
    );
  }
}

Future<List<CustomRegion>> extractRegions(String responseBody) async {
  // Parse the response JSON
  Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

  // Access the 'outputs' array from the response
  List<dynamic> outputs = jsonResponse['outputs'];

  // Access the first item in the 'outputs' array
  Map<String, dynamic> output = outputs.isNotEmpty ? outputs[0] : {};

  // Access the 'data' object from the output
  Map<String, dynamic> data = output.containsKey('data') ? output['data'] : {};

  // Access the 'regions' array from the data
  List<dynamic> regions = data.containsKey('regions') ? data['regions'] : [];

  // Extract required fields from each region
  List<CustomRegion> customRegions = regions.map((region) {
    return CustomRegion.fromJson(region);
  }).toList();

  return customRegions;
}
