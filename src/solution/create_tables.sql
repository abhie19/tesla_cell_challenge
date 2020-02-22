''' I will create the following tables
Models
Cells
Shipments
Plans

with slightly modified schema as seen in the create statements. Following are the highlight changes-
1- Create new cell table to map cell and model
2 - Remove model name from shipments
3 - Update Shipment table to have shipment_id, date and cell id
4 - Create primary keys in each table
5 - Create foregin keys to establish referential integrity in Shipments,Cells and Plans table

Next, to import the data from CSV, I will use pandas Dataframe API to read csv and then convert it into sql using .to_sql function in pandas.
'''
CREATE TABLE IF NOT EXISTS Models( 
             [model_id] INTEGER NOT NULL PRIMARY KEY, 
             [model_name] varchar(255) NOT NULL, 
             [open_circuit_voltage] DECIMAL(6,2), 
             [energy] integer DECIMAL(6,2), 
             [resistance] INTEGER, 
             [energy] INTEGER );

CREATE TABLE IF NOT EXISTS Shipments( 
             [shipment_id] INTEGER PRIMARY KEY,  
             [received_date] varchar(255) NOT NULL, 
             CONSTRAINT cell_id
                    FOREIGN KEY (cell_id) REFERENCES Cells(cell_id));

CREATE TABLE IF NOT EXISTS Cells( 
             [cell_id] varchar(255) NOT NULL PRIMARY KEY,  
             CONSTRAINT model_id
                    FOREIGN KEY (model_id) REFERENCES Cells(model_id));

CREATE TABLE IF NOT EXISTS Plans( 
             [plan_id] INTEGER PRIMARY KEY, 
             [plan] varchar(255) NOT NULL, 
             [current_ma] INTEGER, 
             [voltage] INTEGER, 
             [epoch] INTEGER ), 
             CONSTRAINT model_id
                    FOREIGN KEY (model_id) REFERENCES Cells(model_id), 
             CONSTRAINT cell_id
                    FOREIGN KEY (cell_id) REFERENCES Cells(cell_id));

CREATE INDEX by_plan
ON Plans(plan);