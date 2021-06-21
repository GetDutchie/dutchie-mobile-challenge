import Content from 'components/layout/content';
import PageWrapper from 'components/layout/page-wrapper';

export default function HomePage() {
  return (
    <PageWrapper heading='Read me first!' icon='dispensaries'>
      <Content.Body>
        <Content.Paragraph>Welcome to dutchie's front end technical challenge!</Content.Paragraph>

        <Content.Paragraph>
          The following tools are included in this project, you'll probably want to use them:
        </Content.Paragraph>
      </Content.Body>

      <Content.List>
        <Content.ListItem>
          <a href='https://yarnpkg.com/' target='_blank' rel='noreferrer'>
            Yarn
          </a>{' '}
          (please use yarn, mixing with npm can get things tangled!)
        </Content.ListItem>
        <Content.ListItem>
          <a href='https://reactjs.org/' target='_blank' rel='noreferrer'>
            React
          </a>
        </Content.ListItem>
        <Content.ListItem>
          <a href='https://www.styled-components.com/' target='_blank' rel='noreferrer'>
            Styled Components
          </a>
        </Content.ListItem>
        <Content.ListItem>
          <a href='https://www.apollographql.com/docs/react/' target='_blank' rel='noreferrer'>
            Apollo GraphQL
          </a>
        </Content.ListItem>
        <Content.ListItem>
          <a href='https://prettier.io' target='_blank' rel='noreferrer'>
            Prettier
          </a>
        </Content.ListItem>
      </Content.List>
      <Content.Body>
        <Content.Paragraph>
          Take a look at the package.json file to see any other packages installed that might help you out, and add
          whatever you need to get the challenge done. Feel free to look up anything you need to complete the tasks.
        </Content.Paragraph>
        <Content.Paragraph>
          We take pride in the polish of our product at dutchie both in the UI functionality and design, so we'd like to
          see the same from our candidates.
        </Content.Paragraph>
        <Content.Paragraph>
          Finally, please use git and make commits as they make sense to you. Make sure to gitignore the node_modules
          directory. When you're done, just zip back up the repo, add your name in the file name, and send it back in a
          Google Drive attachment the same way it was sent to you.
        </Content.Paragraph>
        <Content.Paragraph>Click "The Challenge" in the left menu to get started. Good luck!</Content.Paragraph>
      </Content.Body>
    </PageWrapper>
  );
}
