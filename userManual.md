The SciKnowMine Triage Application
==================================

We present here a user manual for running and maintaining a web-based system for peforming document
triage given a corpus of PDF files. We will describe processes for installation, execution and maintenance 
of the system. 

*Note that this system is provided with no warranty or guarantee* 

Pre-Installation Requirements 
----------------

* MySQL 5.1 (http://www.mysql.com/)
** http://dev.mysql.com/downloads/mysql/5.1.html
* SwfTools (http://www.swftools.org/)
** http://wiki.swftools.org/wiki/Installation

The Server:
  - Must own a port number to process http requests from client web browsers.
  - Must be able to send http requests to http://eutils.ncbi.nlm.nih.gov (PubMed's eCitation services).
  - Must be able to login to MySql with a user defined login with privileges to create (and destroy) databases.

Installation
------------

This system is provided as a `\*.tar.gz` archive for Unix and Linux systems, 
a `\*.dmg` instalallable for Macs and an `\*.exe` installable for PCs.

All packages are available for download from http://bmkeg.s3-website-us-west-2.amazonaws.com/index.html#triage

Organizion of the Triage System
-------------------------------

The triage task is primarily concerned with sorting documents from an input document set assigned to 
a curator (called a '*triage corpus*') into a set of categories (where each category actually designates 
a set of documents that are each called a '*target corpus*'). The data that assigns each scientific article
from triage corpus to it's target corpus is it's '*in-out-code*' which can be one of three values: '*in*', '*out*' 
or '*unclassified*'. 

This simple construct forms the basis of the system and provides a relatively 
straightforward way to attach additional cues and information about each article's possible inclusion in
a target corpus based on NLP analysis of the document's contents. 

### The format of PDF file names.

Each PDF file being processed should start with it's pubmed id, followed by an underscore and a single letter 
denoting if it is to be included in a target corpus. Thus some examples of possible filenames are as follows:

19763139_A.pdf
19911007_AG.pdf
21470346.pdf

This indicates that the article with the PubMed id 19763139 is a member of the target corpus denoted by the
code 'A'. These codes are set when you create the target corpus. 

Using the Triage System
-----------------------

Once installed, the system permits two modes of use: (A) using 
*command-line tools to administer the server, and upload/process scientific articles into corpora* and 
(B) use the *web interface to assign articles to specific corpora*. 

### Setting up the swfTools directory

The system uses the `pdf2swf` command to convert PDF files to the SWF file for displaying in 
FlexPaper (http://flexpaper.devaldi.com/). We therefore have to identify to the system where to find 
the pdf2swf executable with the following command.

```
setSwfToolsBinDirectory </path/to/pdf2swf/executable>
```

### Building a triage database

This step has to be executed only once.

The triage system stores all of its data in a MySQL database. This includes articles content, classification
codes, and how they are organized into collections (corpora). Before using the triage system you
need to create a trage database using one of the triage commands pre-installed in your system.

In order to execute this command you must select a name and use a suitable login name and password 
for existing user with suitable permissions. 

```
buildTriageDatabase -db <name-of-database> -l <login> -p <password>        

Arguments:  -db DBNAME -l LOGIN -p PASSWD

 Options: 

 -db DBNAME : Database name
 -l LOGIN   : Database login
 -p PASSWD  : Database password
```

### Creating a Target Corpora 

The first step to runnning the system is to build corpora that the triaged articles are being sorted into. 

The following example would create a corpus named 'GO', owned by a user called 'Rocky' with the single letter code 'G'. 
Each target corpus could be all papers concerned with Gene Ontology curation or all papers curated into 
the database as a whole. 

```
editArticleCorpus -name "GO" -desc "Gene Ontology" -owner "Rocky" -regex "G" 
                  -db <name-of-database> -l <login> -p <password> 
                  
Arguments:  -db DBNAME -desc DESCRIPTION -l LOGIN -name NAME -owner OWNER -p PASSWD [-regex REGEX]

 Options: 

 -db DBNAME        : Database name
 -desc DESCRIPTION : Corpus description
 -l LOGIN          : Database login
 -name NAME        : Corpus name
 -owner OWNER      : Corpus owner
 -p PASSWD         : Database password
 -regex REGEX      : Regular expression to recognize incoming files                  
``` 

> Note that the first time you run a database command in this system, the system needs to generate a lookup object 
for the many Journals referenced in pubmed. This is a one-time step. 

### Creating a Target Corpora 

The next step is to build the triage corpora that hold the articles. 

A triage corpus is a special kind of corpus used to organize a collection of articles for the triaging procedure. 
Each triage corpus should denote a natural collection of papers (such as all those papers assigned to a specific 
individual or all papers from a given Journal). A triage corpus is the entry point for a paper in the system.

The following example would create a triage corpus named 'curator1', owned by a user called 'Curator 1'. 

```
editTriageCorpus -name "curator1" -desc "Curator 1's triage corpus" -owner "Curator 1"
                  -db <name-of-database> -l <login> -p <password> 

Arguments:  -db DBNAME -desc DESCRIPTION -l LOGIN -name NAME -owner OWNER -p PASSWD

 Options: 

 -db DBNAME        : Database name
 -desc DESCRIPTION : Corpus description
 -l LOGIN          : Database login
 -name NAME        : Corpus name
 -owner OWNER      : Corpus owner
 -p PASSWD         : Database password
                  
``` 

### Loading Articles into a Triage Corpus 
 
The crucial task of loading files into a triage corpus is performed by the following function:

```
buildTriageCorpusFromPdfDir -pdfs </complete/path/to/pdf/directory> -corpus "<triage-corpus-name>"
                  -db <name-of-database> -l <login> -p <password> 
                  
Arguments:  [-codeList CODES] -corpus CORPUS -db DBNAME -l LOGIN -p PASSWD -pdfs PDF-DIR-OR-FILE [-rules FILE]

 Options: 

 -codeList CODES       : Encoded files
 -corpus CORPUS        : Corpus name
 -db DBNAME            : Database name
 -l LOGIN              : Database login
 -p PASSWD             : Database password
 -pdfs PDF-DIR-OR-FILE : Pdfs directory or file
 -rules FILE           : Rules file
``` 

This will run through all files in the targeted directory and load them into the named triage corpus. Note 
that the system will iterate over *every target corpus* and assign an in-out code to every article. The user 
may supply formatted codes in a text file (using the `-codeList` option) rather than editing each file
name on disk. Thus, if a PDF file has the filename `19763139.pdf` with an entry `19763139_A.pdf` in the codeList
file, it would be assigned a code of `in` to the target corpus designated by the letter `A` and a code of `out` to 
all others. If no codes are assigned either from the file names or from the codeList then *all articles in the
upload will be assigned a code of `unassigned` for all corpora. 

Note also that the way that the text is extracted from the PDF files uses rule files for the `LAPDF-Text` system. 
You may use a specified rule file here to improve performance of the text extraction if necessary.  

### Train machine learning classifiers

Before we can use the classifiers, we need to train them. This is done by the following command:

```
triageDocumentsClassifier -train -targetCorpus "GO" [-homeDir /path/to/directory/for/model] 
                  -db <name-of-database> -l <login> -p <password> 
                  
 -db DBNAME         : Database name
 -homeDir DIR       : Directory where application data will be persisted
 -l LOGIN           : Database login
 -p PASSWD          : Database password
 -targetCorpus NAME : The target corpus that we're linking to
 -train             : If present will train and generate model, if absent will
                      compute and update prediction scores in Triage Document.
                      Either -train or -predict should be specified.
 -triageCorpus NAME : The triage corpus to be evaluated. It is required if
                      -predict is used.
```

This runs through all the example data from all the triage corpora where the in-out code is set to 
either `in` or `out` and trains an SVM classifier (derived from a baseline set of features). There is an
option argument for where the model should be placed, if this is not set then the model will be saved in 
the home directory of the user running the command. 

### Use classifier to assign papers to target corpora.

Applying the classifier is accomplished with the following command:

```
triageDocumentsClassifier -predict -targetCorpus "GO" [-homeDir /path/to/directory/for/model] 
                  -db <name-of-database> -l <login> -p <password> 
                  
 -db DBNAME         : Database name
 -homeDir DIR       : Directory where application data will be persisted
 -l LOGIN           : Database login
 -p PASSWD          : Database password
 -targetCorpus NAME : The target corpus that we're linking to
 -predict           : If present will compute and update prediction scores in
                      Triage Document. Either -train or -predict should be
                      specified.
 -triageCorpus NAME : The triage corpus to be evaluated. It is required if
                      -predict is used.
```

Note that execution of this command is exactly like the training step with a single option changed. This will 
generate scores for each paper in each category.  
This runs through all the example data from all the triage corpora where the in-out code is set to 
either `in` or `out` and trains an SVM classifier (derived from a baseline set of features). There is an
option argument for where the model should be placed, if this is not set then the model will be saved in 
the home directory of the user running the command. 

Starting the Triage Web Application Server
------------------------------------------
```
triageServer  -db <name-of-database> -l <login> -p <password>
``` 

This should start the web server so that the curators can access the display.

Accessing the Triage Web App
----------------------------

Navigate in a browser to:  `http://localhost:8080/triage` 

Stopping the Triage Web App Server
----------------------------------

Currently you should just kill the job that was started with the triageServer command. 

