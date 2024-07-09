SELECT Edges, cost, levels
FROM (
    SELECT
        Node1.node_name AS node_name,
        STRING_AGG(Node2.node_name, '->') WITHIN GROUP (GRAPH PATH) AS Edges,
        LAST_VALUE(Node2.node_name) WITHIN GROUP (GRAPH PATH) AS LastNode,
		SUM(e.cost + Node2.cost) WITHIN GROUP (GRAPH PATH) AS cost,
		COUNT(Node2.node_name) WITHIN GROUP (GRAPH PATH) AS levels
    FROM
        Nodes AS Node1,
        Edges FOR PATH AS e,
        Nodes FOR PATH  AS Node2
    WHERE MATCH(SHORTEST_PATH(Node1(-(e)->Node2)+))
    AND Node1.node_name = 'SOURCE_1'
) AS Q
WHERE Q.LastNode = 'DEST1'
