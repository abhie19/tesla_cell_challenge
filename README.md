plans# Tesla cell data team interview test

The goal of this interview test is to get you familiar with the work that you will be doing as a member of the cell data team. Our job is to test new types of batteries.

We understand that you are also busy. To make things easier, we have included an empty SQLite database that you can use for testing.

You have 2 hours to complete the test. Late work will be disqualified. Please email the 4 deliverables to the recruiter.

There are a few tables in ./data that will be important for some of the questions.
<ol>
<li> **Models** a table of cell models and their properties. A sample of this data is in the file data/models.csv </li>
<ol>
<li> model_id: a unique id of the model
<li> model_name: the name of the cell model
<li> open_circuit_voltage: the open circuit voltage of the cell models
<li> energy: rated energy of the cell model
<li> resistance: the rated dc resistance of the cell models
<li> capacity: the rated capacity of the cell model
</ol>

<li> **Shipments** a table of cells that have been shipped to us. A sample of this data is in the directory data/shipments.csv </li>
<ol>
<li> received_date: the date the shipment was received
<li> model_name: the model of the cell
<li> cell_id: the unique id of the cell on the tester
</ol>

<li> **Plans** a table of test plans. This table represents the test data that we run on batteries. </li>
<ol>
<li> plan: the abbreviation of the name of the plan
<li> cell_id: the unique id of the cell on the tester
<li> model_name: same as above
<li> current_ma: the current going through the cell
<li> voltage:
<li> epoch: unix time in seconds
</ol>

## 1
Write a SQL query that determines the average amount of time (in days) that it took to receive a cell to the first time that it was tested.
SQLite, MySQL or PostgresSQL are preferred.

**Deliverable**: sql file ./src/solution/days_to_delivery.sql

## 2
If you received this data as several .csv files (gasp), how would you create the database? What would you use as primary keys and the index? For each table (csv file), write a .sql statement to create the table
MySQL or PostgresSQL are preferred.
**Deliverable**: sql file ./src/solution/create_tables.sql

## 3
Users are looking for specific plans and only know a keyphrase from the plan such as 'AGG' (short for aggressive). Search should be case insensitive

### 3a.
Write a python function that takes a substring and returns all of the relevant tests. The function signature looks like
``` python
def find_plan(input_string, plans):
  """
  Args:
    input_string (str): input string, example is 'AGG'
    plans (list): a list of plans to select from
  Returns
    relevant_plans (list): list of relevant plans

  return list_of_relevant_plans
  """
```

**Deliverable** python file ./src/solution/utils.py
### 3b.
Write a test function for the function in 3a.

``` python
def test_find_plan():
  # finish the function
  # assert something == something else
```
**Deliverable** python file ./tests/test_utils.py
