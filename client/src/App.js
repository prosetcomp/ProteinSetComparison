import React, { Component } from 'react';
import './App.css';
import Footer from './Components/Footer/Footer';
import Query from './Components/Query/Query';
import ExtendedQuery from './Components/Query/ExtendedQuery';
import ResultPageOneQuery from './Components/ResultPage/ResultPageOneQuery';
import ResultPageTwoQuery from './Components/ResultPage/ResultPageTwoQuery';
import ResultPageThreeQuery from './Components/ResultPage/ResultPageThreeQuery';
import ResultPageFourQuery from './Components/ResultPage/ResultPageFourQuery';
import Loading from './Components/ResultPage/Loading';
import { BrowserRouter as Router, Route } from 'react-router-dom';


class App extends Component {
  render() {
    return (
      <div className="App">

      <Router>
          <div>
            <Route exact path="/" component={Query} />
            <Route exact path="/warning" component={ExtendedQuery} />
            <Route path="/loading" component={Loading} />
            <Route path="/result1" component={ResultPageOneQuery} />
            <Route path="/result2" component={ResultPageTwoQuery} />
            <Route path="/result3" component={ResultPageThreeQuery} />
            <Route path="/result4" component={ResultPageFourQuery} />


          </div>
      </Router>

    <Footer/>
      </div>
    );
  }
}

export default App;
