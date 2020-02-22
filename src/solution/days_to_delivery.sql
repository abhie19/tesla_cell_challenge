CREATE FUNCTION [Plans].[GetDateTimeFromEpoch] ( @pInputEpoch BigInt )
RETURNS DATETIME
BEGIN

    RETURN datetime(@pInputEpoch, 'unixepoch', 'localtime') as StartedTestTime

END
GO

CREATE TEMPORARY TABLE ConvertTODaysPerCell AS 
Select (cast(julianday(Plans.GetDateTimeFromEpoch(p,epoch)) - julianday(s.received_date)) as Integer) DaysTaken, p.cell_id as CELLId
From Shipments s 
On s.cell_id = p.cell_id
group by p.cell_id


Select AVG(ConvertTODaysPerCell.DaysTaken) as AVG_TIME_PER_Cell, ConvertTODaysPerCell.CELLId
From ConvertTODays

/* Created a function that returns datetime for the epoch given in plans table for each cell */
/* Created a temporary table that would calulate the difference from the day the shipment was recieved and to the day the test started, it calls the function [GetDateTimeFromEpoch] to get normal datetime from epoch.*/
/* Finally it calculate the average time for each cell */