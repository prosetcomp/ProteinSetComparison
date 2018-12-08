import React, { Component } from 'react';
import Query from './Query';
import Footer from '../Footer/Footer';
import _ from 'lodash';
import CircularProgressbar from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';
import { Redirect } from 'react-router';
import axios from 'axios';
// Animation duration override in CSS file!
import './custom.css';

class ChangingProgressbar extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      currentPercentageIndex: 0,
    };
  }

  componentDidMount() {
    setInterval(() => {
      this.setState({
        currentPercentageIndex:
          (this.state.currentPercentageIndex + 1) %
          this.props.percentages.length,
      });
    }, this.props.interval);

  }

  getStyles() {
    return this.props.stylesForPercentage
      ? this.props.stylesForPercentage(this.getCurrentPercentage())
      : {};
  }

  getCurrentPercentage() {
    return this.props.percentages[this.state.currentPercentageIndex];
  }
  closeConnection(){
    Promise.all([
      axios.get('http://localhost:9000/protein/connection')
    ])


  }
  render() {
    const currentPercentage = this.getCurrentPercentage();
    if(currentPercentage===0){
      {this.closeConnection()}
      return  (<Redirect to={{ pathname: "/", state: { preview: this.state.preview } }} />)
    }
    return (
      <CircularProgressbar
        {...this.props}
        percentage={currentPercentage}
        text={this.props.textForPercentage(currentPercentage)}
        styles={this.getStyles()}
      />
    );
  }
}

ChangingProgressbar.defaultProps = {
  interval: 1000,
};

function CountdownProgressbar(props) {

  const secondsToPercentages = _.range(props.numSeconds, -1, -1).map(
    seconds => seconds / props.numSeconds * 100,

  );


  function percentageToSeconds(percentage) {
    return String(percentage / 100 * props.numSeconds);
  }

  return (
    <ChangingProgressbar
      percentages={secondsToPercentages}
      textForPercentage={percentageToSeconds}
      interval={1000}
    />
  );
}
class ExtendedQuery extends Component {



  render() {

    const number = 5;
    console.log(number);
    return (
      <div className="warnPage">
      <p className="warningText">Sorry one of your query is extended 5000 result. So you will direct to home page!</p>
        <div style={{ width: '300px' ,position: 'fixed',top: '30%',left: '40%' }}>
                <CountdownProgressbar numSeconds={number} />

        </div>
    <Footer/>
    </div>
    );
  }
}

export default ExtendedQuery;
