
INSERT INTO `tenant_server_connections` (`id`, `schema_server`, `schema_name`, `schema_server_port`, `schema_username`, `schema_password`, `auto_update`, `pool_initial_size`, `pool_validation_interval`, `pool_remove_abandoned`, `pool_remove_abandoned_timeout`, `pool_log_abandoned`, `pool_abandon_when_percentage_full`, `pool_test_on_borrow`, `pool_max_active`, `pool_min_idle`, `pool_max_idle`, `pool_suspect_timeout`, `pool_time_between_eviction_runs_millis`, `pool_min_evictable_idle_time_millis`, `deadlock_max_retries`, `deadlock_max_retry_interval`) VALUES
	(11, 'localhost', 'mifostenant-nyumba', '3306', 'root', 'mysql', 1, 5, 30000, 1, 60, 1, 50, 1, 40, 20, 10, 60, 34000, 60000, 0, 1);

INSERT INTO `tenants` (`id`, `identifier`, `name`, `timezone_id`, `country_id`, `joined_date`, `created_date`, `lastmodified_date`, `oltp_id`, `report_id`) VALUES
	(11, 'nyumba', 'nyumba', 'Asia/Kolkata', NULL, NULL, NULL, NULL, 11, 11);