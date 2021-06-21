import React from 'react';
import Content from 'components/layout/content';
import PageWrapper from 'components/layout/page-wrapper';

export default function TheChallengePage() {
  return (
    <PageWrapper heading='The Challenge' icon='menu'>
      <Content.PageHeader>Your Challenge</Content.PageHeader>

      <Content.Paragraph>
        Display a list of product cards, and a product details view that appears when you click each card.
      </Content.Paragraph>

      <Content.Paragraph>You should meet these criteria:</Content.Paragraph>

      <Content.List>
        <Content.ListItem>Display your card at the 'the-result' route.</Content.ListItem>
        <Content.ListItem>
          Write a GraphQL query to get a list of products and their data. The GraphQL service is running at{' '}
          <a href='http://localhost:5000'>localhost:5000</a> and can be explored with the GraphiQL UI at that route. The
          Apollo client already points to that URL, so you'll just need to grab the data to display in the new
          component.
        </Content.ListItem>
        <Content.ListItem>Style the products to match the design mockup in the image below.</Content.ListItem>
        <Content.ListItem>List the products in a column layout on mobile and a row layout on desktop.</Content.ListItem>
        <Content.ListItem>
          Show a product details view when you click each product card. There is no mockup for this view and you can be
          creative, but keep the aesthetic close to the mockup. For example, it could be a card in a similar style to
          the list card, a new modal, a page, or whatever you feel like.
        </Content.ListItem>
        <Content.ListItem>
          The new view should display at least the <b>description</b>, <b>effects</b>, and <b>type</b> data. Note that
          these aren't displayed on the list card.
        </Content.ListItem>
        <Content.ListItem>
          When the user clicks the new view, it should return you to the product list.
        </Content.ListItem>
      </Content.List>
      <Content.Image src='/static/product-card-v3.png' />
    </PageWrapper>
  );
}
