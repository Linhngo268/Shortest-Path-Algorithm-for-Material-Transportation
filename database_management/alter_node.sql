USE path1db
GO

CREATE PROCEDURE alter_node @id INT, @value INT
	AS
	BEGIN
		UPDATE dbo.Nodes
			SET cost = @value
			WHERE node_id = @id
	END
GO
