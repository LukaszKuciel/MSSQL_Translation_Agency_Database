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

__*Customers*__
* CustomerID - mandatory, integer, unique, primary key
* Name - mandatory, inscription no longer than 150 characters long
* Address - mandatory, inscription no longer than 250 characters long
* Email - mandatory, string length not exceeding 320 characters

__*Documents*__
* DocumentID - mandatory, integer, unique, primary key
* Title - mandatory, inscription no longer than 250 characters long
* WordsCount - mandatory, number
* FileURL - optional, inscription no longer than 250 characters long
* Origin - mandatory, single character

__*Languages*__
* LanguageID - mandatory, integer, unique, primary key
* Name - mandatory, inscription no longer than 150 characters long
* RatePerWord - mandatory, number with a decimal

__*Translators*__
* TranslatorID - mandatory, integer, unique, primary key
* FirstName - mandatory, inscription length not exceeding 250 characters
* LastName - mandatory, inscription no longer than 250 characters long
* Address - optional, inscription no longer than 250 characters long
* Email - mandatory, string length not exceeding 320 characters

__*Orders*__
* OrderID - mandatory, integer, unique, primary key
* DocumentID - mandatory, integer
* LanguageID - mandatory, integer
* Finished - mandatory, single character
* StartDate - mandatory, date and time
* EndDate - mandatory, date and time
* Price - mandatory, number with decimal development


#### Buisness rules verification
* Fact 1 is modelled by the dependence of "Translators are assigned to many orders" between entities "Translators" and "Orders".
* Fact 2 is modelled by introducing the "Orders_Translators" relational table between entities "Translators" and "Orders" having the attribute "TranslatedPercentage".
* Fact 3 is modelled by creating in the relational table "Orders_Translators" a key composed of "OrderID" and "TranslatorID".
* Fact 4 and Fact 7 are modelled by the dependence of "Customers has many documents" between entities "Customers" and "Documents".
* Fact 5 implemented by the TRIGGER procedure described in the physical model.
* Fact 6 is modelled by the dependency of "Document has many translation orders" between entities "Orders" and "Documents".
* Fact 8 is modelled by the dependency of "Documents has various languages" between entities "Documents" and "Languages".
* Fact 9 is modelled by the dependency of "Language is a target for many orders" between entities "Orders" and "Languages".
* Fact 10 is modelled by the dependence of "Translator knows many languages" between entities "Languages" and "Translators".
* Fact 11 was implemented through the TRIGGER type procedure described in the physical model.
* Fact 12 is modelled by introducing the "Orders_Translators" relational table between entities "Translators" and "Orders" having the "ReviewRate" and "ReviewComment" attributes.


### Physical/Universal data model
<img src="https://i.imgur.com/EdvaZ62.png" alt="Physical/Universal data model" width="500">

__*Comments:*__
* In the Orders table, enter CONSTRAINT CHECK with the content: StartDate < EndDate
* In the Orders table, we introduce the TRIGGER (firing procedure) of INSTEAD OF INSERT aimed at verifying if there is a translator who knows the language in which the requested document is written and the language into which it is to be translated. If this condition is not met, the order will not be created. The second goal of the procedure is to calculate the price per order based on the number of words in the ordered document and word rates for the selected language.
* In the Orders_Translators table, enter CONSTRAINT CHECK with the following content: ReviewRate> = 1 AND ReviewRate <= 5. This is to prevent the evaluation from being translated for a non-range translation
from 1-5.


## Database realisation
Code for database can be found in /SQL directory. 
For database testing run sql commands from files as follows:
1. Database.sql
2. TestData.sql
3. ExampleQueries.sql

### MSSQL database realization diagram
<img src="https://i.imgur.com/K6w2Xuy.png" alt="MSSQL database realization diagram" width="500">
