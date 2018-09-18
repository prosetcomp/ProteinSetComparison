/* eslint-disable */
import React, { Component } from 'react';
import QueryBuilder from 'react-querybuilder';
import axios from 'axios';
import Loading from  '../ResultPage/Loading';
import { Redirect } from 'react-router';
import './query-builder.css';


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




function disableBtn() {
    document.getElementsByClassName("ruleGroup-addGroup")[0].disabled = true;

}

function enableBtn() {
    document.getElementsByClassName("ruleGroup-addGroup")[0].disabled = false;
}
var query1;
var queryresult="";


function logQuery(query) {
    query1=query;
    var querybutton=query1.rules.length;
    if(query1.rules.length>=4){
      disableBtn();
    }
    else{
      enableBtn()
    }
    queryresult=querybutton;


}



class Query extends Component {
  constructor(props){
      super(props);
      this.state = {loading: false ,control:"",query:"",preview:[]};
      this.sendJSON = this.sendJSON.bind(this);

    }



sendJSON(){ //getting the user data to display on the dashboard
this.setState({loading: true})
    axios.post('http://localhost:9000/protein/query', {
          body:  JSON.parse(JSON.stringify(query1))
          })
          .then((results) => {

            this.setState({loading: false, control:results.status , query:queryresult, preview:results.data})
            console.log(results);


        }).catch(err => {

      });



  }


  render() {


    const {control,loading, query,preview} = this.state;
    

    if(control!==200 && loading===true ){
    return <Loading/>
    }
    else if(control===200 && loading===false && query===1){
      return (<Redirect to={{ pathname: "/result1", state: { preview: this.state.preview } }} />)

    }
    else if(control===200 && loading===false && query===2){
      return  (<Redirect to={{ pathname: "/result2", state: { preview: this.state.preview } }} />)
    }
    else if(control===200 && loading===false && query===3){
      return   (<Redirect to={{ pathname: "/result3", state: { preview: this.state.preview } }} />)
    }
    else if(control===200 && loading===false && query===4){
      return  (<Redirect to={{ pathname: "/result4", state: { preview: this.state.preview } }} />)
    }
   return (
      <div className="query2">

      <div className="title">
          <h1>Protein Set Comparison Tool</h1>

      </div>

      <div className="query">
        <QueryBuilder fields={fields} onQueryChange={logQuery} operators={operators} combinators={combinators}
      translations = {labels}/>

   <button id="submitButton"onClick={this.sendJSON} >SUBMIT </button>



      </div>

      </div>
    );
  }
}

export default Query;
