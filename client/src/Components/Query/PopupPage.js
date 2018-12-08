import React, { Component } from 'react';
import ReactConfirmAlert, { confirmAlert } from 'react-confirm-alert'; // Import
import 'react-confirm-alert/src/react-confirm-alert.css' // Import css
import Query from './Query';



class PopupPage extends Component {
constructor(props){
  super(props)
  this.state = {
    showDialog: false,


  }
  this.changeShowDialog = this.changeShowDialog.bind(this);

}

changeShowDialog(){
  console.log(this.state.showDialog)
   this.setState(state => ({ showDialog: !state.showDialog }));
}
  render() {
    const a =this.state;


    return (
      <div>
        <h1>{this.props.preview}</h1>
         {this.changeShowDialog}
          {
            this.state.showDialog &&
            <ReactConfirmAlert
              title="Confirm to submit"
              message="Are you sure to do this."
              confirmLabel="Confirm"
              cancelLabel="Cancel"
              onConfirm={() => alert('Action after Confirm')}
              onCancel={() => alert('Action after Cancel')}
            />
          }
        </div>
    );
  }
}

export default PopupPage;
