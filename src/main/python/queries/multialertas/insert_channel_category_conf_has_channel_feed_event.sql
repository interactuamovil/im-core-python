INSERT INTO channel_category_conf_has_channel_feed_event (channel_category_conf_id, channel_feed_event_id)
SELECT channel_category_conf_id, :channel_feed_event_id
FROM channel_category_conf
WHERE is_active = 1;