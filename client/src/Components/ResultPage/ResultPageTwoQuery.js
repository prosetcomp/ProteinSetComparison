/* eslint-disable */
/* eslint no-eval: 0 */
import React, { Component } from 'react';
import { Tabs } from 'react-bootstrap';
import { Tab } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import axios from 'axios';
import {Checkbox, CheckboxGroup} from 'react-checkbox-group';
import _ from 'underscore';
import * as d3 from 'd3'
import * as venn from 'venn.js'
import { VennDiagram } from 'venn.js';
import { select } from 'd3-selection';
import './ResultPage2.css';
import Switch from "react-switch";
import ReactTextCollapse from 'react-text-collapse';
import {BootstrapTable, TableHeaderColumn,ExportCSVButton } from 'react-bootstrap-table';
import {CSVLink} from 'react-csv';
import Modal from 'react-responsive-modal';
import Cookies from 'js-cookie';
import "react-responsive-modal/styles.css";
import Loading from  './Loading';




const TEXT_COLLAPSE_OPTIONS = {
  collapse: false,
  collapseText: 'more...',
  expandText: 'less..',
  minHeight: 20,
  maxHeight: 100,
  textStyle: {
    color: 'black',
    fontSize: '12px',
    fontWeight: 'bold'
  }
}
const TEXT_COLLAPSE_OPTIONS2 = {
  collapse: false,
  collapseText: 'more...',
  expandText: 'less..',
  minHeight: 20,
  maxHeight: 250,
  textStyle: {
    color: 'black',
    fontSize: '12px',
    fontWeight: 'bold'
  }
}

var resultMolecular;
var resultBiological;
var resultPathway;
var resultDomain;
var resultDBank;

class ResultPageTwoQuery extends Component {
  constructor(props) {
    super(props)
    this.state = {
    GM_a: [],
    GM_b: [],
    GM_c: [],
    GB_a: [],
    GB_b: [],
    GB_c: [],
    PW_a: [],
    PW_b: [],
    PW_c: [],
    DM_a: [],
    DM_b: [],
    DM_c: [],
    PROT_a:[],
    PROT_b:[],
    PROT_c:[],
    DBANK_a:[],
    DBANK_b:[],
    DBANK_c:[],
    selectedValue:["c"],
    key: 1,
    checked: true,
    isChecked: true,
    preview:this.props.location.state,
    open: false,
    mfaccessionresult:[],
    bpaccessionresult:[],
    pwaccessionresult:[],
    dmaccessionresult:[],
    dbankaccessionresult:[],
    isLoading:true,
    isUpset:true,

  }
    this.options = {
     defaultSortName: 'is_reviewed',  // default sort column name
     defaultSortOrder: 'asc'  // default sort order
    };

      this.handleChange = this.handleChange.bind(this);
      this.handleSelect = this.handleSelect.bind(this);
      this.handleChange2 = this.handleChange2.bind(this);
      this.handleVennChange = this.handleVennChange.bind(this);
      this.handleChecked = this.handleChecked.bind(this);
      this.makeRequestMolecular = this.makeRequestMolecular.bind(this);
      this.makeRequestBiological = this.makeRequestBiological.bind(this);
      this.makeRequestPathway = this.makeRequestPathway.bind(this);
      this.makeRequestDomain = this.makeRequestDomain.bind(this);
      this.makeRequestDrugBank = this.makeRequestDrugBank.bind(this);
      this.openModal = this.openModal.bind(this);





  }

  componentDidMount(){
    this.getAccession();
    window.addEventListener("beforeunload", (ev) =>
    {
    //  console.log("Leaveeeee!!!!");
        ev.preventDefault();
    //    {this.closeConnection()}
        return ev.returnValue = 'Are you sure you want to close?';
    });
}

drawUpset(sets){
    setTimeout(
          function() {
           this.setState({ isUpset: false });
          }.bind(this),
         1000
       );
      d3.select("body").select("#upset").selectAll("*").remove();
      var rows = sets.length;
      var cols = 0;
      var assigned = {};
      var lines = {};

      sets.forEach(function (set) {
        if(set.sets.length === 1) { cols++; }
      });
      // console.log(rows);
      // console.log(cols);

      for(var i=0; i<rows; i++) {
        if(sets[i].sets.length === 1) { assigned[sets[i].sets[0]+"_"+sets[i].sets[0]] = "assigned"; }
        else {
          sets[i].sets.forEach(function (q) {
            assigned[i+"_"+q] = "assigned";
          });

          for(var j=0; j<cols; j++) {
            if(sets[i].sets.length < cols) { lines[i] = {start: sets[i].sets[0], end: sets[i].sets[sets[i].sets.length - 1]}; }
            else { lines[i] = {start: 0, end: cols-1}; }
          }
        }
      }
      // console.log("Assigned", assigned);
      // console.log("Lines", lines);

      // chart config DEFAULTS
      var cx = 15;
      var cy = 15;
      var r = 10;
      var gap = 2*cx;
      var rowWidth = cx+((cols+2)*gap);
      var rowHeight = 2*cy;
      var rowPadding = r/2;

      var wrapper = d3.select("body").select("#upset");

      for(i=0; i<rows; i++) {
        var row = wrapper.append("div")
                  .style("width", rowWidth+"px")
                  .style("height", rowHeight+"px")
                  .style("padding", rowPadding+"px")
                  //.style("background-color", function() {if (i%2==0) { return "#d3d3d3"; }})
                  .attr("id", "row"+i)
                .append("svg")
                  .attr("width", rowWidth)
                  .attr("height", rowHeight);

        for(j=0; j<cols; j++) {
          var key1 = i+"_"+j;

          if(sets[i].sets.length > 1) {
            var x1 = (lines[i].start > 0)?cx + (lines[i].start * gap):cx;
            var x2 = x1 + ((lines[i].end - lines[i].start) * gap);
            // console.log("x1:", x1, "y1:", cy, "x2:", x2, "y2:", cy);

            row.append("line")
              .attr("x1", x1)
              .attr("y1", cy)
              .attr("x2", x2)
              .attr("y2", cy);
          }

          row.append("circle")
            .attr("cx", cx+j*gap)
            .attr("cy", cy)
            .attr("r", r)
            .attr("class", assigned[key1]?assigned[key1]:"not-assigned");
        }

        row.append("text")
          .attr("x", cx+cols*gap)
          .attr("y", cy+rowPadding)
          .text(sets[i].label)
          .attr("font-family", "sans-serif")
          .attr("font-size", "15px");



      }
}


  getAccession(){

    Promise.all([
         axios.get('http://localhost:9000/protein/gm'),
         axios.get('http://localhost:9000/protein/gb'),
         axios.get('http://localhost:9000/protein/pw'),
         axios.get('http://localhost:9000/protein/dm'),
         axios.get('http://localhost:9000/protein/prot'),
         axios.get('http://localhost:9000/protein/dbank')

       ]).then(result => {
            this.setState({ GM_a: result[0].data[0],GM_b: result[0].data[1],GM_c: result[0].data[2],
                            GB_a: result[1].data[0],GB_b: result[1].data[1],GB_c: result[1].data[2],
                            PW_a: result[2].data[0],PW_b: result[2].data[1],PW_c: result[2].data[2],
                            DM_a: result[3].data[0],DM_b: result[3].data[1],DM_c: result[3].data[2],
                            PROT_a: result[4].data[0],PROT_b: result[4].data[1],PROT_c: result[4].data[2],
                            DBANK_a:result[5].data[0],DBANK_b: result[5].data[1],DBANK_c: result[5].data[2]


            });


        }).then(response => {
              this.setState({ isLoading: false });

            });


}


closeConnection(){

  Promise.all([

       axios.get('http://localhost:9000/protein/connection')
     ])


}




handleChange(value) {
  this.setState({selectedValue: value});
  //  {this.closeConnection()}
}
handleSelect(key) {
    this.setState({ key: key });
  //  {this.closeConnection()}
}
handleChange2(checked) {

  this.setState({ checked });

}
handleVennChange(vennRegion) {
  this.setState({ vennRegion: vennRegion });
}
handleChecked (event) {

   this.setState({collectRegion:event.target.value});
   this.setState({isChecked: !this.state.isChecked});


 }


 formatLinksProtein(cell,row){
   row.id= row.accession.replace(/(<([^>]+)>)/ig, '')
   var linkPathway = "https://reactome.org/content/query?q="+row.id+"&types=Protein"
   var linkDomain=" http://www.ebi.ac.uk/interpro/protein/"+row.id
   var linkMolecular=" https://www.ebi.ac.uk/QuickGO/annotations?geneProductId="+row.id+"&aspect=molecular_function"
   var linkBiological = "https://www.ebi.ac.uk/QuickGO/annotations?geneProductId="+row.id+"&aspect=biological_process"
   return(
     <div>
   <a href={linkPathway} target="_blank" ><button id="pathwayButton">Pathway</button></a>
   <a href={linkDomain} target="_blank" ><button id="domainButton">Domain</button></a>
   <a href={linkMolecular} target="_blank" ><button id="molecularButton">Molecular Function </button></a>
   <a href={linkBiological} target="_blank" ><button id="biologicalButton">Biological Process</button></a>
   </div>

   );



 }

 //Buttons for related proteins

  //Molecular Function
 buttonFunctionMolecular(cell, row) {
       return <label>
                <button type="button"
                       id="validatebutton"
                        onClick={() => {this._validateFunctionMolecular(row)}}
                        className="bbtn btn-primary btn-sm">
                         Show
                </button>
              </label>
    }

  _validateFunctionMolecular(row) {
     const regex = /(<([^>]+)>)/ig;
     var numberPattern = /(\d+){5,}/g;
     const result0 = row.go_id.replace(regex, '');
     resultMolecular = result0.match( numberPattern );
     {this.makeRequestMolecular()}
     //{this.openModal()}
  }

  //Biological Process
 buttonFunctionBiological(cell, row) {
       return <label>
                <button type="button"
                       id="validatebutton"
                        onClick={() => {this._validateFunctionBiological(row)}}
                        className="bbtn btn-primary btn-sm">
                         Show
                </button>
              </label>
 }

 _validateFunctionBiological(row) {
    const regex = /(<([^>]+)>)/ig;
    var numberPattern = /(\d+){5,}/g;
    const result0 = row.go_id.replace(regex, '');
    resultBiological = result0.match( numberPattern );

   {this.makeRequestBiological()}
    //{this.openModal()}
 }


//Pathway
 buttonFunctionPathway(cell, row) {
      return <label>
                <button type="button"
                        id="validatebutton"
                        onClick={() => {this._validateFunctionPathway(row)}}
                        className="bbtn btn-primary btn-sm">
                          Show
                </button>
             </label>
 }

_validateFunctionPathway(row) {
   const regex = /(<([^>]+)>)/ig;
   var numberPattern = /(\d+){5,}/g;
   const result0 = row.ipr_id.replace(regex, '');
   resultPathway = result0.match( numberPattern );
  {this.makeRequestPathway()}
   //{this.openModal()}
 }


 //Domain
  buttonFunctionDomain(cell, row) {
        return <label>
                 <button type="button"
                        id="validatebutton"
                         onClick={() => {this._validateFunctionDomain(row)}}
                         className="bbtn btn-primary btn-sm">
                          Show
                 </button>
               </label>
  }

  _validateFunctionDomain(row) {
     const regex = /(<([^>]+)>)/ig;
     var numberPattern = /(\d+){5,}/g;
     const result0 = row.ipr.replace(regex, '');
     resultDomain = result0.match( numberPattern );
    {this.makeRequestDomain()}
     //{this.openModal()}
  }

  //DrugBank
   buttonFunctionDrugBank(cell, row) {
        return <label>
                  <button type="button"
                          id="validatebutton"
                          onClick={() => {this._validateFunctionDrugBank(row)}}
                          className="bbtn btn-primary btn-sm">
                            Show
                  </button>
               </label>
   }

   _validateFunctionDrugBank(row) {
      const regex = /(<([^>]+)>)/ig;
      var numberPattern = /(\d+){5,}/g;
      const result0 = row.idurl.replace(regex, '');

      resultDBank = result0.match( numberPattern );
      console.log(resultDBank);
     {this.makeRequestDrugBank()}
      //{this.openModal()}
   }

//Requests for related proteins

//Molecular
 makeRequestMolecular(){
 let cookie_value =  Cookies.get('id');
 axios.defaults.headers.common['Authorization'] = cookie_value;
 axios.post('http://localhost:9000/protein/mfaccession', {
       region:this.state.selectedValue,
       body:  JSON.parse(JSON.stringify(resultMolecular))
 })
 .then((results) => {
   this.setState({mfaccessionresult:results.data[0]});
   cookie_value=results.config.headers.Authorization;
 }).catch(err => {

 });
 {this.openModal()}
 }
 //Biological
 makeRequestBiological(){
 let cookie_value =  Cookies.get('id');
 axios.defaults.headers.common['Authorization'] = cookie_value;
 axios.post('http://localhost:9000/protein/bpaccession', {
       region:this.state.selectedValue,
       body:  JSON.parse(JSON.stringify(resultBiological))
 })
 .then((results) => {
   this.setState({bpaccessionresult:results.data[0]});
   cookie_value=results.config.headers.Authorization;
 }).catch(err => {

 });
 {this.openModal()}
 }

//Pathway
 makeRequestPathway(){
 let cookie_value =  Cookies.get('id');
 axios.defaults.headers.common['Authorization'] = cookie_value;
 axios.post('http://localhost:9000/protein/pwaccession', {
         region:this.state.selectedValue,
         body:  JSON.parse(JSON.stringify(resultPathway))


       })
         .then((results) => {
           this.setState({pwaccessionresult:results.data[0]});
           cookie_value=results.config.headers.Authorization;
       }).catch(err => {

     });
   {this.openModal()}
 }
//Domain
 makeRequestDomain(){
 let cookie_value =  Cookies.get('id');
 axios.defaults.headers.common['Authorization'] = cookie_value;
axios.post('http://localhost:9000/protein/dmaccession', {
       region:this.state.selectedValue,
       body:  JSON.parse(JSON.stringify(resultDomain))
 })
 .then((results) => {
   this.setState({dmaccessionresult:results.data[0]});
   cookie_value=results.config.headers.Authorization;
 }).catch(err => {

 });
 {this.openModal()}
 }

 //DrugBank
  makeRequestDrugBank(){
  let cookie_value =  Cookies.get('id');
  axios.defaults.headers.common['Authorization'] = cookie_value;
  axios.post('http://localhost:9000/protein/dbankaccession', {
        region:this.state.selectedValue,
        body:  JSON.parse(JSON.stringify(resultDBank))
  })
  .then((results) => {
    this.setState({dbankaccessionresult:results.data[0]});
  }).catch(err => {

  });
  {this.openModal()}
  }



openModal(){
 this.setState({ open: true });

}

onCloseModal = () => {
  this.setState({ open: false });
};


 formatNameAccession(cell, row) {
    // get name by row.name
    // get description by row.description
    return (
       <div style={ { display: 'grid' } }>
        <td dangerouslySetInnerHTML={{__html: row.accession}} />


       </div>
    );
    }
    formatNameName(cell, row) {
       // get name by row.name
       // get description by row.description
       if(row.name.length<2){
         return(
           <div >
             <td dangerouslySetInnerHTML={{__html: row.name}} />
           </div>

         )
       }
       return (
          <div style={ { display: 'grid' } }>
           <ReactTextCollapse options={TEXT_COLLAPSE_OPTIONS}>
           <td dangerouslySetInnerHTML={{__html: row.name}} />
             </ReactTextCollapse>
          </div>
       );
       }
     formatNameParentsForPathway(cell, row) {
        // get name by row.name
        // get description by row.description
        if(row.parents.length<2){
          return(
            <div >
              <td dangerouslySetInnerHTML={{__html: row.parents}} />
            </div>

          )
        }


        return (

          <div >
          <ReactTextCollapse options={TEXT_COLLAPSE_OPTIONS}>
             <td dangerouslySetInnerHTML={{__html: row.parents}} />
           </ReactTextCollapse>

          </div>

        );
        }
        formatNameParents(cell, row) {
           // get name by row.name
           // get description by row.description
           if(row.parents.length<2){
             return(
               <div >
                 <td dangerouslySetInnerHTML={{__html: row.parents}} />
               </div>

             )
           }

           return (

             <div >
               <ReactTextCollapse options={TEXT_COLLAPSE_OPTIONS2}>
                 <td dangerouslySetInnerHTML={{__html: row.parents}} />
                </ReactTextCollapse>
             </div>

           );
           }
    formatNameGo_Id(cell, row) {
       // get name by row.name
       // get description by row.description
       return (
          <div style={ { display: 'grid' } }>

           <td dangerouslySetInnerHTML={{__html: row.go_id}} />

          </div>
       );
       }
   formatNameIpr_Id(cell, row) {
          // get name by row.name
          // get description by row.description
          return (
             <div style={ { display: 'grid' } }>

              <td dangerouslySetInnerHTML={{__html: row.ipr_id}} />

             </div>
          );
   }
   formatNameIpr(cell, row) {
      // get name by row.name
      // get description by row.description
      return (
         <div style={ { display: 'grid' } }>

          <td dangerouslySetInnerHTML={{__html: row.ipr}} />

         </div>
      );
      }

      formatIdUrl(cell,row){
        return (

            <td dangerouslySetInnerHTML={{__html: row.idurl}} />


        );
      }



  render() {

function mouseClick(div){
div.selectAll("path")
  .style("stroke-opacity", 0)
  .style("stroke", "#fff")
  .style("stroke-width", 3)

div.selectAll("g")
.on("click", function(d, i) {
       // sort all the areas relative to the current item
       venn.sortAreas(div, d);

       // Display a tooltip with the current size

       // highlight the current path
       var selection = d3.select(this).transition("tooltip");
       selection.select("text")
           .style("font-size", 30)
           .style("font-weight",600)
       selectedValue.push(d.text2)
   })
    .on("mouseover", function(d, i) {
       var node = d3.select(this).transition();

       node.select("text").style("font-weight", "100")
                          .style("font-size", "36px");
   })
   .on("mouseout", function(d, i) {
       var node = d3.select(this).transition();

       node.select("text").style("font-weight", "100")
                          .style("font-size", "24px");
   })
    ;


}



const {GM_a,GM_b,GM_c ,GB_a,GB_b,GB_c ,PW_a,PW_b,PW_c ,DM_a,DM_b,DM_c ,PROT_a,PROT_b,PROT_c,DBANK_a,DBANK_b,DBANK_c, selectedValue,key} =this.state;
const {checked,preview} = this.state;
let {isLoading} = this.state

const {open,pwaccessionresult,mfaccessionresult,bpaccessionresult,dmaccessionresult,dbankaccessionresult } = this.state;

let value_GM =GM_c;
let value_GB=GB_c;
let value_PW=PW_c;
let value_DM=DM_c;
let value_PROT=PROT_c;
let value_DBANK = DBANK_c;
var tsvData="";




let data ;
    if(key==2){
      data = mfaccessionresult;
    }
    else if(key==3){
      data = bpaccessionresult;
    }
    else if(key==4){
      data = pwaccessionresult;

    }

    else if(key==5){
      data = dmaccessionresult;
    }

    else if(key==6){
      data = dbankaccessionresult;
    }

    function exportTsv(){
        if(key===1){
          tsvData= JSON.parse(JSON.stringify(value_PROT));

          for(var i in tsvData){
              tsvData[i].accession= tsvData[i].accession.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')


            }
    }
        else if(key===2){
            tsvData= JSON.parse(JSON.stringify(value_GM));
            for(var i in tsvData){
                tsvData[i].go_id= tsvData[i].go_id.replace(/(<([^>]+)>)/ig, '')
                tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


              }


        }
        else if(key===3){
          tsvData= JSON.parse(JSON.stringify(value_GB));
          for(var i in tsvData){
              tsvData[i].go_id= tsvData[i].go_id.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


            }


        }
        else if(key===4){
          tsvData= JSON.parse(JSON.stringify(value_PW));

          for(var i in tsvData){
              tsvData[i].ipr_id= tsvData[i].ipr_id.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


            }



        }
        else if(key===5){
          tsvData= JSON.parse(JSON.stringify(value_DM));

          for(var i in tsvData){
              tsvData[i].ipr= tsvData[i].ipr.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


            }

        }
        else if(key===6){
          tsvData= JSON.parse(JSON.stringify(value_DBANK));
          //console.log(DM_a);
          for(var i in tsvData){
              tsvData[i].idurl= tsvData[i].idurl.replace(/(<([^>]+)>)/ig, '')




            }

        }

      }


    if(selectedValue.length===0){
      value_GM=[];
      value_GB=[];
      value_PW=[];
      value_DM=[];
      value_PROT=[];
      value_DBANK = [];

    }
    else if(selectedValue.length===1){

      let name1="GM_"
      let name2="GB_"
      let name3="PW_"
      let name4="DM_"
      let name5="PROT_"
      let name6="DBANK_"
      let concat_name_GM =name1+selectedValue[0];
      let concat_name_GB =name2+selectedValue[0];
      let concat_name_PW =name3+selectedValue[0];
      let concat_name_DM =name4+selectedValue[0];
      let concat_name_PROT =name5+selectedValue[0];
      let concat_name_DBANK =name6+selectedValue[0];
      value_GM=eval(concat_name_GM);
      value_GB=eval(concat_name_GB);
      value_PW=eval(concat_name_PW);
      value_DM=eval(concat_name_DM);
      value_PROT=eval(concat_name_PROT);
      value_DBANK=eval(concat_name_DBANK);
      exportTsv();


  }
    else if(selectedValue.length===2){
      if(selectedValue.includes("a") && selectedValue.includes("b") ){
        value_GM=_.union(GM_a,GM_b);
        value_GB=_.union(GB_a,GB_b);
        value_PW=_.union(PW_a,PW_b);
        value_DM=_.union(DM_a,DM_b);
        value_PROT=_.union(PROT_a,PROT_b);
        value_DBANK=_.union(DBANK_a,DBANK_b);
        exportTsv();
        //console.log(value_GM);
      }
      else if(selectedValue.includes("a") && selectedValue.includes("c")){
        value_GM=_.union(GM_a,GM_c);
        value_GB=_.union(GB_a,GB_c);
        value_PW=_.union(PW_a,PW_c);
        value_DM=_.union(DM_a,DM_c);
        value_PROT=_.union(PROT_a,PROT_c);
        value_DBANK=_.union(DBANK_a,DBANK_c);
        exportTsv();
        //console.log(value_GM);
      }
      else if(selectedValue.includes("b") && selectedValue.includes("c")){
        value_GM=_.union(GM_b,GM_c);
        value_GB=_.union(GB_b,GB_c);
        value_PW=_.union(PW_b,PW_c);
        value_DM=_.union(DM_b,DM_c);
        value_PROT=_.union(PROT_b,PROT_c);
        value_DBANK=_.union(DBANK_b,DBANK_c);
        exportTsv();
        //console.log(value_GM);
      }


}

    else if(selectedValue.length===3){
        value_GM=_.union(GM_a,GM_b,GM_c);
        value_GB=_.union(GB_a,GB_b,GB_c);
        value_PW=_.union(PW_a,PW_b,PW_c);
        value_DM=_.union(DM_a,DM_b,DM_c);
        value_PROT=_.union(PROT_a,PROT_b,PROT_b);
        value_DBANK=_.union(DBANK_a,DBANK_b,DBANK_c);
        exportTsv();

      }


let checkBoxComponent="";
      if(checked===true){
        checkBoxComponent =
         <div className="regions_upset">
          <CheckboxGroup name="regions" id="regions" onChange={this.handleChange} checkboxDepth={5} value={selectedValue} >
            <label id="b_upset"><Checkbox value="b" className="b_upset"/>Q1</label><br/>
            <label id="a_upset"><Checkbox  value="a" className="a_upset"/>Q2</label><br/>
            <label id="c_upset"><Checkbox value="c" className="c_upset" />Q1∩Q2</label><br/>

          </CheckboxGroup>
          </div>

        d3.select("body").select("#upset2").selectAll("*").remove();
          if(key===1){
            const sets = [
              { sets: [0],"label": PROT_b.length+ '' , size: 175},
              { sets: [1],"label": PROT_a.length+ '' ,size: 175},
              { sets: [0, 1], "label": PROT_c.length+ '',size: 75 }
            ];


            this.drawUpset(sets)



          }

          else if(key===2){


            const sets = [
              { sets: [0],"label": GM_b.length+ '' , size: 175},
              { sets: [1],"label": GM_a.length+ '' ,size: 175},
              { sets: [0, 1], "label": GM_c.length+ '',size: 75 }
            ];

            this.drawUpset(sets)



          }
          else if(key===3 ){

          const sets = [
            { sets: [0], "label": GB_b.length+ '' , size: 175},
            { sets: [1], "label": GB_a.length+ '' , size: 175},
            { sets: [0, 1], "label": GB_c.length+ '' , size: 75 }
          ];

          this.drawUpset(sets)



          }
          else if(key===4 ){

          const sets = [
            { sets: [0],"label": PW_b.length+ '' ,  size: 175},
            { sets: [1], "label": PW_a.length+ '' , size: 175},
            { sets: [0, 1],"label": PW_c.length+ '' ,  size: 75}
          ];

          this.drawUpset(sets)




          }
          else if(key===5){

          const sets = [
            { sets: [0], "label": DM_b.length+ '' , size: 175},
            { sets: [1], "label": DM_a.length+ '' , size: 175},
            { sets: [0, 1], "label": DM_c.length+ '' , size: 75 }
          ];


          this.drawUpset(sets)


          }
          else if(key===6){

          const sets = [
            { sets: [0], "label": DBANK_b.length+ '' , size: 175},
            { sets: [1], "label": DBANK_a.length+ '' , size: 175},
            { sets: [0, 1], "label": DBANK_c.length+ '' , size: 75 }
          ];


          this.drawUpset(sets)


          }
        }
    else{
      checkBoxComponent =
       <div className="regions2">
        <CheckboxGroup name="regions" id="regions" onChange={this.handleChange} checkboxDepth={5} value={selectedValue} >
          <label id="b"><Checkbox value="b" className="b_region"/>Q1</label>
          <label id="c"><Checkbox value="c" className="c_region" />Q1∩Q2</label>
          <label id="a"><Checkbox  value="a" />Q2</label>

        </CheckboxGroup>
        </div>

      d3.select("body").select("#upset").selectAll("*").remove();
      if(key===1){
        const sets = [
          { sets: [0],"label": PROT_b.length+ '' , size: 175,text2:"b"},
          { sets: [1],"label": PROT_a.length+ '' ,size: 175,text2:"a"},
          { sets: [0, 1], "label": PROT_c.length+ '',size: 75,text2:"c" }
        ];

        const chart = VennDiagram().width(450).height(350);

        const div = select(this.diagram);
        div.datum(sets).call(chart);
       mouseClick(div);



      }

      else if(key===2){


        const sets = [
          { sets: ["b"],"label": GM_b.length+ '' , size: 175},
          { sets: ["a"],"label": GM_a.length+ '' ,size: 175},
          { sets: ["b", "a"], "label": GM_c.length+ '',size: 75 }
        ];
        const chart = VennDiagram().width(450).height(350);

        const div = select(this.diagram);
        div.datum(sets).call(chart);
        mouseClick(div);


      }
      else if(key===3 ){

      const sets = [
        { sets: [0], "label": GB_b.length+ '' , size: 175},
        { sets: [1], "label": GB_a.length+ '' , size: 175},
        { sets: [0, 1], "label": GB_c.length+ '' , size: 75 }
      ];
      const chart = VennDiagram().width(450).height(350);

      const div = select(this.diagram);
      div.datum(sets).call(chart);
      mouseClick(div);



      }
      else if(key===4 ){

      const sets = [
        { sets: [0],"label": PW_b.length+ '' ,  size: 175},
        { sets: [1], "label": PW_a.length+ '' , size: 175},
        { sets: [0, 1],"label": PW_c.length+ '' ,  size: 75}
      ];
      const chart = VennDiagram().width(450).height(350);

      const div = select(this.diagram);
      div.datum(sets).call(chart);
      mouseClick(div);



      }
      else if(key===5){

      const sets = [
        { sets: [0], "label": DM_b.length+ '' , size: 175},
        { sets: [1], "label": DM_a.length+ '' , size: 175},
        { sets: [0, 1], "label": DM_c.length+ '' , size: 75 }
      ];
      const chart = VennDiagram().width(450).height(350);

      const div = select(this.diagram);
      div.datum(sets).call(chart);
      mouseClick(div);


      }
      else if(key===6){

      const sets = [
        { sets: [0], "label": DBANK_b.length+ '' , size: 175},
        { sets: [1], "label": DBANK_a.length+ '' , size: 175},
        { sets: [0, 1], "label": DBANK_c.length+ '' , size: 75 }
      ];
      const chart = VennDiagram().width(450).height(350);

      const div = select(this.diagram);
      div.datum(sets).call(chart);
      mouseClick(div);


      }
    }

    //PREVIEW QUERY
       var a = preview.preview
       var words = []
       var queryCamelCase=[]
       a.replace(/\[(.+?)\]/g, function($0, $1) { words.push($1) })
       words[0]=words[0].replace("[","");
       words[0]=words[0].replace(new RegExp(',', 'g'), " ");
       words[1]=words[1].replace(new RegExp(',', 'g'), " ");
       for(var i=0 ;i<words.length;i++){
         words[i]=words[i].replace(/protein_accession/g,"UniprotKB Accession");
         words[i]=words[i].replace(/protein_id/g,"UniprotKB Entry Name");
         words[i]=words[i].replace(/refseq/g,"RefSeq Protein");
         words[i]=words[i].replace(/refseq_nt/g,"RefSeq Nucleotide");
         words[i]=words[i].replace(/ensembl/g,"Ensembl Gene");
         words[i]=words[i].replace(/ensembl_pro/g,"Ensembl Protein");
         words[i]=words[i].replace(/ensembl_trs/g,"Ensembl Transcript");
         words[i]=words[i].replace(/disease_identifier/g,"Disease Name");
         words[i]=words[i].replace(/disease_mim/g,"MIM ID");
         words[i]=words[i].replace(/gene_name/,"Gene Name");
         words[i]=words[i].replace(/geneid/g,"Gene ID");
         words[i]=words[i].replace(/gene_name/g,"Gene Name");
         words[i]=words[i].replace(/embl/g,"EMBL");
         words[i]=words[i].replace(/embl-cds/g,"EMBL-CDS");
         words[i]=words[i].replace(/pdb_pdb/g,"PDB");
         words[i]=words[i].replace(/domain_iprid/g,"InterPro");
         words[i]=words[i].replace(/domain_name/g,"InterPro Name");
         words[i]=words[i].replace(/domain_pfam/g,"PFAM ID");
         words[i]=words[i].replace(/go_id/g,"GO ID");
         words[i]=words[i].replace(/goterms_name/g,"GO Name");
         words[i]=words[i].replace(/disease_acronym/g,"Disease Acronym");
         words[i]=words[i].replace(/pathway_id/g,"Reactome ID");
         words[i]=words[i].replace(/pathway_name/g,"Reactome Name");
         words[i]=words[i].replace(/taxon_name/g,"Organism Name");
         words[i]=words[i].replace(/protein_taxonid/g,"Taxon ID");
         words[i]=words[i].replace(/allergome/g,"Allergome");
         words[i]=words[i].replace(/biocyc/g,"BioCyc");
         words[i]=words[i].replace(/biogrid/g,"BioGrid");
         words[i]=words[i].replace(/biomuta/g,"BioMuta");
         words[i]=words[i].replace(/chembl/g,"ChEMBL");
         words[i]=words[i].replace(/dictybase/g,"dictyBase");
         words[i]=words[i].replace(/drugbank/g,"DrugBank");
         words[i]=words[i].replace(/echobase/g,"EchoBASE");
         words[i]=words[i].replace(/flybase/g,"FlyBase");
         words[i]=words[i].replace(/genecards/g,"GeneCards");
         words[i]=words[i].replace(/genedb/g,"GeneDB");
         words[i]=words[i].replace(/genereviews/g,"GeneReviews");
         words[i]=words[i].replace(/hgnc/g,"HGNC");
         words[i]=words[i].replace(/kegg/g,"KEGG");
         words[i]=words[i].replace(/orthodb/g,"OrthoDB");
         words[i]=words[i].replace(/peroxibase/g,"PeroxiBase");
         words[i]=words[i].replace(/pombase/g,"PomBase");
         words[i]=words[i].replace(/protein_name/g,"Protein Name");
         words[i]=words[i].replace(/publication_pmid/g,"PMID");
         words[i]=words[i].replace(/publication_title/g,"Publication Title");
         words[i]=words[i].replace(/rebase/g,"REBASE");
         words[i]=words[i].replace(/rgd/g,"RGD");
         words[i]=words[i].replace(/sgd/g,"SGD");
         words[i]=words[i].replace(/string/g,"STRING");
         words[i]=words[i].replace(/unigene/g,"UniGene");
         words[i]=words[i].replace(/uniparc/g,"UniParc");
         words[i]=words[i].replace(/unipathway/g,"UniPathway");
         words[i]=words[i].replace(/uniref100/g,"UniRef100");
         words[i]=words[i].replace(/uniref50/g,"UniRef50");
         words[i]=words[i].replace(/uniref90/g,"UniRef90");
         words[i]=words[i].replace(/vectorbase/g,"VectorBase");
         words[i]=words[i].replace(/wormbase/g,"WormBase");
         words[i]=words[i].replace(/xenbase/g,"Xenbase");


         if(words[i]==="uniprot_accession"){
          words[i]=words[i].replace("uniprot_accession","Uniprot Accession");
         }
         else if(words[i]==="uniprot_id"){
             words[i]=words[i].replace("uniprot_id","Uniprot ID");
         }
         else if(words[i]==="refid"){
             words[i]=words[i].replace("refid","RefSeq ID");
         }
         else if(words[i]==="ensembl_id"){
             words[i]=words[i].replace("ensembl_id","Ensembl ID");
         }
       }

       function trClassFormat(rowData, rIndex) {
         return rIndex % 2 === 0 ? 'tr-function-even-number' : 'tr-function-odd-number';
       }


    return (
    <div className="ResultPageMain">
    {isLoading ?(
              <div className="ResultPage">
                <Loading/>
              </div>

            ) : (
              <div className="ResultPage">
              <div className="right">
                  <p className="query1_preview"> Q1:{words[0]}</p>
                  <p className="query2_preview"> Q2: {words[1]}</p>

                  <Switch
                    onChange={this.handleChange2}
                    checked={this.state.checked}
                    id="normal-switch"
                    offColor="#5cb85c"
                    onColor="#5cb85c"

                    uncheckedIcon={
                  <div
                    style={{
                      justifyContent: "center",
                      alignItems: "center",
                      fontSize: 12,
                      color: "white",
                      paddingLeft: -10,
                      display: 'inline-block',
                      marginTop: 5,
                      fontWeight: 'bold',
                    }}
                  >
                  VENN

                  </div>
                }
                checkedIcon={
                  <div
                    style={{
                      justifyContent: "center",
                      alignItems: "center",
                      fontSize: 12,
                      color: "white",
                      paddingRight: 80,
                      display: 'inline-block',
                      marginTop: 5,
                      fontWeight: 'bold',
                      marginLeft:4

                    }}
                  >
                    UPSET
                  </div>
                }
                height={25}
                width={70}
                  />

                      <div id="upset" />
                      {checkBoxComponent}
                      <div id="upset2" ref={ diagram => this.diagram = diagram } className='test-venn-diagram' onChange={this.handleChange}/>
                      {this.handleVennChange}




                </div>

                <div className="left">

                <div className="button_top">
                  <Link to="/"><button className="add_query" onClick={this.closeConnection} >New Query </button></Link>
                  <CSVLink data={tsvData} filename={"prosetcomp.tsv"} separator={"\t"} ><button className="exportTSV">Export TSV</button></CSVLink>

                </div>
                      <Tabs defaultActiveKey={1} className="myClass" id="uncontrolled-tab-example" onSelect={this.handleSelect} >

                      <Tab eventKey={1} title="Protein">
                      <BootstrapTable  data={ value_PROT } trClassName={ trClassFormat }  options={this.options} pagination >
                          <TableHeaderColumn width={'15%'} dataField='accession' dataFormat={ this.formatNameAccession } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>ACCESSION</TableHeaderColumn>
                          <TableHeaderColumn  dataField='name' dataFormat={ this.formatNameName } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } }  dataSort>NAME</TableHeaderColumn>
                          <TableHeaderColumn width={'10%'}  dataField='taxon_id' dataAlign='center' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } >TAXON ID</TableHeaderColumn>
                          <TableHeaderColumn width={'20%'} dataField='taxon_name'  dataAlign='center' dataSort filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } >TAXON NAME</TableHeaderColumn>
                          <TableHeaderColumn width={'15%'}  dataField='is_reviewed'  dataAlign='center' dataSort>IS REVIEWED</TableHeaderColumn>
                          <TableHeaderColumn  dataAlign='center' dataFormat={this.formatLinksProtein}>LINKS</TableHeaderColumn>
                      </BootstrapTable>

                      </Tab>


                      <Tab eventKey={2} title="Molecular Function">
                        <BootstrapTable   data={ value_GM} trClassName={ trClassFormat } striped
                        expandableRow={ this.isExpandableRow }
                        expandComponent={ this.expandComponent } pagination  >
                            <TableHeaderColumn dataField='go_id' dataFormat={ this.formatNameGo_Id } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>GO TERM ID</TableHeaderColumn>
                            <TableHeaderColumn dataField='parents' dataFormat={ this.formatNameParents } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >PARENTS</TableHeaderColumn>
                            <TableHeaderColumn width={'15%'} dataField='depth' dataAlign='center' dataSort >DEPTH</TableHeaderColumn>
                            <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionMolecular.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                        </BootstrapTable>
                      </Tab>



                        <Tab eventKey={3} title="Biological Process">
                            <BootstrapTable   data={ value_GB } trClassName={ trClassFormat } pagination >
                                <TableHeaderColumn  dataField='go_id' dataFormat={ this.formatNameGo_Id } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>GO TERM ID</TableHeaderColumn>

                                <TableHeaderColumn  dataField='parents' dataFormat={this.formatNameParents} filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >PARENTS</TableHeaderColumn>
                                <TableHeaderColumn dataField='depth' dataAlign='center' dataSort >DEPTH</TableHeaderColumn>
                                <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionBiological.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                            </BootstrapTable>
                           </Tab>

                       <Tab eventKey={4} title="Pathway">
                           <BootstrapTable   data={ value_PW} trClassName={ trClassFormat } pagination >
                               <TableHeaderColumn dataField='ipr_id' dataFormat={ this.formatNameIpr_Id } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } }  isKey dataSort>REACTOME ID</TableHeaderColumn>

                               <TableHeaderColumn dataField='parents' dataFormat={this.formatNameParentsForPathway} filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } >PARENTS</TableHeaderColumn>
                               <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionPathway.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                           </BootstrapTable>

                        </Tab>
                        <Tab eventKey={5} title="Domain">
                        <BootstrapTable   data={ value_DM} trClassName={ trClassFormat }  pagination >
                            <TableHeaderColumn dataField='ipr' dataFormat={ this.formatNameIpr } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>IPR</TableHeaderColumn>

                            <TableHeaderColumn dataField='parents'  filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } dataFormat={ this.formatNameParents }>PARENTS</TableHeaderColumn>
                            <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionDomain.bind(this)}>RELATED PROTEINS</TableHeaderColumn>

                        </BootstrapTable>

                        </Tab>

                        <Tab eventKey={6} title="DrugBank">
                        <BootstrapTable   data={ value_DBANK}  trClassName={ trClassFormat } pagination >

                        <TableHeaderColumn dataField='idurl' isKey dataFormat={this.formatIdUrl} dataSort filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >ID URL</TableHeaderColumn>
                        <TableHeaderColumn dataField='name' dataAlign='center'  >NAME</TableHeaderColumn>
                        <TableHeaderColumn width={'15%'} dataField='syn' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >SYN</TableHeaderColumn>
                        <TableHeaderColumn width={'25%'} dataField='def' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >DEFINITION</TableHeaderColumn>
                        <TableHeaderColumn width={'30%'}dataField='action' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >ACTION</TableHeaderColumn>
                        <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionDrugBank.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                        </BootstrapTable>
                        </Tab>
                      </Tabs>

                      <Modal open={open} onClose={this.onCloseModal}>
                        <h2>RELATED PROTEINS</h2>
                        <BootstrapTable  ref='table'  data={data}  trClassName={ trClassFormat } options={this.options}   pagination  >
                        <TableHeaderColumn ref='nameCol' width={'15%'} dataField='accession' dataFormat={ this.formatNameAccession } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>ACCESSION</TableHeaderColumn>
                        <TableHeaderColumn dataField='name' dataFormat={ this.formatNameName } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } dataSort>NAME</TableHeaderColumn>
                        <TableHeaderColumn  width={'10%'} dataField='taxon_id' dataAlign='center' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } }>TAXON ID</TableHeaderColumn>
                        <TableHeaderColumn width={'20%'} dataField='taxon_name'dataAlign='center' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } dataSort>TAXON NAME</TableHeaderColumn>
                        <TableHeaderColumn width={'15%'} dataField='is_reviewed'  dataAlign='center' dataSort >IS REVIEWED</TableHeaderColumn>
                        <TableHeaderColumn  dataAlign='center' dataFormat={this.formatLinksProtein}>LINKS</TableHeaderColumn>
                          </BootstrapTable>

                      </Modal>


                          <button className="leftbutton"></button>
                </div>



              </div>
        )}
    </div>
    );
  }
}

export default ResultPageTwoQuery;
