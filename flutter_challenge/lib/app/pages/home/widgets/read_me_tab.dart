import 'package:flutter/material.dart';

class ReadMeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            children: <InlineSpan>[
              TextSpan(
                text: '''
Welcome to dutchie's mobile challenge!

The following libraries are included in this project, you'll probably want to use them:

''',
              ),
              TextSpan(
                text: '''
• GetX
• GraphQL Flutter
• Flutter SVG
• Pedantic

''',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextSpan(text: '''
Take a look at the pubspec.yaml file to see any assets that might help you out, and add whatever you need to get the challenge done. Feel free to look up anything you need to complete the tasks.

We take pride in the polish of our product at dutchie both in the UI functionality and design, so we'd like to see the same from our candidates.

Finally, please use git and make commits as they make sense to you. Make sure to gitignore the node_modules directory. When you're done, just zip back up the repo, add your name in the file name, and send it back in a Google Drive attachment the same way it was sent to you.

Head to the "Challenge" tab to get started. Good luck!
              '''),
            ],
          ),
        ),
      );
}
