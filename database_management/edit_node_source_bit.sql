-- Create a stored procedure for setting a node as the source node
CREATE PROCEDURE [dbo].[edit_node_source_bit]
    @node_id INT,  
    @is_source BIT
AS
BEGIN
    -- Update the node_status to set the node as the source
    UPDATE dbo.Nodes
        SET is_source = @is_source
        WHERE node_id = @node_id;
END;
GO