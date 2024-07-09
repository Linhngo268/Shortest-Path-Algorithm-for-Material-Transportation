USE path1db
GO


/* alter edges */
CREATE PROCEDURE alter_edge @id INT, @value INT
	AS
	BEGIN
		UPDATE dbo.Edges
			SET cost = @value
			WHERE edge_id = @id
	END
GO


/* alter node */
CREATE PROCEDURE alter_node @id INT, @value INT
	AS
	BEGIN
		UPDATE dbo.Nodes
			SET cost = @value
			WHERE node_id = @id
	END
GO



/* disable node */
CREATE PROCEDURE [dbo].[disable_node] @id INT, @name VARCHAR(50)
	AS
	BEGIN
        -- To disable a node
        UPDATE dbo.Nodes
            SET node_status = 0
            WHERE node_id = @id AND node_name = @name;
	END
GO


/* enable node */
CREATE PROCEDURE [dbo].[enable_node] @id INT, @name VARCHAR(50)
	AS
	BEGIN
        -- To disable a node
        UPDATE dbo.Nodes
            SET node_status = 1
            WHERE node_id = @id AND node_name = @name;
	END
GO
