
DECLARE @SourceNode NVARCHAR(MAX); --set SOURCE, using nvarchar to keep unicode and avoid conversion costs
DECLARE @TargetNode NVARCHAR(MAX); -- set TARGET
DECLARE @K INT = 5; -- set number of shortest paths to find

-- table to store the K shortest paths
CREATE TABLE ShortestPaths (
    Path NVARCHAR(MAX),
    TotalWeight INT
);

-- table to store potential paths for yens invesitgation
CREATE TABLE #PotentialPaths ( --could be lots of potential paths, for performance using a temp table  
    Path NVARCHAR(MAX),
    TotalWeight INT
);



-- initialize with the shortest path from X to Y using Dijkstra
INSERT INTO #PotentialPaths (Path, TotalWeight)
SELECT 'SOURCE -> TARGET' AS Path, --DEBUG 
       CASE WHEN SourceNode = @SourceNode THEN 0 ELSE 1 END AS TotalWeight --testing here
FROM Graph
WHERE SourceNode = @SourceNode
AND TargetNode = @TargetNode;

-- YENS
DECLARE @CurrentPathCount INT = 0;

WHILE @CurrentPathCount < @K AND (SELECT COUNT(*) FROM #PotentialPaths) > 0
BEGIN
    -- get the candidate path with the smallest total weight
    DECLARE @CandidatePath NVARCHAR(MAX);
    DECLARE @CandidateWeight INT;

    SELECT TOP 1 @CandidatePath = Path, @CandidateWeight = TotalWeight
    FROM #PotentialPaths
    ORDER BY TotalWeight;

    -- remove the candidate path from the temporary table
    DELETE FROM #PotentialPaths WHERE Path = @CandidatePath;

    -- add the candidate path to the list of shortest paths
    INSERT INTO ShortestPaths (Path, TotalWeight)
    VALUES (@CandidatePath, @CandidateWeight);

    -- calculate the node where the candidate path deviates
    DECLARE @DeviationNode NVARCHAR(MAX);

    SET @DeviationNode = dbo.FindDeviationNode(@CandidatePath, @ShortestPaths);

    DECLARE @AlternatePaths TABLE (
        Path NVARCHAR(MAX),
        TotalWeight INT
    );

    -- generate potential alternate paths by bypassing the deviation node
    INSERT INTO @AlternatePaths (Path, TotalWeight)
    SELECT Path, TotalWeight
    FROM GenerateAlternatePaths(@CandidatePath, @DeviationNode, @SourceNode, @TargetNode);

    -- add the alternate paths to the temporary table
    INSERT INTO #PotentialPaths (Path, TotalWeight)
    SELECT Path, TotalWeight
    FROM @AlternatePaths;

    SET @CurrentPathCount = @CurrentPathCount + 1;
END;

-- get k paths from result, needs some improvement?
SELECT TOP (@K) * FROM ShortestPaths;



-- finding the point of difference between the current shortest paths and the potential next path
GO
CREATE FUNCTION FindDeviationNode(@CandidatePath NVARCHAR(MAX), @ShortestPaths NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @CandidatePathNodes TABLE (Node NVARCHAR(MAX));
    DECLARE @ShortestPathNodes TABLE (Node NVARCHAR(MAX));

    -- split the candidate path and shortest path into nodes
    INSERT INTO @CandidatePathNodes
    SELECT value
    FROM STRING_SPLIT(@CandidatePath, ' -> ');  --testing string here

    INSERT INTO @ShortestPathNodes
    SELECT value
    FROM STRING_SPLIT(@ShortestPaths, ' -> ');

    -- look for first node of deviation between candidate and shortest path
    DECLARE @DeviationNode NVARCHAR(MAX);

    SELECT TOP 1 @DeviationNode = C.Node
    FROM @CandidatePathNodes C
    LEFT JOIN @ShortestPathNodes S ON C.Node = S.Node
    WHERE S.Node IS NULL;

    RETURN @DeviationNode;
END;


GO
CREATE FUNCTION GenerateAlternatePaths(@CandidatePath NVARCHAR(MAX), @DeviationNode NVARCHAR(MAX), @SourceNode NVARCHAR(MAX), @TargetNode NVARCHAR(MAX))
RETURNS TABLE
AS
RETURN
(
    SELECT
        --combining NewPath as a bridge between source and target
        CONCAT(@SourceNode, ' -> ', NewPath, ' -> ', @TargetNode) AS Path, --testing the ammendment here
        TotalWeight
    FROM
    (
        SELECT
        --target of first
            TargetNode AS NewPath,
            CASE
                WHEN TargetNode = @DeviationNode THEN Weight1
                ELSE Weight1 + (SELECT TotalWeight FROM #PotentialPaths WHERE Path = @CandidatePath)
            END AS TotalWeight
        FROM
        (
            SELECT
                G1.TargetNode,
                G1.Weight AS Weight1
            FROM
                Graph G1 --using graph need all edges
            WHERE
                G1.SourceNode = @SourceNode
                AND G1.TargetNode <> @DeviationNode
                --checking the path isnt already in use, some additional investigation around converter/diverter?
                AND NOT EXISTS (SELECT 1 FROM #PotentialPaths P1 WHERE P1.Path = CONCAT(@SourceNode, ' -> ', G1.TargetNode, ' -> ', @TargetNode)) --checking p1
        ) AS T1
    ) AS T2
);