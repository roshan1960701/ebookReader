import 'package:epub_view/epub_view.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  EpubController? _epubController;


  @override
  void initState() {
    super.initState();
    _epubController = EpubController(
      // Load document
      document: EpubDocument.openAsset('assets/epub/sample1.epub'),
      // Set start point
      epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Show actual chapter name
          title: EpubViewActualChapter(
              controller: _epubController!,
              builder: (chapterValue) => Text(
                'Chapter: ' + (chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? ''),
                textAlign: TextAlign.start,
              )
          ),
        ),
        drawer: Drawer(
          child: EpubViewTableOfContents(
            controller: _epubController!,
          ),
        ),
        body: EpubView(
          controller: _epubController!
        ),

        /*Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: MaterialButton(
                  color: Colors.purple,
                  onPressed: ()async{},
                  child: Text('Ebook'),
                ),
              ),
          *//*FlatButton(
            onPressed: () async {

              EpubViewer.setConfig(
                  themeColor: Theme.of(context).primaryColor,
                  identifier: "iosBook",
                  scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                  allowSharing: true,
                  enableTts: true,
                  nightMode: true);

              // get current locator
              EpubViewer.locatorStream.listen((locator) {
              print(locator);
              });

              EpubViewer.open(
                'https://github.com/FolioReader/FolioReaderKit/raw/master/Example/Shared/Sample%20eBooks/The%20Silver%20Chair.epub',
              );

              // await EpubViewer.openAsset(
              //   'assets/4.epub',
              //   lastLocation: EpubLocator.fromJson({
              //     "bookId": "2239",
              //     "href": "/OEBPS/ch06.xhtml",
              //     "created": 1539934158390,
              //     "locations": {
              //       "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
              //     }
              //   }),
              // );
            },
            child: Container(
              child: Text('open epub'),
            ),
          ),

          FlatButton(onPressed: (){

          }, child: Text('ebbok'))*//*
        ])*/
      ),
    );
  }
}
