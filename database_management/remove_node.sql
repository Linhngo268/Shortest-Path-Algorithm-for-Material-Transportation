USE path1db
GO

-- Create a stored procedure for creating a node
CREATE PROCEDURE dbo.remove_node
    @node_id INT -- Input parameter for node name
AS
BEGIN
    -- Delete row for nodes
    DELETE FROM dbo.Nodes WHERE node_id = @node_id;

    -- Delete edges connecting to the node
    DECLARE @from_id_str NVARCHAR(1000);
    SET @from_id_str = '{"type":"node","schema":"dbo","table":"Nodes","id":' + CAST(@node_id AS NVARCHAR(10)) + '}';
    DELETE FROM dbo.Edges WHERE $from_id = @from_id_str;

    DECLARE @to_id_str NVARCHAR(1000);
    SET @to_id_str = '{"type":"node","schema":"dbo","table":"Nodes","id":' + CAST(@node_id AS NVARCHAR(10)) + '}';
    DELETE FROM dbo.Edges WHERE $to_id = @to_id_str;
END
GO
