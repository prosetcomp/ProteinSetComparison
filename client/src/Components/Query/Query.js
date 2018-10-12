/* eslint-disable */
import React, { Component } from 'react';
import QueryBuilder from 'react-querybuilder';
import axios from 'axios';
import Loading from  '../ResultPage/Loading';
import { Redirect } from 'react-router';
import './query-builder.css';
import Select from 'react-select';


var nameOfFiles2=[] ;
class DocumentInput extends React.Component {

  state = {
     selectedOption: null,
   }
   handleChange = (selectedOption) => {
    this.setState({ selectedOption });
    nameOfFiles2 .push(selectedOption);


  }
  render() {
    const {selectedOption}=this.state;

  return<div className="selectFilePart">
           <Select
              value={this.selectedOption}
              onChange={this.handleChange}
              options={options}
            />
            <input type="file" className='input-file1' name={ `document-${ this.props.index }-document` }
            accept='.tsv' onChange={ e => handleFileChosen(e.target.files)} />


        </div>

  }
}

const fields = [
            {label: 'Disease Accession', name: 'disease_accession'},
            {label: 'Disease Acronym', name: 'disease_acronym'},
            {label: 'Disease Identifier', name: 'disease_identifier'},
            {label: 'Gene ID', name: 'gene_geneid'},
            {label: 'GO (Biological Process)', name: 'go_id'},
            {label: 'GO (Cellular Component)', name: 'go_id'},
            {label: 'GO (Molecular Function)', name: 'go_id'},
            {label: 'GO Name', name: 'goterms_name'},
            {label: 'Interpro', name: 'domain_iprid'},
            {label: 'Interpro Name', name: 'domain_name'},
            {label: 'MIM', name: 'disease_mim'},
            {label: 'Organism Name', name: 'taxon_name'},
            {label: 'PDB', name: 'pdb_pdb'},
            {label: 'PDB Chain', name: 'pdb_chain'},
            {label: 'Pfam', name: 'domain_pfam'},
            {label: 'Protein Name', name: 'protein_name'},
            {label: 'Protein Secondary Accession', name: 'secondary_accession'},
            {label: 'Publication Title', name: 'publication_title'},
            {label: 'Pubmed ID', name: 'publication_pmid'},
            {label: 'Reactome ID', name: 'pathway_id'},
            {label: 'Reactome Name', name: 'pathway_name'},
            {label: 'Reviewed', name: 'protein_isreviewed'},
            {label: 'TaxonID', name: 'protein_taxonid'},
            {label: 'Uniprot Accession', name: 'protein_accession'},
            {label: 'Uniprot ID', name: 'protein_id'},
            {label: 'Allergome', name: 'allergome'},
            {label: 'BioCyc', name: 'biocyc'},
            {label: 'BioGrid', name: 'biogrid'},
            {label: 'BioMuta', name: 'biomuta'},
            {label: 'ChEMBL', name: 'chembl'},
            {label: 'dictyBase', name: 'dictybase'},
            {label: 'DrugBank', name: 'drugbank'},
            {label: 'EchoBASE', name: 'echobase'},
            {label: 'EMBL', name: 'embl'},
            {label: 'EMBL-CDS', name: 'embl-cds'},
            {label: 'Ensembl', name: 'ensembl'},
            {label: 'EnsemblGenome', name: 'ensemblgenome'},
            {label: 'EnsemblGenome_PRO', name: 'ensemblgenome_pro'},
            {label: 'EnsemblGenome_TRS', name: 'ensemblgenome_trs'},
            {label: 'Ensembl_PRO', name: 'ensembl_pro'},
            {label: 'Ensembl_TRS', name: 'ensembl_trs'},
            {label: 'FlyBase', name: 'flybase'},
            {label: 'GeneCards', name: 'genecards'},
            {label: 'GeneDB', name: 'genedb'},
            {label: 'GeneID', name: 'geneid'},
            {label: 'Gene_Name', name: 'gene_name'},
            {label: 'Gene_OrderedLocusName', name: 'gene_orderedlocusname'},
            {label: 'Gene_ORFName', name: 'gene_orfname'},
            {label: 'GeneReviews', name: 'genereviews'},
            {label: 'Gene_Synonym', name: 'gene_synonym'},
            {label: 'GI', name: 'gi'},
            {label: 'HGNC', name: 'hgnc'},
            {label: 'KEGG', name: 'kegg'},
            {label: 'OrthoDB', name: 'orthodb'},
            {label: 'PeroxiBase', name: 'peroxibase'},
            {label: 'PomBase', name: 'pombase'},
            {label: 'REBASE', name: 'rebase'},
            {label: 'RefSeq', name: 'refseq'},
            {label: 'RefSeq_NT', name: 'refseq_nt'},
            {label: 'RGD', name: 'rgd'},
            {label: 'SGD', name: 'sgd'},
            {label: 'STRING', name: 'string'},
            {label: 'UniGene', name: 'unigene'},
            {label: 'UniParc', name: 'uniparc'},
            {label: 'UniPathway', name: 'unipathway'},
            {label: 'UniProtKB-ID', name: 'uniprotkb-id'},
            {label: 'UniRef100', name: 'uniref100'},
            {label: 'UniRef50', name: 'uniref50'},
            {label: 'UniRef90', name: 'uniref90'},
            {label: 'VectorBase', name: 'vectorbase'},
            {label: 'WormBase', name: 'wormbase'},
            {label: 'Xenbase', name: 'xenbase'},
];
const operators= [

    {name: '=', label: '='},

]
const combinators=[
    {name: 'and', label: 'AND'},

]



const labels = {
  fields: {
      title: "Choose Function"
  },
  operators: {
      title: "Operators"
  },
  value: {
      title: "Value"
  },
  removeRule: {
      label: "DELETE",
      title: "Remove rule"
  },
  removeGroup: {
      label: "DELETE",
      title: "Remove group"
  },
  addRule: {
      label: "ADD CRITERIA",
      title: "Addcriteria"
  },
  addGroup: {
      label: "ADD QUERY",
      title: "Addquery"
  },
  combinators: {
      title: "Logical Operation"
  }
};

const options = [
  { value: 'uniprot_accession', label: 'Uniprot Accession' },
  { value: 'refid', label: 'RefSeq ID' },
  { value: 'uniprot_id', label: 'Uniprot ID' },
  { value: 'ensembl_id', label: 'Ensembl ID' }
];
const optionsFile = [
  'Uniprot Accession', 'RefID', 'Crossref','Pathway',
]


function disableAddFileButton() {
  document.getElementsByClassName("addFileButton")[0].disabled = true;

}
function enableAddFileButton() {
  document.getElementsByClassName("addFileButton")[0].disabled = false;

}

function disableBtn() {
    document.getElementsByClassName("ruleGroup-addGroup")[0].disabled = true;

}

function enableBtn() {
    document.getElementsByClassName("ruleGroup-addGroup")[0].disabled = false;

}
function disableUploadFile(){
  document.getElementsByClassName("input-file1")[0].disabled = true;

}
function uploadFile(){

  return
  <input type="file" className='input-file1' name="file" accept='.tsv' onChange={ e => handleFileChosen(e.target.files)} multiple/>

}


let fileReader;
let uploadFileSize = 0;
var lastContentArray=[];

const handleFileRead = (e) =>{
  var a=this.optionsState;


    let content = e.currentTarget.result;
    let collectContent =[];
    collectContent.push(content);
    lastContentArray.push(collectContent);

  }

const handleFileChosen = (file) =>{


    uploadFileSize=uploadFileSize+file.length;


    for(var i=0;i<file.length;i++){

      fileReader=new FileReader();
      fileReader.onload=handleFileRead;
      fileReader.readAsText(file[i]);

    }





  }
function controlQueryAndFileSize(){
  if(query1.rules.length+filesize>=4){
    disableBtn();
    disableAddFileButton();

  }
  else{
    enableBtn();
    enableAddFileButton();


  }
}

var query1;
var queryresult="";
var filesize=0;

function logQuery(query) {

    query1=query;
    var querybutton=query1.rules.length;
    controlQueryAndFileSize();

    queryresult=querybutton;


}



class Query extends Component {

  constructor(props){
      super(props);
      this.state = {loading: false ,control:"",query:"",preview:[],fileData:[],optionsState:"",optionsStateFile:"",fileDataName:[],selectedOption: null,documents: [], cardCount:1};
      this.sendJSON = this.sendJSON.bind(this);
      this.changeSelectOption = this.changeSelectOption.bind(this);
      this.changeSelectOptionFile = this.changeSelectOptionFile.bind(this);
      this.add = this.add.bind(this);
      this.delete = this.delete.bind(this);

    }


add() {
  const documents = this.state.documents.concat(DocumentInput);
   this.setState({ documents });
    filesize=documents.length;
      controlQueryAndFileSize();
    if(documents.length>=4){
        disableAddFileButton();

    }


}
delete(e){
  var array = [...this.state.documents];
  var index = array.indexOf(e.target.value)
  array.splice(index, 1);
  this.setState({ documents:array });
  filesize=this.state.documents.length-1;
  controlQueryAndFileSize();
  if(this.state.documents.length<=4){
    enableAddFileButton();


  }


}
changeSelectOption(value) {

  this.setState({optionsState: value});



}

changeSelectOptionFile(fileValue){

  this.setState({optionsStateFile: fileValue});

}




sendJSON(){ //getting the user data to display on the dashboard
this.setState({loading: true})
    axios.post('http://localhost:9000/protein/query', {
          fileName:nameOfFiles2,
          file: lastContentArray,
          body:  JSON.parse(JSON.stringify(query1))
          })
          .then((results) => {

            this.setState({loading: false, control:results.status , query:queryresult, preview:results.data})

            uploadFileSize=0;
            lastContentArray=[];
            nameOfFiles2=[];
            filesize=0;


        }).catch(err => {

      });


  }



  handleChange = (selectedOption) => {
     this.setState({ selectedOption });


   }


  render() {


    const {control,loading, query,preview,optionsState,optionsStateFile,selectedOption} = this.state;

   if(control!==200 && loading===true ){
    return <Loading/>
    }
    else if(control===200 && loading===false && query+uploadFileSize===1){
      return (<Redirect to={{ pathname: "/result1", state: { preview: this.state.preview } }} />)

    }
    else if(control===200 && loading===false && query+uploadFileSize===2){
      return  (<Redirect to={{ pathname: "/result2", state: { preview: this.state.preview } }} />)
    }
    else if(control===200 && loading===false && query+uploadFileSize===3){
      return   (<Redirect to={{ pathname: "/result3", state: { preview: this.state.preview } }} />)
    }
    else if(control===200 && loading===false && query+uploadFileSize===4){
      return  (<Redirect to={{ pathname: "/result4", state: { preview: this.state.preview } }} />)
    }
    const documents = this.state.documents.map((Element, index) => {
    return <Element key={ index } index={ index } />
  });
   return (
      <div className="query2">

      <div className="title">
          <h1>Protein Set Comparison Tool</h1>

      </div>

      <div className="query">


      <QueryBuilder fields={fields} onQueryChange={logQuery} operators={operators} combinators={combinators}
      translations = {labels}/>
      <div>  <h3 className="or_tag">OR</h3> </div>
      <div className="inputs">

        <button className="addFileButton" onClick={ this.add }>UPLOAD FILE</button>
        <button className="deleteFileButton" onClick={ this.delete }>DELETE</button>
        { documents }
     </div>
        <button id="submitButton"onClick={this.sendJSON} >SUBMIT </button>



      </div>

      </div>
    );
  }
}

export default Query;
