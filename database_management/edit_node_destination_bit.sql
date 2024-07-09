-- Create a stored procedure for setting a node as the source node
CREATE PROCEDURE [dbo].[edit_node_destination_bit]
    @node_id INT,  
    @is_destination BIT
AS
BEGIN
    -- Update the node_status to set the node as the source
    UPDATE dbo.Nodes
        SET is_destination = @is_destination
        WHERE node_id = @node_id;
END;
GO