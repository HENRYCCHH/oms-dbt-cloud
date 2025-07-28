SELECT
    OrderID,
    OrderDate,
    CustomerID,
    EmployeeID,
    StoreID,
    Status as StatusCD,
    CASE
        WHEN Status = '01' THEN 'In Progress'
        WHEN Status = '02' THEN 'Completed'
        WHEN Status = '03' THEN 'Cancelled'
        ELSE null
    END as StatusDesc,
    CASE
        WHEN StoreID = 1000 THEN 'Online'
        ELSE 'In-store'
    END as ODER_CHANNEL,
    Updated_at,
    current_timestamp as dbt_updated_at
FROM
    {{source('landing','orders')}}        
