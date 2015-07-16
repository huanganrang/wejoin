-- xuwenming 2015-07-16 start --
ALTER TABLE `dive_certificate_authority`
	ADD COLUMN `account_id` VARCHAR(36) NULL COMMENT '用户ID' AFTER `id`;
	
ALTER TABLE `dive_certificate_authority`
	CHANGE COLUMN `auth_date` `auth_date` DATE NULL DEFAULT NULL AFTER `audit_date`;
	
ALTER TABLE `dive_collect`
	ADD COLUMN `account_id` VARCHAR(36) NULL COMMENT '用户id' AFTER `id`;
-- xuwenming 2015-07-16 end --