USE path1db
GO

CREATE PROCEDURE alter_edge @id INT, @value INT
	AS
	BEGIN
		UPDATE dbo.Edges
			SET cost = @value
			WHERE edge_id = @id
	END
GO
