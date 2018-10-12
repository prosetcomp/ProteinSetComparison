/* eslint-disable */
import React, { Component } from 'react';
import { Tabs } from 'react-bootstrap';
import { Tab } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import axios from 'axios';
import * as d3 from 'd3'
import * as venn from 'venn.js'
import { VennDiagram } from 'venn.js';
import { select } from 'd3-selection';
import {Checkbox, CheckboxGroup} from 'react-checkbox-group';
import Switch from "react-switch";
import './ResultPage1.css';
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


class ResultPageOneQuery extends Component {
  constructor(props) {
    super(props)
    this.state = {
      GM_a: [],
      GB_a: [],
      PW_a: [],
      DM_a: [],
      PROT_a:[],
      selectedValue:["a"],
      key: 1,
      checked: true,
      preview:this.props.location.state

    }
    this.options = {
     defaultSortName: 'taxon_name',  // default sort column name
     defaultSortOrder: 'asc'  // default sort order
   };

    this.handleChange = this.handleChange.bind(this);
    this.handleSelect = this.handleSelect.bind(this);
    this.handleChange2 = this.handleChange2.bind(this);

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
   ])
   // use arrow function to avoid loosing context
   // BTW you don't need to use axios.spread with ES2015 destructuring
   .then(([resultResponse, result2Response,result3Response, result4Response,result5Response]) => {
           this.setState({GM_a: resultResponse.data[0], GB_a : result2Response.data[0],PW_a: result3Response.data[0], DM_a : result4Response.data[0],PROT_a:result5Response.data[0]});
          // console.log(resultResponse.data);
           //console.log(result2Response.data[0]);
           //console.log(result3Response.data[0]);
           //console.log(result4Response.data[0]);
           //console.log(result5Response.data[0]);
       });
  }


  handleChange(value) {

    this.setState({selectedValue: value});


  }
  handleSelect(key) {
      this.setState({ key: key });
  }

  handleChange2(checked) {

    this.setState({ checked });
  }

  formatNameAccession(cell, row) {
     return (

         <td dangerouslySetInnerHTML={{__html: row.accession}} />

     );
     }
     formatNameName(cell, row) {
        // get name by row.name
        // get description by row.description
        if(row.name.length<2){
          return(

              <td dangerouslySetInnerHTML={{__html: row.name}} />


          )
        }
        return (

            <ReactTextCollapse options={TEXT_COLLAPSE_OPTIONS}>
            <td dangerouslySetInnerHTML={{__html: row.name}} />
              </ReactTextCollapse>

        );
        }
      formatNameParentsForPathway(cell, row) {
         // get name by row.name
         // get description by row.description
         if(row.parents.length<2){
           return(

               <td dangerouslySetInnerHTML={{__html: row.parents}} />


           )
         }


         return (

           <ReactTextCollapse options={TEXT_COLLAPSE_OPTIONS}>
              <td dangerouslySetInnerHTML={{__html: row.parents}} />
            </ReactTextCollapse>



         );
         }
         formatNameParents(cell, row) {
            // get name by row.name
            // get description by row.description
            if(row.parents.length<2){
              return(

                  <td dangerouslySetInnerHTML={{__html: row.parents}} />


              )
            }

            return (


                <ReactTextCollapse options={TEXT_COLLAPSE_OPTIONS2}>
                  <td dangerouslySetInnerHTML={{__html: row.parents}} />
                 </ReactTextCollapse>


            );
            }
     formatNameGo_Id(cell, row) {
        // get name by row.name
        // get description by row.description
        return (


            <td dangerouslySetInnerHTML={{__html: row.go_id}} />


        );
        }
    formatNameIpr_Id(cell, row) {
           // get name by row.name
           // get description by row.description
           return (

               <td dangerouslySetInnerHTML={{__html: row.ipr_id}} />


           );
    }
    formatNameIpr(cell, row) {
       // get name by row.name
       // get description by row.description
       return (

           <td dangerouslySetInnerHTML={{__html: row.ipr}} />


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
    					.text(sets[i].size)
    					.attr("font-family", "sans-serif")
    					.attr("font-size", "15px");



    			}
    }
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
const {GM_a,GB_a,PW_a,DM_a,PROT_a, selectedValue,key,checked,preview} =this.state;
//console.log(GM_a[0]);
var tsvData="";




      let checkBoxComponent="";
            if(checked===true){
              checkBoxComponent =
               <div className="regions_upset">
                <CheckboxGroup name="regions" id="regions" onChange={this.handleChange} checkboxDepth={5} value={selectedValue} >
                  <label id="set1_a_upset_label"><Checkbox  value="a" className="set1_a_upset"/>Q1</label><br/>
                </CheckboxGroup>
                </div>

              d3.select("body").select("#upset2").selectAll("*").remove();
                if(key===1){
                  const sets = [
                  { sets: [0],"label": PROT_a.length+ '' , size: PROT_a.length},
                  ];


                  drawUpset(sets);
                  tsvData=PROT_a.slice(0);



                }

                else if(key===2){


                  const sets = [
                    { sets: [0],"label": GM_a.length+ '' , size: GM_a.length},
                  ];

                  drawUpset(sets)



                }
                else if(key===3 ){

                const sets = [
                  { sets: [0],"label": GB_a.length+ '' , size: GB_a.length},
                ];

                drawUpset(sets)



                }
                else if(key===4 ){

                const sets = [
                  { sets: [0],"label": PW_a.length+ '' , size: PW_a.length},
                ];

                drawUpset(sets)




                }
                else if(key===5){

                const sets = [
                  { sets: [0],"label": DM_a.length+ '' , size: DM_a.length},
                ];


                drawUpset(sets)


                }
              }
          else{
            checkBoxComponent =
             <div className="regions2">
              <CheckboxGroup name="regions" id="regions" onChange={this.handleChange} checkboxDepth={5} value={selectedValue} >
                  <label id="set1_a_venn"><Checkbox  value="a" />Q1</label>
              </CheckboxGroup>
              </div>

            d3.select("body").select("#upset").selectAll("*").remove();
            if(key===1){
              const sets = [
                { sets: [0],"label": PROT_a.length+ '' , size: 175},
              ];

              const chart = VennDiagram().width(450).height(350);

              const div = select(this.diagram);
              div.datum(sets).call(chart);
             mouseClick(div);



            }

            else if(key===2){


              const sets = [
                { sets: [0],"label": GM_a.length+ '' , size: 175},
              ];
              const chart = VennDiagram().width(450).height(350);

              const div = select(this.diagram);
              div.datum(sets).call(chart);
              mouseClick(div);


            }
            else if(key===3 ){

            const sets = [
              { sets: [0],"label": GB_a.length+ '' , size: 175},
            ];
            const chart = VennDiagram().width(450).height(350);

            const div = select(this.diagram);
            div.datum(sets).call(chart);
            mouseClick(div);



            }
            else if(key===4 ){

            const sets = [
              { sets: [0],"label": PW_a.length+ '' , size: 175},
            ];
            const chart = VennDiagram().width(450).height(350);

            const div = select(this.diagram);
            div.datum(sets).call(chart);
            mouseClick(div);



            }
            else if(key===5){

            const sets = [
              { sets: [0],"label": DM_a.length+ '' , size: 175},
            ];
            const chart = VennDiagram().width(450).height(350);

            const div = select(this.diagram);
            div.datum(sets).call(chart);
            mouseClick(div);


            }
          }

      if(key===1){
        tsvData= JSON.parse(JSON.stringify(PROT_a));

        for(var i in tsvData){
            tsvData[i].accession= tsvData[i].accession.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')


          }


      }
      else if(key===2){
          tsvData= JSON.parse(JSON.stringify(GM_a));
          for(var i in tsvData){
              tsvData[i].go_id= tsvData[i].go_id.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


            }

      }
      else if(key===3){
        tsvData= JSON.parse(JSON.stringify(GB_a));
        for(var i in tsvData){
            tsvData[i].go_id= tsvData[i].go_id.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }

      }
      else if(key===4){
        tsvData= JSON.parse(JSON.stringify(PW_a));

        for(var i in tsvData){
            tsvData[i].ipr_id= tsvData[i].ipr_id.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }


      }
      else if(key===5){
        tsvData= JSON.parse(JSON.stringify(DM_a));
        //console.log(DM_a);
        for(var i in tsvData){
            tsvData[i].ipr= tsvData[i].ipr.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }

      }


          //PREVIEW QUERY
        var a = preview.preview
        var words = []
        a.replace(/\[(.+?)\]/g, function($0, $1) { words.push($1) })
        words[0]=words[0].replace("[","");
        words[0]=words[0].replace(new RegExp(',', 'g'), " AND ");
        if(words[0]==="refid"){
          words[0]=words[0].replace("refid","RefSeq ID");
        }
        else if(words[0]==="uniprot_accession"){
          words[0]=words[0].replace("uniprot_accession","Uniprot Accession");
        }
        else if(words[0]==="uniprot_id"){
          words[0]=words[0].replace("uniprot_id","Uniprot ID");
        }
        else if(words[0]==="ensembl_id"){
          words[0]=words[0].replace("ensembl_id","Ensembl ID");
        }
    return (

      <div className="ResultPage">

        <div className="right">
          <p className="query1_preview"> Q1:{words[0]}</p>
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



        </div>

        <div className="left">
            <div className="button_top">
              <Link to="/"><button className="add_query">New Query </button></Link>
              <CSVLink data={tsvData} filename={"prosetcomp.tsv"} separator={"\t"} ><button className="exportTSV">Export TSV</button></CSVLink>

            </div>
              <Tabs defaultActiveKey={1} id="uncontrolled-tab-example" onSelect={this.handleSelect}>

                <Tab eventKey={1} title="Protein">
                    <BootstrapTable   data={ PROT_a } options={this.options}  pagination  >
                        <TableHeaderColumn  dataField='accession' dataFormat={ this.formatNameAccession } isKey dataSort>ACCESSION</TableHeaderColumn>
                        <TableHeaderColumn width={'40%'} dataField='name' dataFormat={ this.formatNameName } dataSort>NAME</TableHeaderColumn>
                        <TableHeaderColumn  width={'10%'} dataField='taxon_id' dataAlign='center'>TAXON ID</TableHeaderColumn>
                        <TableHeaderColumn  dataField='taxon_name'dataAlign='center' dataSort>TAXON NAME</TableHeaderColumn>
                        <TableHeaderColumn dataField='is_reviewed'  dataAlign='center'>IS REVIEWED</TableHeaderColumn>
                    </BootstrapTable>

                </Tab>

                <Tab eventKey={2} title="Molecular Function">
                  <BootstrapTable   data={ GM_a }  pagination >
                      <TableHeaderColumn dataField='go_id' dataFormat={ this.formatNameGo_Id }  isKey dataSort >GO TERM ID </TableHeaderColumn>
                      <TableHeaderColumn dataField='name'>NAME</TableHeaderColumn>
                      <TableHeaderColumn dataField='parents' dataFormat={ this.formatNameParents }>PARENTS</TableHeaderColumn>
                      <TableHeaderColumn width={'10%'} dataField='depth'dataAlign='center' >DEPTH</TableHeaderColumn>
                  </BootstrapTable>
                </Tab>



                  <Tab eventKey={3} title="Biological Process">
                      <BootstrapTable   data={ GB_a }  pagination >
                          <TableHeaderColumn dataField='go_id' dataFormat={ this.formatNameGo_Id } isKey dataSort>GO TERM ID</TableHeaderColumn>
                          <TableHeaderColumn dataField='name'>NAME</TableHeaderColumn>
                          <TableHeaderColumn dataField='parents' dataFormat={this.formatNameParents}>PARENTS</TableHeaderColumn>
                          <TableHeaderColumn width={'10%'} dataField='depth' >DEPTH</TableHeaderColumn>
                      </BootstrapTable>
                       </Tab>

                 <Tab eventKey={4} title="Pathway">
                     <BootstrapTable   data={ PW_a }  pagination >
                         <TableHeaderColumn dataField='ipr_id' dataFormat={ this.formatNameIpr_Id } isKey dataSort>REACTOME ID</TableHeaderColumn>
                         <TableHeaderColumn dataField='name'>NAME</TableHeaderColumn>
                         <TableHeaderColumn dataField='parents' dataFormat={this.formatNameParentsForPathway}>PARENTS</TableHeaderColumn>
                     </BootstrapTable>


                  </Tab>
                  <Tab eventKey={5} title="Domain">
                  <BootstrapTable   data={ DM_a }  pagination >
                      <TableHeaderColumn dataField='ipr' dataFormat={ this.formatNameIpr } isKey dataSort>IPR</TableHeaderColumn>
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

export default ResultPageOneQuery;
