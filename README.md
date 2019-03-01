# Simple SQL database project for online translation agency

## Problem

According to the client's requirements, the database is designed to provide information about translation requests (date
start, end date, the language of translation, translated document), information about translators (first name,
surname, the percentage value of the order, evaluation, known languages), customer information (name, address,
customer documents) and documents (title, number of words, original language).

The database is the basis for developing an application that facilitates data entry and searches it. Sample queries (queries) to the database:
* Provide a list of translators who know both necessary languages to translate the document and provide the cost
translations
* Provide a list of languages with the number of translations ordered, average lead time and total income from
every language
* Provide a list of translators with an average grade and the number of translations completed
* Provide a list of documents already completed for a given client
* Provide a list of documents that are currently in the translation process
* Enter a list of languages with the number of translators who know the language sorted by the cost of the translation in descending order
* Provide a list of documents sorted by the number of words contained in them, descending

## Data Model

### Dictionary of concepts

* Language - has a translation rate per word.
* Translator - employee, translates assignments assigned to him/her.
* Document - has the language of the original, belongs to one customer, is the subject of the translation.


### Buisness rules

### Logical data model
<img src="https://i.imgur.com/s5JFhUI.png" alt="Logical data model" width="500">

#### Description of entities and attributes and their fields

#### Description of entities and attributes and their fields

### Physical/Universal data model
<img src="https://i.imgur.com/EdvaZ62.png" alt="Physical/Universal data model" width="500">

## Database realisation
### MSSQL database realization diagram
<img src="https://i.imgur.com/K6w2Xuy.png" alt="MSSQL database realization diagram" width="500">
