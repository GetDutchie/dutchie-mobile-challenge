import 'package:flutter/material.dart';

class ChallengeTab extends StatelessWidget {
  const ChallengeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: <InlineSpan>[
                  TextSpan(
                    text: '''
Display a grid of product cards, and add a product details page that is navigated to when you click each card.

You should meet these criteria:

''',
                  ),
                  TextSpan(
                    text: '''
• Display your cards on the "Result" tab.
• Write a GraphQL query to get a list of products and their data. The GraphQL service is running at''',
                  ),
                  TextSpan(
                    text: ''' https://localhost:5000 ''',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextSpan(
                    text: '''
and can be explored with the GraphiQL UI at that route. The GraphQLClient in this project already points to that URL, so you'll just need to grab the necessary data using valid query syntax.
• Style the products to match the design mockup in the image below.
• List the products in a grid layout with two columns.
• Navigate to a product details page when you click each product card. There is no mockup for this page so you can be creative, but keep the aesthetic close to the mockup.
• The new page should display at least the description, effects, and type data. Note that these aren't displayed on the grid card.
• Add a back arrow or some other icon to return back to the home page when clicked.
''',
                  ),
                  TextSpan(
                    text: ''' description, effects, ''',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextSpan(
                    text: '''and''',
                  ),
                  TextSpan(
                    text: ''' type ''',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextSpan(
                    text: '''

• Extend the functionality of your submission in a creative way using

''',
                  ),
                ],
              ),
            ),
            Image.asset(
              'lib/assets/images/product_card.png',
              width: 150,
            ),
          ],
        ),
      );
}
