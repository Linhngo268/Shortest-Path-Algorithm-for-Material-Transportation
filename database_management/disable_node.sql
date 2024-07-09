CREATE PROCEDURE [dbo].[disable_node] @id INT, @name VARCHAR(50)
	AS
	BEGIN
        -- To disable a node
        UPDATE dbo.Nodes
            SET node_status = 0
            WHERE node_id = @id AND node_name = @name;
	END
GO
