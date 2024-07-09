CREATE PROCEDURE [dbo].[enable_edge] @id INT
	AS
	BEGIN
        -- To enable an edge
        UPDATE dbo.Edges
            SET edge_status = 1
            WHERE edge_id = @id;
	END
GO