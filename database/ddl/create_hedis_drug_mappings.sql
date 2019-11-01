DROP TABLE dbo.hedis_drug_mappings;

CREATE TABLE dbo.hedis_drug_mappings (
    medication_list	VARCHAR(255)
    , ndc_code BIGINT
);

CREATE INDEX idx_hedis_drug_mappings_ndc_code ON dbo.hedis_drug_mappings (ndc_code)