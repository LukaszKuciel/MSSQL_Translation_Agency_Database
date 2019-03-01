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
1. The order can be translated by one or many translators.
2. For each translator of a given order, the percentage share in the translation is determined.
3. A translator cannot be assigned twice to translate the same order.
4. The customer may have many documents in different original languages.
5. The client may order his documents for translation but only if there is a translator who knows both
the language of the original and the language of translation.
6. The document can be translated many times into various languages ​​offered.
7. The document can belong to only one client.
8. The language can specify the language of the original for many documents.
9. The language can define the language of translation for many orders.
10. The translator may know many languages.
11. A fee is charged for each order.
12. The client may issue a grade and comment to the translator for the part of the order he has completed.

### Logical data model
<img src="https://i.imgur.com/s5JFhUI.png" alt="Logical data model" width="500">

#### Description of entities and attributes and their fields

_*Customers*_
* CustomerID - mandatory, integer, unique, primary key
* Name - mandatory, inscription no longer than 150 characters long
* Address - mandatory, inscription no longer than 250 characters long
* Email - mandatory, string length not exceeding 320 characters
_*Documents*_
* DocumentID - mandatory, integer, unique, primary key
* Title - mandatory, inscription no longer than 250 characters long
* WordsCount - mandatory, number
* FileURL - optional, inscription no longer than 250 characters long
* Origin - mandatory, single character
_*Languages*_
* LanguageID - mandatory, integer, unique, primary key
* Name - mandatory, inscription no longer than 150 characters long
* RatePerWord - mandatory, number with a decimal
_*Translators*_
* TranslatorID - mandatory, integer, unique, primary key
* FirstName - mandatory, inscription length not exceeding 250 characters
* LastName - mandatory, inscription no longer than 250 characters long
* Address - optional, inscription no longer than 250 characters long
* Email - mandatory, string length not exceeding 320 characters
_*Orders*_
* OrderID - mandatory, integer, unique, primary key
* DocumentID - mandatory, integer
* LanguageID - mandatory, integer
* Finished - mandatory, single character
* StartDate - mandatory, date and time
* EndDate - mandatory, date and time
* Price - mandatory, number with decimal development


#### Description of entities and attributes and their fields

### Physical/Universal data model
<img src="https://i.imgur.com/EdvaZ62.png" alt="Physical/Universal data model" width="500">

## Database realisation
Code for database can be found in /SQL directory. 
For database testing run sql commands from files as follows:
1. Database.sql
2. TestData.sql
3. ExampleQueries.sql

### MSSQL database realization diagram
<img src="https://i.imgur.com/K6w2Xuy.png" alt="MSSQL database realization diagram" width="500">
