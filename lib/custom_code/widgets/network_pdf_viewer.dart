// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class NetworkPdfViewer extends StatefulWidget {
  const NetworkPdfViewer({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;
  @override
  _NetworkPdfViewerState createState() => _NetworkPdfViewerState();
}


class _NetworkPdfViewerState extends State<NetworkPdfViewer> {
  late PdfViewerController _pdfViewerController;
  late PdfTextSearchResult _searchResult;
  TextEditingController _searchController = TextEditingController();
  double _zoomLevel = 1.0; // Initial zoom level

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search Result'),
          content: const Text(
              'No more occurrences found. Would you like to continue to search from the beginning?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _searchResult.nextInstance();
                Navigator.of(context).pop();
              },
              child: const Text('YES'),
            ),
            TextButton(
              onPressed: () {
                _searchResult.clear();
                Navigator.of(context).pop();
              },
              child: const Text('NO'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Conditionally hide the AppBar when no search results
        appBar: _searchResult.hasResult
            ? AppBar(
          actions: <Widget>[
            // Clear search button (only visible if search results are found)
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _searchResult.clear();
                  });
                },
              ),
            ),
            // Previous match button (only visible if search results are found)
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ),
                onPressed: () {
                  _searchResult.previousInstance();
                },
              ),
            ),
            // Show current match index and total matches
            Visibility(
              visible: _searchResult.hasResult,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${_searchResult.currentInstanceIndex} / ${_searchResult.totalInstanceCount}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // Next match button (only visible if search results are found)
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (_searchResult.currentInstanceIndex ==
                      _searchResult.totalInstanceCount &&
                      _searchResult.isSearchCompleted) {
                    _showDialog(context);
                  } else {
                    _searchResult.nextInstance();
                  }
                },
              ),
            ),
          ],
        )
            : null, // Hides the AppBar when there are no search results

        body: Column(
          children: [
            // Search bar to input search query
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      String searchText = _searchController.text.trim();
                      if (searchText.isNotEmpty) {
                        _searchResult = _pdfViewerController.searchText(searchText);
                        setState(() {});
                        _searchResult.addListener(() {
                          if (_searchResult.hasResult) {
                            setState(() {});
                          }
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            // PDF Viewer
            Expanded(
              child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/unified-assist-wra4g4.appspot.com/o/First-Aid-Basics.pdf?alt=media&token=561e135c-2830-4170-ab01-619440dfc65a',
                controller: _pdfViewerController,
                currentSearchTextHighlightColor: Colors.blue,
                otherSearchTextHighlightColor: Colors.yellow,
              ),
            ),
          ],
        ),
        // Floating action button for zoom in/out
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  // Zoom in by increasing zoom level
                  _zoomLevel = (_zoomLevel < 5.0) ? _zoomLevel + 0.5 : _zoomLevel; // Max zoom level 3.0
                  _pdfViewerController.zoomLevel = _zoomLevel;
                });
              },
              child: const Icon(Icons.zoom_in),
              heroTag: 'zoom_in', // Ensures no conflict with other FABs
            ),
            SizedBox(height: 10), // Space between zoom in and zoom out buttons
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  // Zoom out by decreasing zoom level
                  _zoomLevel = (_zoomLevel > 0.5) ? _zoomLevel - 0.5 : _zoomLevel; // Min zoom level 0.5
                  _pdfViewerController.zoomLevel = _zoomLevel;
                });
              },
              child: const Icon(Icons.zoom_out),
              heroTag: 'zoom_out', // Ensures no conflict with other FABs
            ),
          ],
        ),
      ),
    );
  }
}



// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
