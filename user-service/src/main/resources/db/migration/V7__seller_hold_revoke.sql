ALTER TABLE seller_profiles
    CHANGE COLUMN rejection_reason admin_remark VARCHAR(500) NULL,
    ADD COLUMN correction_submitted_at DATETIME NULL;
