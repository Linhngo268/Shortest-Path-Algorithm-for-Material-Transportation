-- Create a stored procedure for creating a node
CREATE PROCEDURE [dbo].[create_node]
    @node_name VARCHAR(50),          -- Input parameter for node name
    @is_source BIT,                  -- Input parameter for is_source
    @is_destination BIT,             -- Input parameter for is_destination
    @node_status BIT,                -- Input parameter for node status
    @to_node_id INT,                 -- Input parameter for to_node_id
    @edge_status BIT,                -- Input parameter for edge status
    @edge_id INT OUTPUT               -- Output parameter for edge ID
AS
    BEGIN

        -- Declare variables 
        DECLARE @new_node_id INT;

        -- Insert a new node into the Nodes table
        INSERT INTO dbo.Nodes (node_name, is_source, is_destination, node_status, cost)
        VALUES (@node_name, @is_source, @is_destination, @node_status, 1);

        -- Retrieve the newly created node ID
        SET @new_node_id = SCOPE_IDENTITY();

        DECLARE @from_id_str NVARCHAR(1000);
        DECLARE @to_id_str NVARCHAR(1000);

        -- Create JSON strings
        SET @from_id_str = '{"type":"node","schema":"dbo","table":"Nodes","id":' + CAST(@new_node_id AS NVARCHAR(10)) + '}';
        SET @to_id_str = '{"type":"node","schema":"dbo","table":"Nodes","id":' + CAST(@to_node_id AS NVARCHAR(10)) + '}';


        -- Insert a new edge into the Edges table if it doesn't already exist
        INSERT INTO dbo.Edges (
            [$from_id_95F2D2D03B554010AEDFFE3B1D61BDD9],
            [$to_id_8D6869E4517749C4B414367CB895D030],
            cost,
            edge_status
        )
        VALUES (@from_id_str, @to_id_str, 1, @edge_status);

        -- Retrieve the newly created edge ID
        SET @edge_id = SCOPE_IDENTITY(); 

        -- Print the edge ID
        PRINT 'Edge ID: ' + CAST(@edge_id AS VARCHAR(10)); 

    END;
GO
