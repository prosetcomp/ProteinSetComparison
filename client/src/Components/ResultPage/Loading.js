import React, { Component } from 'react';
import { ClipLoader } from 'react-spinners';
import './Loading.css';


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
