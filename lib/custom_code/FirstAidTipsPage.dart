import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class FirstAidTipsPage extends StatefulWidget {
  @override
  _FirstAidTipsPageState createState() => _FirstAidTipsPageState();
}

class _FirstAidTipsPageState extends State<FirstAidTipsPage> {
  String htmlContent = '';
  String originalContent = '';
  String searchQuery = '';
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<String> contentSegments = []; // Divided content segments
  int currentMatchIndex = -1;
  List<int> matchIndices = []; // Indices of matching segments

  @override
  void initState() {
    super.initState();
    _loadHtmlContent();
  }

  Future<void> _loadHtmlContent() async {
    final String fileData = await rootBundle.loadString('index.html');
    setState(() {
      htmlContent = fileData;
      originalContent = fileData; // Save unmodified content for resetting
      contentSegments = _splitContent(fileData);
    });
  }

  // Split content by paragraphs or logical sections
  List<String> _splitContent(String content) {
    return content.split(RegExp(r"<p|<h\d")); // Example: split by paragraphs and headers
  }

  // Find matches across segments and highlight them
  void _updateSearchResults(String query) {
    setState(() {
      searchQuery = query;
      matchIndices.clear();
      currentMatchIndex = -1;
      if (query.isNotEmpty) {
        RegExp exp = RegExp(query, caseSensitive: false);
        for (int i = 0; i < contentSegments.length; i++) {
          if (exp.hasMatch(contentSegments[i])) {
            // Highlight matching text
            contentSegments[i] = contentSegments[i].replaceAll(
              exp,
              '<mark style="background-color:yellow;">$query</mark>',
            );
            matchIndices.add(i); // Store index of matching segment
          }
        }
        if (matchIndices.isNotEmpty) {
          currentMatchIndex = 0;
          _scrollToMatch();
        }
      } else {
        _resetContent();
      }
    });
  }

  // Scroll to the current match in segmented content
  void _scrollToMatch() {
    if (currentMatchIndex >= 0 && currentMatchIndex < matchIndices.length) {
      double position = matchIndices[currentMatchIndex].toDouble() * 100;
      scrollController.animateTo(
        position,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Reset content if search is cleared
  void _resetContent() {
    setState(() {
      contentSegments = _splitContent(originalContent);
      matchIndices.clear();
    });
  }

  // Move to the next match
  void _nextMatch() {
    if (currentMatchIndex < matchIndices.length - 1) {
      setState(() {
        currentMatchIndex++;
        _scrollToMatch();
      });
    }
  }

  // Move to the previous match
  void _previousMatch() {
    if (currentMatchIndex > 0) {
      setState(() {
        currentMatchIndex--;
        _scrollToMatch();
      });
    }
  }

  Future<bool> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    } else {
      print('Could not launch $url');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Tips'),
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          _updateSearchResults('');
                        },
                      ),
                    ),
                    onChanged: (value) {
                      _updateSearchResults(value);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: _previousMatch,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: _nextMatch,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: contentSegments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: HtmlWidget(
                    contentSegments[index],
                    onTapUrl: (url) => _launchURL(url),
                    textStyle: TextStyle(fontSize: 14),
                    customStylesBuilder: (element) {
                      if (element.localName == 'mark') {
                        return {
                          'background-color': 'yellow',
                          'font-weight': 'bold',
                        };
                      }
                      if (element.localName == 'h1') {
                        return {
                          'font-size': '30pt',
                          'color': '#0f4761',
                          'font-family': 'Aptos Display',
                          'font-weight': 'normal',
                        };
                      }
                      if (element.localName == 'h2') {
                        return {
                          'font-size': '16pt',
                          'color': '#0f4761',
                          'font-family': 'Aptos Display',
                        };
                      }
                      if (element.localName == 'h4' || element.localName == 'h6') {
                        return {
                          'font-size': '30pt',
                          'color': element.localName == 'h6' ? '#595959' : '#0f4761',
                          'font-style': 'italic',
                        };
                      }
                      if (element.localName == 'strong') {
                        return {
                          'color': 'red',
                          'font-weight': 'bold',
                        };
                      }
                      if (element.classes.contains('Subtitle')) {
                        return {
                          'font-size': '30pt',
                          'letter-spacing': '0.75pt',
                          'color': '#595959',
                        };
                      }
                      if (element.classes.contains('Hyperlink')) {
                        return {
                          'text-decoration': 'underline',
                          'color': '#467886',
                        };
                      }
                      return null;
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
