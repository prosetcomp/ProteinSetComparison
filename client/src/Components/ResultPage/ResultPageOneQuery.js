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
import Modal from 'react-responsive-modal';
import Cookies from 'js-cookie';


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
      preview:this.props.location.state,
      open: false,
      visible:false,
      username: "",
      mfaccessionresult:[],
      bpaccessionresult:[],
      pwaccessionresult:[],
      dmaccessionresult:[]

    }
    this.options = {
     defaultSortName: 'is_reviewed',  // default sort column name
     defaultSortOrder: 'asc'  // default sort order
   };


    this.handleChange = this.handleChange.bind(this);
    this.handleSelect = this.handleSelect.bind(this);
    this.handleChange2 = this.handleChange2.bind(this);
    this.makeRequestMolecular = this.makeRequestMolecular.bind(this);
    this.makeRequestBiological = this.makeRequestBiological.bind(this);
    this.makeRequestPathway = this.makeRequestPathway.bind(this);
    this.makeRequestDomain = this.makeRequestDomain.bind(this);
    this.openModal = this.openModal.bind(this);

  }

  componentDidMount(){
    this.getAccession();

    window.addEventListener("beforeunload", (ev) =>
    {
      //console.log("Leaveeeee!!!!");
        ev.preventDefault();
        //{this.closeConnection()}
        return ev.returnValue = 'Are you sure you want to close?';
    });

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

       });
  }
closeConnection(){

  Promise.all([

       axios.get('http://localhost:9000/protein/connection')
     ])


}

  handleChange(value) {

    this.setState({selectedValue: value});
    {this.closeConnection()}


  }
  handleSelect(key) {
      this.setState({ key: key });
      {this.closeConnection()}
  }

  handleChange2(checked) {

    this.setState({ checked });
  }
  onOpenModal = () => {
      this.setState({ open: true });
    };

    onCloseModal = () => {
      this.setState({ open: false });
    };

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
  }).catch(err => {

  });
  {this.openModal()}
  }


openModal(){
  this.setState({ open: true });

}

    //    this.setState({ visible: true});








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

    /*
      isExpandableRow(row) {
         return true;
        }


        expandComponent(row) {
          return (
           <BootstrapTable  data={this.value_PROT} trClassName={ this.trClassFormat }  options={this.options} pagination >
                <TableHeaderColumn width={'15%'} dataField='accession' dataFormat={ this.formatNameAccession }  isKey dataSort>ACCESSION</TableHeaderColumn>
                <TableHeaderColumn  dataField='name' dataFormat={ this.formatNameName } dataSort>NAME</TableHeaderColumn>
                <TableHeaderColumn width={'10%'}  dataField='taxon_id' dataAlign='center'>TAXON ID</TableHeaderColumn>
                <TableHeaderColumn width={'20%'} dataField='taxon_name'  dataAlign='center' dataSort >TAXON NAME</TableHeaderColumn>
                <TableHeaderColumn width={'15%'}  dataField='is_reviewed'  dataAlign='center' >IS REVIEWED</TableHeaderColumn>
                <TableHeaderColumn  dataAlign='center' dataFormat={this.formatLinksProtein}>LINKS</TableHeaderColumn>
            </BootstrapTable>


          );
        }
   */



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
const {GM_a,GB_a,PW_a,DM_a,PROT_a, selectedValue,key,checked,preview,pwaccessionresult,mfaccessionresult,bpaccessionresult,dmaccessionresult} =this.state;
const { open,visible } = this.state;
//console.log(GM_a[0]);
let value_GM =GM_a;
let value_GB=GB_a;
let value_PW=PW_a;
let value_DM=DM_a;
let value_PROT=PROT_a;
var tsvData="";
let new_Pathway_Prot =[] ;
const regex = /(<([^>]+)>)/ig;


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
        //      tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
              tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


            }

      }
      else if(key===3){
        tsvData= JSON.parse(JSON.stringify(GB_a));
        for(var i in tsvData){
            tsvData[i].go_id= tsvData[i].go_id.replace(/(<([^>]+)>)/ig, '')
    //        tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }

      }
      else if(key===4){
        tsvData= JSON.parse(JSON.stringify(PW_a));

        for(var i in tsvData){
            tsvData[i].ipr_id= tsvData[i].ipr_id.replace(/(<([^>]+)>)/ig, '')
    //        tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }


      }
      else if(key===5){
        tsvData= JSON.parse(JSON.stringify(DM_a));
        //console.log(DM_a);
        for(var i in tsvData){
            tsvData[i].ipr= tsvData[i].ipr.replace(/(<([^>]+)>)/ig, '')
      //      tsvData[i].name= tsvData[i].name.replace(/(<([^>]+)>)/ig, '')
            tsvData[i].parents= tsvData[i].parents.replace(/(<([^>]+)>)/ig, '')


          }

      }

      if(selectedValue.length===0){
        value_GM=[];
        value_GB=[];
        value_PW=[];
        value_DM=[];
        value_PROT=[];

      }
      function trClassFormat(rowData, rIndex) {
        return rIndex % 2 === 0 ? 'tr-function-even-number' : 'tr-function-odd-number';
      }

      const options = {
           expandRowBgColor: 'rgb(242, 255, 163)',
           expandBy: 'column'  // Currently, available value is row and column, default is row
         };

          //PREVIEW QUERY
        var a = preview.preview

        var words = []
        a.replace(/\[(.+?)\]/g, function($0, $1) { words.push($1) })
        words[0]=words[0].replace("[","");
        words[0]=words[0].replace(new RegExp(',', 'g'), " ");
        words[0]=words[0].replace(/protein_accession/g,"UniprotKB Accession");
        words[0]=words[0].replace(/protein_id/g,"UniprotKB Entry Name");
        words[0]=words[0].replace(/refseq/g,"RefSeq Protein");
        words[0]=words[0].replace(/refseq_nt/g,"RefSeq Nucleotide");
        words[0]=words[0].replace(/ensembl/g,"Ensembl Gene");
        words[0]=words[0].replace(/ensembl_pro/g,"Ensembl Protein");
        words[0]=words[0].replace(/ensembl_trs/g,"Ensembl Transcript");
        words[0]=words[0].replace(/disease_identifier/g,"Disease Identifier");
        words[0]=words[0].replace(/disease_mim/g,"MIM ID");
        words[0]=words[0].replace(/gene_name/,"Gene Name");
        words[0]=words[0].replace(/geneid/g,"Gene ID");
        words[0]=words[0].replace(/gene_name/g,"Gene Name");
        words[0]=words[0].replace(/embl/g,"EMBL");
        words[0]=words[0].replace(/embl-cds/g,"EMBL-CDS");
        words[0]=words[0].replace(/pdb_pdb/g,"PDB");
        words[0]=words[0].replace(/domain_iprid/g,"InterPro");
        words[0]=words[0].replace(/domain_name/g,"InterPro Name");
        words[0]=words[0].replace(/domain_pfam/g,"PFAM ID");
        words[0]=words[0].replace(/go_id/g,"GO ID");
        words[0]=words[0].replace(/goterms_name/g,"GO Name");
        words[0]=words[0].replace(/disease_acronym/g,"Disease Acronym");
        words[0]=words[0].replace(/pathway_id/g,"Reactome ID");
        words[0]=words[0].replace(/pathway_name/g,"Reactome Name");
        words[0]=words[0].replace(/taxon_name/g,"Organism Name");
        words[0]=words[0].replace(/protein_taxonid/g,"Taxon ID");
        words[0]=words[0].replace(/allergome/g,"Allergome");
        words[0]=words[0].replace(/biocyc/g,"BioCyc");
        words[0]=words[0].replace(/biogrid/g,"BioGrid");
        words[0]=words[0].replace(/biomuta/g,"BioMuta");
        words[0]=words[0].replace(/chembl/g,"ChEMBL");
        words[0]=words[0].replace(/dictybase/g,"dictyBase");
        words[0]=words[0].replace(/drugbank/g,"DrugBank");
        words[0]=words[0].replace(/echobase/g,"EchoBASE");
        words[0]=words[0].replace(/flybase/g,"FlyBase");
        words[0]=words[0].replace(/genecards/g,"GeneCards");
        words[0]=words[0].replace(/genedb/g,"GeneDB");
        words[0]=words[0].replace(/genereviews/g,"GeneReviews");
        words[0]=words[0].replace(/hgnc/g,"HGNC");
        words[0]=words[0].replace(/kegg/g,"KEGG");
        words[0]=words[0].replace(/orthodb/g,"OrthoDB");
        words[0]=words[0].replace(/peroxibase/g,"PeroxiBase");
        words[0]=words[0].replace(/pombase/g,"PomBase");
        words[0]=words[0].replace(/protein_name/g,"Protein Name");
        words[0]=words[0].replace(/publication_pmid/g,"PMID");
        words[0]=words[0].replace(/publication_title/g,"Publication Title");
        words[0]=words[0].replace(/rebase/g,"REBASE");
        words[0]=words[0].replace(/rgd/g,"RGD");
        words[0]=words[0].replace(/sgd/g,"SGD");
        words[0]=words[0].replace(/string/g,"STRING");
        words[0]=words[0].replace(/unigene/g,"UniGene");
        words[0]=words[0].replace(/uniparc/g,"UniParc");
        words[0]=words[0].replace(/unipathway/g,"UniPathway");
        words[0]=words[0].replace(/uniref100/g,"UniRef100");
        words[0]=words[0].replace(/uniref50/g,"UniRef50");
        words[0]=words[0].replace(/uniref90/g,"UniRef90");
        words[0]=words[0].replace(/vectorbase/g,"VectorBase");
        words[0]=words[0].replace(/wormbase/g,"WormBase");
        words[0]=words[0].replace(/xenbase/g,"Xenbase");

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

              <Link to="/"><button className="add_query" onClick={this.closeConnection}>New Query </button></Link>
              <CSVLink data={tsvData} filename={"prosetcomp.tsv"} separator={"\t"} ><button className="exportTSV">Export TSV</button></CSVLink>

            </div>
              <Tabs className="myClass" defaultActiveKey={1} id="uncontrolled-tab-example" onSelect={this.handleSelect}>

                <Tab eventKey={1} title="Protein">
                    <BootstrapTable  ref='tablePROT' data={ value_PROT } trClassName={ trClassFormat } options={this.options}  pagination  >
                        <TableHeaderColumn ref='nameCol' width={'15%'} dataField='accession' dataFormat={ this.formatNameAccession } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>ACCESSION</TableHeaderColumn>
                        <TableHeaderColumn dataField='name' dataFormat={ this.formatNameName } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } dataSort>NAME</TableHeaderColumn>
                        <TableHeaderColumn  width={'10%'} dataField='taxon_id' dataAlign='center' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } }>TAXON ID</TableHeaderColumn>
                        <TableHeaderColumn width={'20%'} dataField='taxon_name'dataAlign='center' filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } dataSort>TAXON NAME</TableHeaderColumn>
                        <TableHeaderColumn width={'15%'} dataField='is_reviewed'  dataAlign='center' dataSort >IS REVIEWED</TableHeaderColumn>
                        <TableHeaderColumn  dataAlign='center' dataFormat={this.formatLinksProtein}>LINKS</TableHeaderColumn>
                    </BootstrapTable>

                </Tab>

                <Tab eventKey={2} title="Molecular Function">
                  <BootstrapTable   data={ value_GM } trClassName={ trClassFormat } pagination >
                      <TableHeaderColumn dataField='go_id' dataFormat={ this.formatNameGo_Id } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort >GO TERM ID </TableHeaderColumn>
                      <TableHeaderColumn dataField='parents' dataFormat={ this.formatNameParents } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >PARENTS</TableHeaderColumn>
                      <TableHeaderColumn width={'15%'} dataField='depth'dataAlign='center' dataSort >DEPTH</TableHeaderColumn>
                        <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionMolecular.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                  </BootstrapTable>
                </Tab>



                  <Tab eventKey={3} title="Biological Process">
                      <BootstrapTable   data={ value_GB } trClassName={ trClassFormat } pagination >
                          <TableHeaderColumn dataField='go_id' dataFormat={ this.formatNameGo_Id } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>GO TERM ID</TableHeaderColumn>
                          <TableHeaderColumn dataField='parents' dataFormat={this.formatNameParents} filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } } >PARENTS</TableHeaderColumn>
                          <TableHeaderColumn width={'15%'} dataField='depth' dataAlign='center' dataSort >DEPTH</TableHeaderColumn>
                          <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionBiological.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                      </BootstrapTable>
                       </Tab>

                 <Tab eventKey={4} title="Pathway">
                     <BootstrapTable   data={ value_PW } trClassName={ trClassFormat } options={ options }
                    pagination >
                         <TableHeaderColumn dataField='ipr_id' expandable={ false } dataFormat={ this.formatNameIpr_Id } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>REACTOME ID</TableHeaderColumn>
                       <TableHeaderColumn dataField='parents' expandable={ false } dataFormat={this.formatNameParentsForPathway} filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } }>PARENTS</TableHeaderColumn>
                        <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionPathway.bind(this)}>RELATED PROTEINS</TableHeaderColumn>
                     </BootstrapTable>


                  </Tab>
                  <Tab eventKey={5} title="Domain">
                  <BootstrapTable   data={ value_DM }  trClassName={ trClassFormat } pagination >
                      <TableHeaderColumn dataField='ipr' dataFormat={ this.formatNameIpr } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter' } } isKey dataSort>IPR</TableHeaderColumn>
                      <TableHeaderColumn dataField='parents' dataFormat={ this.formatNameParents } filter={ { type: 'TextFilter', delay: 1000 , placeholder: 'Filter ' } }>PARENTS</TableHeaderColumn>
                        <TableHeaderColumn dataField="button" dataFormat={this.buttonFunctionDomain.bind(this)}>RELATED PROTEINS</TableHeaderColumn>

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
    );
  }
  }

export default ResultPageOneQuery;
