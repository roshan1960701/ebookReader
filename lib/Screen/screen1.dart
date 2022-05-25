import 'package:ebook/Screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:starlight_epub_viewer/starlight_epub_viewer.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                color: Colors.cyanAccent,
                onPressed: ()async{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: Text('View Ebook'),

              )),

            Center(
                child: MaterialButton(
                  color: Colors.purple,
                  onPressed: ()async{
                    StarlightEpubViewer.setConfig(
                      ///for viewer color
                      themeColor: Colors.blue,
                      ///night mode for viewer
                      nightMode: false,
                      ///scroll direction for viewer
                      scrollDirection: StarlightEpubViewerScrollDirection.ALLDIRECTIONS,
                      ///if you want to share your epub file
                      allowSharing: true,
                      ///enable the inbuilt Text-to-Speech
                      enableTts: true,
                      ///if you want to show remaining
                      setShowRemainingIndicator: true,
                    );

                    /// Open From File
                    /*StarlightEpubViewer.open(
                      "file path",
                    );*/

                    /// Open From Assets Folder
                    StarlightEpubViewer.openAsset(
                      "assets/epub/sample1.epub",
                    );
                  },
                  child: Text('starlight_epub_viewer'),

                )),


            Center(
                child: MaterialButton(
                  color: Colors.purple,
                  onPressed: ()async{
                    StarlightEpubViewer.setConfig(
                      ///for viewer color
                      themeColor: Colors.blue,
                      ///night mode for viewer
                      nightMode: false,
                      ///scroll direction for viewer
                      scrollDirection: StarlightEpubViewerScrollDirection.ALLDIRECTIONS,
                      ///if you want to share your epub file
                      allowSharing: true,
                      ///enable the inbuilt Text-to-Speech
                      enableTts: true,
                      ///if you want to show remaining
                      setShowRemainingIndicator: true,
                    );

                    /// Open From File

                    /// Open From Assets Folder
                    StarlightEpubViewer.openAsset(
                      "assets/epub/sample1.epub",
                    );
                    
                  },
                  child: Text('starlight_epub_viewer'),

                )),



              ],
            )
        ),
    );
  }
}
