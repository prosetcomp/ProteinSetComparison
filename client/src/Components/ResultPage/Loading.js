import React, { Component } from 'react';


import { css } from 'react-emotion';
import { ScaleLoader } from 'react-spinners';



const override = css`
    display: block;
    margin: 0 auto;
    position:fixed;
    top: 50%;
    left: 50%;
    width:30em;
    height:18em;
    margin-top: -9em;
    margin-left: -15em;
`;

class Loading extends Component {

  constructor(props) {
    super(props);
    this.state = {
      loading: true
    }
  }

  render() {
    return (
      <div className='sweet-loading'>
        <ScaleLoader
          className={override}
          height={100}
          width={40}
          margin={'2px'}
          radius={2}
          color={'#50E2C2'}
          loading={this.state.loading}
        />
      </div>
    )
  }
}

export default Loading;
