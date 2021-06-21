import styled from 'styled-components';

const Body = styled.div`
  margin-bottom: 12px;
`;

const Image = styled.img`
  display: inline-block;
  height: 430px;
  margin-bottom: 12px;
  width: 300px;
`;

const PageHeader = styled.h1`
  font-size: 19px;
  font-weight: bold;
  margin-bottom: 12px;
`;

const List = styled.ul`
  list-style: circle inside;
  margin-bottom: 12px;
  margin-top: 12px;
`;

const ListItem = styled.li`
  line-height: 1.6;
  list-style-type: disc;
  margin-left: 12px;
  padding-left: 24px;
  text-indent: -24px;
`;

const Paragraph = styled.div`
  line-height: 1.5;
  margin-bottom: 16px;

  :last-child {
    margin-bottom: 0;
  }
`;

export default {
  Body,
  Image,
  List,
  ListItem,
  PageHeader,
  Paragraph,
};
