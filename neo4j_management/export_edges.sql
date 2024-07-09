use path1db

select
  json_value([$edge_id_D6DAD1ED3FF74A99BC780210FF6B9FED],'$.id') as edge_id,
  json_value([$from_id_A0BAFF2971534EEE92FA4F8D33D69E74],'$.id') as from_id,
  json_value([$to_id_D0F49F56588C4C408C16641A578C6313],'$.id') as to_id,
  cost, edge_status
from Edges
where edge_status = 1