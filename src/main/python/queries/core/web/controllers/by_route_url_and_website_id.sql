SELECT c.*, a.action_id
FROM controller c
JOIN action a ON a.controller_id = c.controller_id AND a.is_active = 1
LEFT JOIN route r ON r.action_id = a.action_id AND r.is_active = 1
JOIN product_has_feature_set phf ON phf.feature_set_id = c.feature_set_id
JOIN instance i ON i.product_id = phf.product_id
JOIN website_has_instance whi ON whi.instance_id = i.instance_id
WHERE whi.website_id = :website_id 
AND :path IN (r.path, CONCAT('/', REPLACE(SUBSTRING_INDEX(a.key, '.', -2), '.', '/')))
