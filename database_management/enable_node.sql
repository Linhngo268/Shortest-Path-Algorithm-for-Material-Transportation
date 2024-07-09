CREATE PROCEDURE [dbo].[enable_node] @id INT, @name VARCHAR(50)
	AS
	BEGIN
        -- To enable a node
        UPDATE dbo.Nodes
            SET node_status = 1
            WHERE node_id = @id AND node_name = @name;
	END
GO
