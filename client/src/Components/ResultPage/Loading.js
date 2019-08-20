import React, { Component } from 'react';
import { css } from 'react-emotion';
import { ClipLoader } from 'react-spinners';


const override = css`
    display: block;
    margin: 0 auto;
    size:100;
    top: 20%;
    left: 40%;
    position:fixed;
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
        <ClipLoader
          className={override}
          sizeUnit={"px"}
          size={350}
          color={'#123abc'}
          loading={this.state.loading}
        />
      </div>
    )
  }
}

export default Loading;
