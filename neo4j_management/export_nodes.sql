use path1db

select node_id, node_name, is_source, is_destination, node_status, cost from Nodes
where node_status = 1