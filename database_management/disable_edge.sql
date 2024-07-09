CREATE PROCEDURE [dbo].[disable_edge] @id INT
	AS
	BEGIN
        -- To disable an edge
        UPDATE dbo.Edges
            SET edge_status = 0
            WHERE edge_id = @id;
	END
GO
