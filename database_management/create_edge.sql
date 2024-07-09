-- Create a stored procedure for creating an edge
CREATE PROCEDURE [dbo].[create_edge]
    @from_node_id INT,                  -- Input parameter for from_node_id
    @to_node_id INT,                    -- Input parameter for to_node_id
    @edge_status BIT,                    -- Input parameter for edge status
    @edge_id INT OUTPUT               -- Output parameter for edge ID
AS
BEGIN
    -- Declare variables to store the actual from_id and to_id
    DECLARE @from_id INT;
    DECLARE @to_id INT;

    -- Retrieve the actual from_id and to_id from the Nodes table
    SELECT @from_id = node_id FROM dbo.Nodes WHERE node_id = @from_node_id;
    SELECT @to_id = node_id FROM dbo.Nodes WHERE node_id = @to_node_id;

    DECLARE @from_id_str NVARCHAR(1000);
    DECLARE @to_id_str NVARCHAR(1000);

    -- Create JSON strings
    SET @from_id_str = '{"type":"node","schema":"dbo","table":"Nodes","id":' + CAST(@from_id AS NVARCHAR(10)) + '}';
    SET @to_id_str = '{"type":"node","schema":"dbo","table":"Nodes","id":' + CAST(@to_id AS NVARCHAR(10)) + '}';

    -- Check if an edge already exists between these nodes
    IF EXISTS (
        SELECT 1
        FROM dbo.Edges
        WHERE [$from_id_95F2D2D03B554010AEDFFE3B1D61BDD9] = @from_id_str
        AND [$to_id_8D6869E4517749C4B414367CB895D030] = @to_id_str
    )
    BEGIN
        -- Handle the case where an edge already exists (e.g., update or return an error)
        -- For example, you can choose to update the edge status or take other appropriate actions.
        -- Here, we'll just print a message for demonstration.
        PRINT 'An edge already exists between these nodes.';
    END
    ELSE
    BEGIN
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

    END;
END;
GO
