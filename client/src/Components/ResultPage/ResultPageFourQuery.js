/* eslint-disable */
/* eslint no-eval: 0 */
import React, { Component } from 'react';
import { Tabs } from 'react-bootstrap';
import { Tab } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import axios from 'axios';
import {Checkbox, CheckboxGroup} from 'react-checkbox-group';
import _ from 'underscore';
import './ResultPage4.css';
import * as d3 from 'd3'
import {BootstrapTable, TableHeaderColumn,ExportCSVButton } from 'react-bootstrap-table';
import {CSVLink} from 'react-csv';
import ReactTextCollapse from 'react-text-collapse';

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


class ResultPageFourQuery extends Component {
  constructor(props) {
    super(props)
    this.state = {
    GM_a: [],GM_b: [],GM_c: [],GM_d: [],GM_e: [],GM_f: [],GM_g: [],GM_h: [],GM_i: [],GM_j: [],
    GM_k: [],GM_l: [],GM_m: [],GM_n: [],GM_o: [],
    GB_a: [],GB_b: [],GB_c: [],GB_d: [],GB_e: [],GB_f: [],GB_g: [],GB_h: [],GB_i: [],GB_j: [],
    GB_k: [],GB_l: [],GB_m: [],GB_n: [],GB_o: [],
    PW_a: [],PW_b: [],PW_c: [],PW_d: [],PW_e: [],PW_f: [],PW_g: [],PW_h: [],PW_i: [],PW_j: [],
    PW_k: [],PW_l: [],PW_m: [],PW_n: [],PW_o: [],
    DM_a: [],DM_b: [],DM_c: [],DM_d: [],DM_e: [],DM_f: [],DM_g: [],DM_h: [],DM_i: [],DM_j: [],
    DM_k: [],DM_l: [],DM_m: [],DM_n: [],DM_o: [],
    PROT_a: [],PROT_b: [],PROT_c: [],PROT_d: [],PROT_e: [],PROT_f: [],PROT_g: [],PROT_h: [],PROT_i: [],PROT_j: [],
    PROT_k: [],PROT_l: [],PROT_m: [],PROT_n: [],PROT_o: [],
    selectedValue:["o"],
    key:1,
     preview:this.props.location.state,


    }
    this.options = {
     defaultSortName: 'taxon_name',  // default sort column name
     defaultSortOrder: 'asc'  // default sort order
   };
      this.handleChange = this.handleChange.bind(this);
      this.handleSelect = this.handleSelect.bind(this);

  }
  componentDidMount(){
    this.getAccession();
  }

  getAccession(){

    Promise.all([
         axios.get('http://localhost:9000/protein/gm'),
         axios.get('http://localhost:9000/protein/gb'),
         axios.get('http://localhost:9000/protein/pw'),
         axios.get('http://localhost:9000/protein/dm'),
         axios.get('http://localhost:9000/protein/prot')
       ]).then(result => {
            this.setState({
          GM_a: result[0].data[0],GM_b: result[0].data[1],GM_c: result[0].data[2],GM_d: result[0].data[3],
          GM_e: result[0].data[4],GM_f: result[0].data[5], GM_g: result[0].data[6],GM_h: result[0].data[7],
          GM_i: result[0].data[8],GM_j: result[0].data[9],GM_k: result[0].data[10],GM_l: result[0].data[11],
          GM_m: result[0].data[12], GM_n: result[0].data[13],GM_o: result[0].data[14],

          GB_a: result[1].data[0],GB_b: result[1].data[1],GB_c: result[1].data[2],GB_d: result[1].data[3],
          GB_e: result[1].data[4],GB_f: result[1].data[5],GB_g: result[1].data[6],GB_h: result[1].data[7],
          GB_i: result[1].data[8],GB_j: result[1].data[9],GB_k: result[1].data[10],GB_l: result[1].data[11],
          GB_m: result[1].data[12],GB_n: result[1].data[13],GB_o: result[1].data[14],

          PW_a: result[2].data[0],PW_b: result[2].data[1],PW_c: result[2].data[2],PW_d: result[2].data[3],
          PW_e: result[2].data[4],PW_f: result[2].data[5],PW_g: result[2].data[6],PW_h: result[2].data[7],
          PW_i: result[2].data[8],PW_j: result[2].data[9],PW_k: result[2].data[10],PW_l: result[2].data[11],
          PW_m: result[2].data[12],PW_n: result[2].data[13],PW_o: result[2].data[14],

          DM_a: result[3].data[0],DM_b: result[3].data[1],DM_c: result[3].data[2],DM_d: result[3].data[3],
          DM_e: result[3].data[4],DM_f: result[3].data[5],DM_g: result[3].data[6],DM_h: result[3].data[7],
          DM_i: result[3].data[8],DM_j: result[3].data[9],DM_k: result[3].data[10],DM_l: result[3].data[11],
          DM_m: result[3].data[12],DM_n: result[3].data[13],DM_o: result[3].data[14],

          PROT_a: result[4].data[0],PROT_b: result[4].data[1],PROT_c: result[4].data[2],PROT_d: result[4].data[3],
          PROT_e: result[4].data[4],PROT_f: result[4].data[5],PROT_g: result[4].data[6],PROT_h: result[4].data[7],
          PROT_i: result[4].data[8],PROT_j: result[4].data[9],PROT_k: result[4].data[10],PROT_l: result[4].data[11],
          PROT_m: result[4].data[12],PROT_n: result[4].data[13],PROT_o: result[4].data[14],

          });


      });

}

handleChange(value) {
  this.setState({selectedValue: value});

}
handleSelect(key) {

    this.setState({ key: key });
}

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


  render() {
    function drawUpset(sets){
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

          for( i=0; i<rows; i++) {
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
   const {GM_a,GM_b,GM_c ,GM_d,GM_e,GM_f ,GM_g,GM_h,GM_i,GM_j ,GM_k,GM_l,GM_m ,GM_n,GM_o,
          GB_a,GB_b,GB_c ,GB_d,GB_e,GB_f ,GB_g,GB_h,GB_i,GB_j ,GB_k,GB_l,GB_m ,GB_n,GB_o,
          PW_a,PW_b,PW_c ,PW_d,PW_e,PW_f ,PW_g,PW_h,PW_i,PW_j ,PW_k,PW_l,PW_m ,PW_n,PW_o,
          DM_a,DM_b,DM_c ,DM_d,DM_e,DM_f ,DM_g,DM_h,DM_i,DM_j ,DM_k,DM_l,DM_m ,DM_n,DM_o,
          PROT_a,PROT_b,PROT_c ,PROT_d,PROT_e,PROT_f ,PROT_g,PROT_h,PROT_i,PROT_j ,PROT_k,PROT_l,PROT_m ,PROT_n,PROT_o,
          selectedValue,key,preview} =this.state;
      let value_GM =GM_o;
      let value_GB=GB_o;
      let value_PW=PW_o;
      let value_DM=DM_o;
      let value_PROT=PROT_o;
      var tsvData="";

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
              tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


            }

      }
      else if(key===3){
        tsvData= JSON.parse(JSON.stringify(value_GB));
        for(var i in tsvData){
            tsvData[i].go_id= tsvData[i].go_id.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }

      }
      else if(key===4){
        tsvData= JSON.parse(JSON.stringify(value_PW));

        for(var i in tsvData){
            tsvData[i].ipr_id= tsvData[i].ipr_id.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }


      }
      else if(key===5){
        tsvData= JSON.parse(JSON.stringify(value_DM));

        for(var i in tsvData){
            tsvData[i].ipr= tsvData[i].ipr.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }

      }

    }

      let checkBoxComponent =
               <div className="regions_upset">
                <CheckboxGroup name="regions4" id="regions4" onChange={this.handleChange} checkboxDepth={5} value={selectedValue} >
                  <label id="h_upset4"><Checkbox value="h" className="h_upset4"/>Q1</label><br/>
                  <label id="d_upset4"><Checkbox value="d" className="d_upset4"/>Q2</label><br/>
                  <label id="b_upset4"><Checkbox value="b" className="b_upset4"/>Q3</label><br/>
                  <label id="a_upset4"><Checkbox value="a" className="a_upset4"/>Q4</label><br/>
                  <label id="l_upset4"><Checkbox value="l" className="l_upset4"/>Q1∩Q2</label><br/>
                  <label id="j_upset4"><Checkbox value="j" className="j_upset4"/>Q1∩Q3</label><br/>
                  <label id="i_upset4"><Checkbox value="i" className="i_upset4"/>Q1∩Q4</label><br/>
                  <label id="f_upset4"><Checkbox value="f" className="f_upset4"/>Q2∩Q3</label><br/>
                  <label id="e_upset4"><Checkbox value="e" className="e_upset4"/>Q2∩Q4</label><br/>
                  <label id="c_upset4"><Checkbox value="c" className="c_upset4"/>Q3∩Q4</label><br/>
                  <label id="n_upset4"><Checkbox value="n" className="n_upset4"/>Q1∩Q2∩Q3</label><br/>
                  <label id="m_upset4"><Checkbox value="m" className="m_upset4"/>Q1∩Q2∩Q4</label><br/>
                  <label id="k_upset4"><Checkbox value="k" className="k_upset4"/>Q1∩Q3∩Q4</label><br/>
                  <label id="g_upset4"><Checkbox value="g" className="g_upset4"/>Q2∩Q3∩Q4</label><br/>
                  <label id="o_upset4"><Checkbox value="o" className="o_upset4"/>Q1∩Q2∩Q3∩Q4</label><br/>
                </CheckboxGroup>
                </div>

     if(key===1 ){


        const sets = [
          {"sets": [0], "label": PROT_h.length+'', "size": 150},
          {"sets": [1], "label": PROT_d.length+'', "size": 145},
          {"sets": [2], "label":  PROT_b.length+'', "size": 150},
          {"sets": [3], "label":  PROT_a.length+'', "size": 145},
          {"sets": [0, 1], "label":PROT_l.length+'', "size": 90},
          {"sets": [0, 2], "label":PROT_j.length+'', "size": 65},
          {"sets": [0, 3], "label":PROT_i.length+'', "size": 65},
          {"sets": [1, 2], "label": PROT_f.length+'', "size": 65},
          {"sets": [1, 3], "label": PROT_e.length+'', "size": 85},
          {"sets": [2, 3], "label": PROT_c.length+'', "size": 65},
          {"sets": [0, 1, 2], "label":PROT_n.length+'', "size":35},
          {"sets": [0, 1, 3], "label":PROT_m.length+'', "size":35},
          {"sets": [0, 2, 3], "label":PROT_k.length+'', "size":35},
          {"sets": [1, 2, 3], "label":PROT_g.length+'', "size":35},
          {"sets": [0, 1, 2,3], "label":PROT_o.length+'', "size":5},



        ];


        drawUpset(sets)
      }

    else if(key===2 ){


        const sets = [
          {"sets": [0], "label": GM_h.length+'', "size": 2500},
          {"sets": [1], "label": GM_d.length+'', "size": 2500},
          {"sets": [2], "label":  GM_b.length+'', "size": 2500},
          {"sets": [3], "label":  GM_a.length+'', "size": 2500},
          {"sets": [0, 1], "label":GM_l.length+'', "size": 600},
          {"sets": [0, 2], "label":GM_j.length+'', "size": 200},
          {"sets": [0, 3], "label":GM_i.length+'', "size": 600},
          {"sets": [1, 2], "label": GM_f.length+'', "size": 600},
          {"sets": [1, 3], "label": GM_e.length+'', "size": 200},
          {"sets": [2, 3], "label": GM_c.length+'', "size": 600},
          {"sets": [0, 1, 2], "label":GM_n.length+'', "size":350},
          {"sets": [0, 1, 3], "label":GM_m.length+'', "size":350},
          {"sets": [0, 2, 3], "label":GM_k.length+'', "size":350},
          {"sets": [1, 2, 3], "label":GM_g.length+'', "size":350},
          {"sets": [0, 1, 2,3], "label":GM_o.length+'', "size":50},


        ];


        drawUpset(sets)
      }
      else if(key===3 ){


        const sets = [
          {"sets": [0], "label": GB_h.length+'', "size": 150},
          {"sets": [1], "label": GB_d.length+'', "size": 145},
          {"sets": [2], "label":  GB_b.length+'', "size": 150},
          {"sets": [3], "label":  GB_a.length+'', "size": 145},
          {"sets": [0, 1], "label":GB_l.length+'', "size": 90},
          {"sets": [0, 2], "label":GB_j.length+'', "size": 65},
          {"sets": [0, 3], "label":GB_i.length+'', "size": 65},
          {"sets": [1, 2], "label": GB_f.length+'', "size": 65},
          {"sets": [1, 3], "label": GB_e.length+'', "size": 85},
          {"sets": [2, 3], "label": GB_c.length+'', "size": 65},
          {"sets": [0, 1, 2], "label":GB_n.length+'', "size":35},
          {"sets": [0, 1, 3], "label":GB_m.length+'', "size":35},
          {"sets": [0, 2, 3], "label":GB_k.length+'', "size":35},
          {"sets": [1, 2, 3], "label":GB_g.length+'', "size":35},
          {"sets": [0, 1, 2,3], "label":GB_o.length+'', "size":5},



        ];


        drawUpset(sets)
      }
      else if(key===4 ){


        const sets = [
          {"sets": [0], "label": PW_h.length+'', "size": 150},
          {"sets": [1], "label": PW_d.length+'', "size": 145},
          {"sets": [2], "label":  PW_b.length+'', "size": 150},
          {"sets": [3], "label":  PW_a.length+'', "size": 145},
          {"sets": [0, 1], "label":PW_l.length+'', "size": 90},
          {"sets": [0, 2], "label":PW_j.length+'', "size": 65},
          {"sets": [0, 3], "label":PW_i.length+'', "size": 65},
          {"sets": [1, 2], "label": PW_f.length+'', "size": 65},
          {"sets": [1, 3], "label": PW_e.length+'', "size": 85},
          {"sets": [2, 3], "label": PW_c.length+'', "size": 65},
          {"sets": [0, 1, 2], "label":PW_n.length+'', "size":35},
          {"sets": [0, 1, 3], "label":PW_m.length+'', "size":35},
          {"sets": [0, 2, 3], "label":PW_k.length+'', "size":35},
          {"sets": [1, 2, 3], "label":PW_g.length+'', "size":35},
          {"sets": [0, 1, 2,3], "label":PW_o.length+'', "size":5},



        ];

        drawUpset(sets)
      }
      else if(key===5 ){


        const sets = [
          {"sets": [0], "label": DM_h.length+'', "size": 150},
          {"sets": [1], "label": DM_d.length+'', "size": 145},
          {"sets": [2], "label":  DM_b.length+'', "size": 150},
          {"sets": [3], "label":  DM_a.length+'', "size": 145},
          {"sets": [0, 1], "label":DM_l.length+'', "size": 90},
          {"sets": [0, 2], "label":DM_j.length+'', "size": 65},
          {"sets": [0, 3], "label":DM_i.length+'', "size": 65},
          {"sets": [1, 2], "label": DM_f.length+'', "size": 65},
          {"sets": [1, 3], "label": DM_e.length+'', "size": 85},
          {"sets": [2, 3], "label": DM_c.length+'', "size": 65},
          {"sets": [0, 1, 2], "label":DM_n.length+'', "size":35},
          {"sets": [0, 1, 3], "label":DM_m.length+'', "size":35},
          {"sets": [0, 2, 3], "label":DM_k.length+'', "size":35},
          {"sets": [1, 2, 3], "label":DM_g.length+'', "size":35},
          {"sets": [0, 1, 2,3], "label":DM_o.length+'', "size":5},


        ];


        drawUpset(sets)
      }


        if(selectedValue.length===1){
          let name1="GM_"
          let name2="GB_"
          let name3="PW_"
          let name4="DM_"
          let name5= "PROT_"
          let concat_name_GM =name1+selectedValue[0];
          let concat_name_GB =name2+selectedValue[0];
          let concat_name_PW =name3+selectedValue[0];
          let concat_name_DM =name4+selectedValue[0];
          let concat_name_PROT =name5+selectedValue[0];
          value_GM=eval(concat_name_GM);
          value_GB=eval(concat_name_GB);
          value_PW=eval(concat_name_PW);
          value_DM=eval(concat_name_DM);
          value_PROT=eval(concat_name_PROT);
          exportTsv();
  }
        else if(selectedValue.length===2){
          let name1="GM_"
          let name2="GB_"
          let name3="PW_"
          let name4="DM_"
          let name5= "PROT_"
          let concat_name_GM1 =eval(name1+selectedValue[0]);
          let concat_name_GB1 =eval(name2+selectedValue[0]);
          let concat_name_PW1 =eval(name3+selectedValue[0]);
          let concat_name_DM1 =eval(name4+selectedValue[0]);
          let concat_name_PROT1 =eval(name5+selectedValue[0]);
          let concat_name_GM2 =eval(name1+selectedValue[1]);
          let concat_name_GB2 =eval(name2+selectedValue[1]);
          let concat_name_PW2 =eval(name3+selectedValue[1]);
          let concat_name_DM2 =eval(name4+selectedValue[1]);
          let concat_name_PROT2 =eval(name5+selectedValue[1]);
          value_GM=_.union(concat_name_GM1,concat_name_GM2);
          value_GB=_.union(concat_name_GB1,concat_name_GB2);
          value_PW=_.union(concat_name_PW1,concat_name_PW2);
          value_DM=_.union(concat_name_DM1,concat_name_DM2);
          value_PROT=_.union(concat_name_PROT1,concat_name_PROT2);
          exportTsv();


        }
        else if(selectedValue.length===3){
          let name1="GM_"
          let name2="GB_"
          let name3="PW_"
          let name4="DM_"
          let name5= "PROT_"
          let concat_name_GM1 =eval(name1+selectedValue[0]);
          let concat_name_GB1 =eval(name2+selectedValue[0]);
          let concat_name_PW1 =eval(name3+selectedValue[0]);
          let concat_name_DM1 =eval(name4+selectedValue[0]);
          let concat_name_PROT1 =eval(name5+selectedValue[0]);
          let concat_name_GM2 =eval(name1+selectedValue[1]);
          let concat_name_GB2 =eval(name2+selectedValue[1]);
          let concat_name_PW2 =eval(name3+selectedValue[1]);
          let concat_name_DM2 =eval(name4+selectedValue[1]);
          let concat_name_PROT2 =eval(name5+selectedValue[1]);
          let concat_name_GM3 =eval(name1+selectedValue[2]);
          let concat_name_GB3 =eval(name2+selectedValue[2]);
          let concat_name_PW3 =eval(name3+selectedValue[2]);
          let concat_name_DM3 =eval(name4+selectedValue[2]);
          let concat_name_PROT3 =eval(name5+selectedValue[2]);

          value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3);
          value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3);
          value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3);
          value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3);
          value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3);
          exportTsv();


        }
        else if(selectedValue.length===4){
          let name1="GM_"
          let name2="GB_"
          let name3="PW_"
          let name4="DM_"
          let name5= "PROT_"
          let concat_name_GM1 =eval(name1+selectedValue[0]);
          let concat_name_GB1 =eval(name2+selectedValue[0]);
          let concat_name_PW1 =eval(name3+selectedValue[0]);
          let concat_name_DM1 =eval(name4+selectedValue[0]);
          let concat_name_PROT1 =eval(name5+selectedValue[0]);
          let concat_name_GM2 =eval(name1+selectedValue[1]);
          let concat_name_GB2 =eval(name2+selectedValue[1]);
          let concat_name_PW2 =eval(name3+selectedValue[1]);
          let concat_name_DM2 =eval(name4+selectedValue[1]);
          let concat_name_PROT2 =eval(name5+selectedValue[1]);
          let concat_name_GM3 =eval(name1+selectedValue[2]);
          let concat_name_GB3 =eval(name2+selectedValue[2]);
          let concat_name_PW3 =eval(name3+selectedValue[2]);
          let concat_name_DM3 =eval(name4+selectedValue[2]);
          let concat_name_PROT3 =eval(name5+selectedValue[2]);
          let concat_name_GM4 =eval(name1+selectedValue[3]);
          let concat_name_GB4 =eval(name2+selectedValue[3]);
          let concat_name_PW4 =eval(name3+selectedValue[3]);
          let concat_name_DM4 =eval(name4+selectedValue[3]);
          let concat_name_PROT4 =eval(name5+selectedValue[3]);

          value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4);
          value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4);
          value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4);
          value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4);
          value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4);
          exportTsv();


        }
        else if(selectedValue.length===5){
          let name1="GM_"
          let name2="GB_"
          let name3="PW_"
          let name4="DM_"
          let name5= "PROT_"
          let concat_name_GM1 =eval(name1+selectedValue[0]);
          let concat_name_GB1 =eval(name2+selectedValue[0]);
          let concat_name_PW1 =eval(name3+selectedValue[0]);
          let concat_name_DM1 =eval(name4+selectedValue[0]);
          let concat_name_PROT1 =eval(name5+selectedValue[0]);
          let concat_name_GM2 =eval(name1+selectedValue[1]);
          let concat_name_GB2 =eval(name2+selectedValue[1]);
          let concat_name_PW2 =eval(name3+selectedValue[1]);
          let concat_name_DM2 =eval(name4+selectedValue[1]);
          let concat_name_PROT2 =eval(name5+selectedValue[1]);
          let concat_name_GM3 =eval(name1+selectedValue[2]);
          let concat_name_GB3 =eval(name2+selectedValue[2]);
          let concat_name_PW3 =eval(name3+selectedValue[2]);
          let concat_name_DM3 =eval(name4+selectedValue[2]);
          let concat_name_PROT3 =eval(name5+selectedValue[2]);
          let concat_name_GM4 =eval(name1+selectedValue[3]);
          let concat_name_GB4 =eval(name2+selectedValue[3]);
          let concat_name_PW4 =eval(name3+selectedValue[3]);
          let concat_name_DM4 =eval(name4+selectedValue[3]);
          let concat_name_PROT4 =eval(name5+selectedValue[3]);
          let concat_name_GM5 =eval(name1+selectedValue[4]);
          let concat_name_GB5 =eval(name2+selectedValue[4]);
          let concat_name_PW5 =eval(name3+selectedValue[4]);
          let concat_name_DM5 =eval(name4+selectedValue[4]);
          let concat_name_PROT5 =eval(name5+selectedValue[4]);


          value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5);
          value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5);
          value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5);
          value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5);
          value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5);
          exportTsv();


        }
        else if(selectedValue.length===6){
          let name1="GM_"
          let name2="GB_"
          let name3="PW_"
          let name4="DM_"
          let name5= "PROT_"
          let concat_name_GM1 =eval(name1+selectedValue[0]);
          let concat_name_GB1 =eval(name2+selectedValue[0]);
          let concat_name_PW1 =eval(name3+selectedValue[0]);
          let concat_name_DM1 =eval(name4+selectedValue[0]);
          let concat_name_PROT1 =eval(name5+selectedValue[0]);
          let concat_name_GM2 =eval(name1+selectedValue[1]);
          let concat_name_GB2 =eval(name2+selectedValue[1]);
          let concat_name_PW2 =eval(name3+selectedValue[1]);
          let concat_name_DM2 =eval(name4+selectedValue[1]);
          let concat_name_PROT2 =eval(name5+selectedValue[1]);
          let concat_name_GM3 =eval(name1+selectedValue[2]);
          let concat_name_GB3 =eval(name2+selectedValue[2]);
          let concat_name_PW3 =eval(name3+selectedValue[2]);
          let concat_name_DM3 =eval(name4+selectedValue[2]);
          let concat_name_PROT3 =eval(name5+selectedValue[2]);
          let concat_name_GM4 =eval(name1+selectedValue[3]);
          let concat_name_GB4 =eval(name2+selectedValue[3]);
          let concat_name_PW4 =eval(name3+selectedValue[3]);
          let concat_name_DM4 =eval(name4+selectedValue[3]);
          let concat_name_PROT4 =eval(name5+selectedValue[3]);
          let concat_name_GM5 =eval(name1+selectedValue[4]);
          let concat_name_GB5 =eval(name2+selectedValue[4]);
          let concat_name_PW5 =eval(name3+selectedValue[4]);
          let concat_name_DM5 =eval(name4+selectedValue[4]);
          let concat_name_PROT5 =eval(name5+selectedValue[4]);
          let concat_name_GM6 =eval(name1+selectedValue[5]);
          let concat_name_GB6 =eval(name2+selectedValue[5]);
          let concat_name_PW6 =eval(name3+selectedValue[5]);
          let concat_name_DM6 =eval(name4+selectedValue[5]);
          let concat_name_PROT6 =eval(name5+selectedValue[5]);




          value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6);
          value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6);
          value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6);
          value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6);
          value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,concat_name_PROT6);
          exportTsv();


        }
      else if(selectedValue.length===7){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);

          value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
          concat_name_GM7);
          value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
          concat_name_GB7);
          value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
          concat_name_PW7);
          value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
          concat_name_DM7);
          value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
          concat_name_PROT6,concat_name_PROT7);
          exportTsv();


      }
      else if(selectedValue.length===8){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);



        value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
        concat_name_GM7,concat_name_GM8 );
        value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
        concat_name_GB7,concat_name_GB8);
        value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
        concat_name_PW7,concat_name_PW8);
        value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
        concat_name_DM7,concat_name_DM8);
        value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
        concat_name_PROT6,concat_name_PROT7,concat_name_PROT8);
        exportTsv();


      }
      else if(selectedValue.length===9){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);
        let concat_name_GM9 =eval(name1+selectedValue[8]);
        let concat_name_GB9 =eval(name2+selectedValue[8]);
        let concat_name_PW9 =eval(name3+selectedValue[8]);
        let concat_name_DM9 =eval(name4+selectedValue[8]);
        let concat_name_PROT9 =eval(name5+selectedValue[8]);




        value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
        concat_name_GM7,concat_name_GM8,concat_name_GM9 );
        value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
        concat_name_GB7,concat_name_GB8,concat_name_GB9);
        value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
        concat_name_PW7,concat_name_PW8,concat_name_PW9);
        value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
        concat_name_DM7,concat_name_DM8,concat_name_DM9);
        value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
        concat_name_PROT6,concat_name_PROT7,concat_name_PROT8,concat_name_PROT9);
        exportTsv();


      }
      else if(selectedValue.length===10){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);
        let concat_name_GM9 =eval(name1+selectedValue[8]);
        let concat_name_GB9 =eval(name2+selectedValue[8]);
        let concat_name_PW9 =eval(name3+selectedValue[8]);
        let concat_name_DM9 =eval(name4+selectedValue[8]);
        let concat_name_PROT9 =eval(name5+selectedValue[8]);
        let concat_name_GM10 =eval(name1+selectedValue[9]);
        let concat_name_GB10 =eval(name2+selectedValue[9]);
        let concat_name_PW10 =eval(name3+selectedValue[9]);
        let concat_name_DM10 =eval(name4+selectedValue[9]);
        let concat_name_PROT10 =eval(name5+selectedValue[9]);




        value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
        concat_name_GM7,concat_name_GM8,concat_name_GM9 ,concat_name_GM10);
        value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
        concat_name_GB7,concat_name_GB8,concat_name_GB9,concat_name_GB10);
        value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
        concat_name_PW7,concat_name_PW8,concat_name_PW9,concat_name_PW10);
        value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
        concat_name_DM7,concat_name_DM8,concat_name_DM9,concat_name_DM10);
        value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
        concat_name_PROT6,concat_name_PROT7,concat_name_PROT8,concat_name_PROT9,concat_name_PROT10);
        exportTsv();




      }
      else if(selectedValue.length===11){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);
        let concat_name_GM9 =eval(name1+selectedValue[8]);
        let concat_name_GB9 =eval(name2+selectedValue[8]);
        let concat_name_PW9 =eval(name3+selectedValue[8]);
        let concat_name_DM9 =eval(name4+selectedValue[8]);
        let concat_name_PROT9 =eval(name5+selectedValue[8]);
        let concat_name_GM10 =eval(name1+selectedValue[9]);
        let concat_name_GB10 =eval(name2+selectedValue[9]);
        let concat_name_PW10 =eval(name3+selectedValue[9]);
        let concat_name_DM10 =eval(name4+selectedValue[9]);
        let concat_name_PROT10 =eval(name5+selectedValue[9]);
        let concat_name_GM11 =eval(name1+selectedValue[10]);
        let concat_name_GB11 =eval(name2+selectedValue[10]);
        let concat_name_PW11 =eval(name3+selectedValue[10]);
        let concat_name_DM11 =eval(name4+selectedValue[10]);
        let concat_name_PROT11 =eval(name5+selectedValue[10]);



        value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
        concat_name_GM7,concat_name_GM8,concat_name_GM9 ,concat_name_GM10,concat_name_GM11);
        value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
        concat_name_GB7,concat_name_GB8,concat_name_GB9,concat_name_GB10,concat_name_GB11);
        value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
        concat_name_PW7,concat_name_PW8,concat_name_PW9,concat_name_PW10,concat_name_PW11);
        value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
        concat_name_DM7,concat_name_DM8,concat_name_DM9,concat_name_DM10,concat_name_DM11);
        value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
        concat_name_PROT6,concat_name_PROT7,concat_name_PROT8,concat_name_PROT9,concat_name_PROT10,concat_name_PROT11);
        exportTsv();



      }
      else if(selectedValue.length===12){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);
        let concat_name_GM9 =eval(name1+selectedValue[8]);
        let concat_name_GB9 =eval(name2+selectedValue[8]);
        let concat_name_PW9 =eval(name3+selectedValue[8]);
        let concat_name_DM9 =eval(name4+selectedValue[8]);
        let concat_name_PROT9 =eval(name5+selectedValue[8]);
        let concat_name_GM10 =eval(name1+selectedValue[9]);
        let concat_name_GB10 =eval(name2+selectedValue[9]);
        let concat_name_PW10 =eval(name3+selectedValue[9]);
        let concat_name_DM10 =eval(name4+selectedValue[9]);
        let concat_name_PROT10 =eval(name5+selectedValue[9]);
        let concat_name_GM11 =eval(name1+selectedValue[10]);
        let concat_name_GB11 =eval(name2+selectedValue[10]);
        let concat_name_PW11 =eval(name3+selectedValue[10]);
        let concat_name_DM11 =eval(name4+selectedValue[10]);
        let concat_name_PROT11 =eval(name5+selectedValue[10]);
        let concat_name_GM12 =eval(name1+selectedValue[11]);
        let concat_name_GB12 =eval(name2+selectedValue[11]);
        let concat_name_PW12 =eval(name3+selectedValue[11]);
        let concat_name_DM12 =eval(name4+selectedValue[11]);
        let concat_name_PROT12 =eval(name5+selectedValue[11]);




        value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
        concat_name_GM7,concat_name_GM8,concat_name_GM9 ,concat_name_GM10,concat_name_GM11,concat_name_GM12);
        value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
        concat_name_GB7,concat_name_GB8,concat_name_GB9,concat_name_GB10,concat_name_GB11,concat_name_GB12);
        value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
        concat_name_PW7,concat_name_PW8,concat_name_PW9,concat_name_PW10,concat_name_PW11,concat_name_PW12);
        value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
        concat_name_DM7,concat_name_DM8,concat_name_DM9,concat_name_DM10,concat_name_DM11,concat_name_DM12);
        value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
        concat_name_PROT6,concat_name_PROT7,concat_name_PROT8,concat_name_PROT9,concat_name_PROT10,concat_name_PROT11,
        concat_name_PROT12);
        exportTsv();



      }
      else if(selectedValue.length===13){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);
        let concat_name_GM9 =eval(name1+selectedValue[8]);
        let concat_name_GB9 =eval(name2+selectedValue[8]);
        let concat_name_PW9 =eval(name3+selectedValue[8]);
        let concat_name_DM9 =eval(name4+selectedValue[8]);
        let concat_name_PROT9 =eval(name5+selectedValue[8]);
        let concat_name_GM10 =eval(name1+selectedValue[9]);
        let concat_name_GB10 =eval(name2+selectedValue[9]);
        let concat_name_PW10 =eval(name3+selectedValue[9]);
        let concat_name_DM10 =eval(name4+selectedValue[9]);
        let concat_name_PROT10 =eval(name5+selectedValue[9]);
        let concat_name_GM11 =eval(name1+selectedValue[10]);
        let concat_name_GB11 =eval(name2+selectedValue[10]);
        let concat_name_PW11 =eval(name3+selectedValue[10]);
        let concat_name_DM11 =eval(name4+selectedValue[10]);
        let concat_name_PROT11 =eval(name5+selectedValue[10]);
        let concat_name_GM12 =eval(name1+selectedValue[11]);
        let concat_name_GB12 =eval(name2+selectedValue[11]);
        let concat_name_PW12 =eval(name3+selectedValue[11]);
        let concat_name_DM12 =eval(name4+selectedValue[11]);
        let concat_name_PROT12 =eval(name5+selectedValue[11]);
        let concat_name_GM13 =eval(name1+selectedValue[12]);
        let concat_name_GB13 =eval(name2+selectedValue[12]);
        let concat_name_PW13 =eval(name3+selectedValue[12]);
        let concat_name_DM13 =eval(name4+selectedValue[12]);
        let concat_name_PROT13 =eval(name5+selectedValue[12]);
        exportTsv();



      value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
      concat_name_GM7,concat_name_GM8,concat_name_GM9,concat_name_GM10,concat_name_GM11,concat_name_GM12,concat_name_GM13);
      value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
      concat_name_GB7,concat_name_GB8,concat_name_GB9,concat_name_GB10,concat_name_GB11,concat_name_GB12,concat_name_GB13);
      value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
      concat_name_PW7,concat_name_PW8,concat_name_PW9,concat_name_PW10,concat_name_PW11,concat_name_PW12,concat_name_PW13);
      value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
      concat_name_DM7,concat_name_DM8,concat_name_DM9,concat_name_DM10,concat_name_DM11,concat_name_DM12,concat_name_DM13);
      value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
      concat_name_PROT6,concat_name_PROT7,concat_name_PROT8,concat_name_PROT9,concat_name_PROT10,concat_name_PROT11,
      concat_name_PROT12,concat_name_PROT13);



      }
      else if(selectedValue.length===14){
        let name1="GM_"
        let name2="GB_"
        let name3="PW_"
        let name4="DM_"
        let name5= "PROT_"
        let concat_name_GM1 =eval(name1+selectedValue[0]);
        let concat_name_GB1 =eval(name2+selectedValue[0]);
        let concat_name_PW1 =eval(name3+selectedValue[0]);
        let concat_name_DM1 =eval(name4+selectedValue[0]);
        let concat_name_PROT1 =eval(name5+selectedValue[0]);
        let concat_name_GM2 =eval(name1+selectedValue[1]);
        let concat_name_GB2 =eval(name2+selectedValue[1]);
        let concat_name_PW2 =eval(name3+selectedValue[1]);
        let concat_name_DM2 =eval(name4+selectedValue[1]);
        let concat_name_PROT2 =eval(name5+selectedValue[1]);
        let concat_name_GM3 =eval(name1+selectedValue[2]);
        let concat_name_GB3 =eval(name2+selectedValue[2]);
        let concat_name_PW3 =eval(name3+selectedValue[2]);
        let concat_name_DM3 =eval(name4+selectedValue[2]);
        let concat_name_PROT3 =eval(name5+selectedValue[2]);
        let concat_name_GM4 =eval(name1+selectedValue[3]);
        let concat_name_GB4 =eval(name2+selectedValue[3]);
        let concat_name_PW4 =eval(name3+selectedValue[3]);
        let concat_name_DM4 =eval(name4+selectedValue[3]);
        let concat_name_PROT4 =eval(name5+selectedValue[3]);
        let concat_name_GM5 =eval(name1+selectedValue[4]);
        let concat_name_GB5 =eval(name2+selectedValue[4]);
        let concat_name_PW5 =eval(name3+selectedValue[4]);
        let concat_name_DM5 =eval(name4+selectedValue[4]);
        let concat_name_PROT5 =eval(name5+selectedValue[4]);
        let concat_name_GM6 =eval(name1+selectedValue[5]);
        let concat_name_GB6 =eval(name2+selectedValue[5]);
        let concat_name_PW6 =eval(name3+selectedValue[5]);
        let concat_name_DM6 =eval(name4+selectedValue[5]);
        let concat_name_PROT6 =eval(name5+selectedValue[5]);
        let concat_name_GM7 =eval(name1+selectedValue[6]);
        let concat_name_GB7 =eval(name2+selectedValue[6]);
        let concat_name_PW7 =eval(name3+selectedValue[6]);
        let concat_name_DM7 =eval(name4+selectedValue[6]);
        let concat_name_PROT7 =eval(name5+selectedValue[6]);
        let concat_name_GM8 =eval(name1+selectedValue[7]);
        let concat_name_GB8 =eval(name2+selectedValue[7]);
        let concat_name_PW8 =eval(name3+selectedValue[7]);
        let concat_name_DM8 =eval(name4+selectedValue[7]);
        let concat_name_PROT8 =eval(name5+selectedValue[7]);
        let concat_name_GM9 =eval(name1+selectedValue[8]);
        let concat_name_GB9 =eval(name2+selectedValue[8]);
        let concat_name_PW9 =eval(name3+selectedValue[8]);
        let concat_name_DM9 =eval(name4+selectedValue[8]);
        let concat_name_PROT9 =eval(name5+selectedValue[8]);
        let concat_name_GM10 =eval(name1+selectedValue[9]);
        let concat_name_GB10 =eval(name2+selectedValue[9]);
        let concat_name_PW10 =eval(name3+selectedValue[9]);
        let concat_name_DM10 =eval(name4+selectedValue[9]);
        let concat_name_PROT10 =eval(name5+selectedValue[9]);
        let concat_name_GM11 =eval(name1+selectedValue[10]);
        let concat_name_GB11 =eval(name2+selectedValue[10]);
        let concat_name_PW11 =eval(name3+selectedValue[10]);
        let concat_name_DM11 =eval(name4+selectedValue[10]);
        let concat_name_PROT11 =eval(name5+selectedValue[10]);
        let concat_name_GM12 =eval(name1+selectedValue[11]);
        let concat_name_GB12 =eval(name2+selectedValue[11]);
        let concat_name_PW12 =eval(name3+selectedValue[11]);
        let concat_name_DM12 =eval(name4+selectedValue[11]);
        let concat_name_PROT12 =eval(name5+selectedValue[11]);
        let concat_name_GM13 =eval(name1+selectedValue[12]);
        let concat_name_GB13 =eval(name2+selectedValue[12]);
        let concat_name_PW13 =eval(name3+selectedValue[12]);
        let concat_name_DM13 =eval(name4+selectedValue[12]);
        let concat_name_PROT13 =eval(name5+selectedValue[12]);
        let concat_name_GM14 =eval(name1+selectedValue[13]);
        let concat_name_GB14 =eval(name2+selectedValue[13]);
        let concat_name_PW14 =eval(name3+selectedValue[13]);
        let concat_name_DM14 =eval(name4+selectedValue[13]);
        let concat_name_PROT14 =eval(name5+selectedValue[13]);




        value_GM=_.union(concat_name_GM1,concat_name_GM2,concat_name_GM3,concat_name_GM4,concat_name_GM5,concat_name_GM6,
        concat_name_GM7,concat_name_GM8,concat_name_GM9,concat_name_GM10,concat_name_GM11,concat_name_GM12,
        concat_name_GM13,concat_name_GM14);
        value_GB=_.union(concat_name_GB1,concat_name_GB2,concat_name_GB3,concat_name_GB4,concat_name_GB5,concat_name_GB6,
        concat_name_GB7,concat_name_GB8,concat_name_GB9,concat_name_GB10,concat_name_GB11,concat_name_GB12,
        concat_name_GB13,concat_name_GB14);
        value_PW=_.union(concat_name_PW1,concat_name_PW2,concat_name_PW3,concat_name_PW4,concat_name_PW5,concat_name_PW6,
        concat_name_PW7,concat_name_PW8,concat_name_PW9,concat_name_PW10,concat_name_PW11,concat_name_PW12,
        concat_name_PW13,concat_name_PW14);
        value_DM=_.union(concat_name_DM1,concat_name_DM2,concat_name_DM3,concat_name_DM4,concat_name_DM5,concat_name_DM6,
        concat_name_DM7,concat_name_DM8,concat_name_DM9,concat_name_DM10,concat_name_DM11,concat_name_DM12,
        concat_name_DM13,concat_name_DM14);
        value_PROT=_.union(concat_name_PROT1,concat_name_PROT2,concat_name_PROT3,concat_name_PROT4,concat_name_PROT5,
        concat_name_PROT6,concat_name_PROT7,concat_name_PROT8,concat_name_PROT9,concat_name_PROT10,concat_name_PROT11,
        concat_name_PROT12,concat_name_PROT13,concat_name_PROT14);
        exportTsv();


      }
    else if(selectedValue.length===15){
      value_GM=_.union(GM_a,GM_b,GM_c,GM_d,GM_e,GM_f,GM_g,GM_h,GM_i,GM_j,GM_k,GM_l,GM_m,GM_n,GM_o);
      value_GB=_.union(GB_a,GB_b,GB_c,GB_d,GB_e,GB_f,GB_g,GB_h,GB_i,GB_j,GB_k,GB_l,GB_m,GB_n,GB_o);
      value_PW=_.union(PW_a,PW_b,PW_c,PW_d,PW_e,PW_f,PW_g,PW_h,PW_i,PW_j,PW_k,PW_l,PW_m,PW_n,PW_o);
      value_DM=_.union(DM_a,DM_b,DM_c,DM_d,DM_e,DM_f,DM_g,DM_h,DM_i,DM_j,DM_k,DM_l,DM_m,DM_n,DM_o);
      value_PROT=_.union(PROT_a,PROT_b,PROT_c,PROT_d,PROT_e,PROT_f,PROT_g,PROT_h,PROT_i,PROT_j,PROT_k,PROT_l,PROT_m,PROT_n,
      PROT_o);
      exportTsv();
    }

    //PREVIEW QUERY
    var a = preview.preview
    var words = []
    a.replace(/\[(.+?)\]/g, function($0, $1) { words.push($1) })
    words[0]=words[0].replace("[","");
    words[0]=words[0].replace(new RegExp(',', 'g'), " AND ");
    words[1]=words[1].replace(new RegExp(',', 'g'), " AND ");
    words[2]=words[2].replace(new RegExp(',', 'g'), " AND ");
    words[3]=words[3].replace(new RegExp(',', 'g'), " AND ");
    for(var i=0 ;i<words.length;i++){
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



    return (

   <div className="ResultPage">

      <div className="right">
          <p className="query1_preview"> Q1:{words[0]}</p>
          <p className="query2_preview"> Q2: {words[1]}</p>
          <p className="query3_preview"> Q3: {words[2]}</p>
          <p className="query4_preview"> Q4: {words[3]}</p>
        <div id="upset" />
        {checkBoxComponent}

      </div>

      <div className="left">


              <div className="button_top">
                <Link to="/"><button className="add_query">New Query </button></Link>
                <CSVLink data={tsvData} filename={"prosetcomp.tsv"} separator={"\t"} ><ExportCSVButton/></CSVLink>

              </div>

              <Tabs delaultActiveKey={1} id="uncontrolled-tab-example" onSelect={this.handleSelect}>

              <Tab eventKey={1} title="Protein">
              <BootstrapTable  data={ value_PROT } options={this.options} pagination >
                  <TableHeaderColumn  dataField='accession' dataFormat={ this.formatNameAccession } isKey dataSort>ACCESSION</TableHeaderColumn>
                  <TableHeaderColumn width={'40%'} dataField='name' dataFormat={ this.formatNameName } dataSort>NAME</TableHeaderColumn>
                  <TableHeaderColumn width={'10%'} dataField='taxon_id' dataAlign='center'>TAXON ID</TableHeaderColumn>
                  <TableHeaderColumn dataField='taxon_name' dataAlign='center' dataSort>TAXON NAME</TableHeaderColumn>
                  <TableHeaderColumn dataField='is_reviewed' dataAlign='center'>IS REVIEWED</TableHeaderColumn>
              </BootstrapTable>

              </Tab>


              <Tab eventKey={2} title="Molecular Function">
                <BootstrapTable   data={ value_GM}  pagination >
                    <TableHeaderColumn width={'20%'} dataField='go_id' dataFormat={ this.formatNameGo_Id } isKey dataSort>GO TERM ID</TableHeaderColumn>
                    <TableHeaderColumn dataField='name'>NAME</TableHeaderColumn>
                    <TableHeaderColumn dataField='parents' dataFormat={ this.formatNameParents }>PARENTS</TableHeaderColumn>
                    <TableHeaderColumn width={'10%'} dataField='depth' dataAlign='center' >DEPTH</TableHeaderColumn>
                </BootstrapTable>
              </Tab>



                <Tab eventKey={3} title="Biological Process">
                    <BootstrapTable   data={ value_GB }  pagination >
                        <TableHeaderColumn width={'20%'} dataField='go_id' dataFormat={ this.formatNameGo_Id }
                          isKey dataSort>GO TERM ID</TableHeaderColumn>
                        <TableHeaderColumn width={'40%'} dataField='name'>NAME</TableHeaderColumn>
                        <TableHeaderColumn width={'40%'} dataField='parents' dataFormat={this.formatNameParents}>PARENTS</TableHeaderColumn>
                        <TableHeaderColumn width={'10%'} dataField='depth' dataAlign='center' >DEPTH</TableHeaderColumn>
                    </BootstrapTable>
               </Tab>

               <Tab eventKey={4} title="Pathway">
                   <BootstrapTable   data={ value_PW}  pagination >
                       <TableHeaderColumn width={'20%'} dataField='ipr_id' dataFormat={ this.formatNameIpr_Id } isKey dataSort>REACTOME ID</TableHeaderColumn>
                       <TableHeaderColumn dataField='name'>NAME</TableHeaderColumn>
                       <TableHeaderColumn dataField='parents' dataFormat={this.formatNameParentsForPathway}>PARENTS</TableHeaderColumn>
                   </BootstrapTable>

                </Tab>
                <Tab eventKey={5} title="Domain">
                <BootstrapTable   data={ value_DM}  pagination >
                    <TableHeaderColumn width={'20%'} dataField='ipr' dataFormat={ this.formatNameIpr } isKey dataSort>IPR</TableHeaderColumn>
                    <TableHeaderColumn dataField='name'>NAME</TableHeaderColumn>
                    <TableHeaderColumn dataField='parents' dataFormat={ this.formatNameParents }>PARENTS</TableHeaderColumn>

                </BootstrapTable>

                </Tab>
              </Tabs>

                <button className="leftbutton"></button>


         </div>


    </div>
    );
  }
}

export default ResultPageFourQuery;
