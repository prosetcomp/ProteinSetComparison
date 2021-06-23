install.packages("dbparser")

library(dbparser)
library(dplyr)
library(XML)

setwd("/data01/comparative_proteomics_tool/")
get_xml_db_rows("full\ database.xml")
drugs <- parse_drug()

drugbank_data <- select(drugs,primary_key,name,description,mechanism_of_action)
names(drugbank_data) <- c("parent_key", "name", "description" ,"action")

uni_acc <- parse_drug_targets_polypeptides()
uni_accs <- select(uni_acc,id,name,parent_id)

drug_target <- parse_drug_targets()
drug_targets <- select(drug_target, id, name, parent_key)
names(drug_targets) <- c("parent_id","name","parent_key")

total00 <- merge(uni_accs,drug_targets,by="parent_id")
total01 <- merge(total00,drugbank_data,by="parent_key")


synonym <- parse_drug_synonyms()
synonyms <- select(synonym,parent_key,synonym) 

syn <- synonyms %>% 
  group_by(parent_key) %>% 
  mutate(syns = paste0(synonym, collapse = ", "))

syns <- distinct(syn,parent_key,syns)

total02 <- merge(drugbank_data,syns,by="parent_key")

protein_compound <- select(total01,id,parent_key,action)
compound <- select(total02,parent_key,name,description,syns)


protcomp_acc <- (protein_compound$id)
protcomp_cid <- (protein_compound$parent_key)
protcomp_action <- (protein_compound$action)
protcomp_action0 <- gsub("\n",". ",protcomp_action)

write.table(protcomp_acc,file = "X0.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")
write.table(protcomp_cid,file = "X1.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")
write.table(protcomp_action0,file = "X2.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")

compound_id <- (compound$parent_key)
compound_name <- (compound$name)
compound_desc <- (compound$description)
compound_desc0 <- gsub("\n",". ",compound_desc)
compound_synonym <- (compound$syns)

write.table(compound_id,file = "X3.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")
write.table(compound_name,file = "X4.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")
write.table(compound_desc0,file = "X5.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")
write.table(compound_synonym,file = "X6.tsv",row.names=FALSE, na="",col.names=FALSE,quote = FALSE,sep="\n")

x <- 'paste X0.tsv X1.tsv X2.tsv > /data01/comparative_proteomics_tool/normalized_data/protein_compound.tsv'
system(x)

y <- 'paste X3.tsv X4.tsv X5.tsv X6.tsv > /data01/comparative_proteomics_tool/normalized_data/protein_compound.tsv'
system(y)
