-- Create database for SaaS Company Business Intelligence
CREATE DATABASE IF NOT EXISTS saas_bi_db;
USE saas_bi_db;

-- =====================================
-- CORE ENTITY TABLES
-- =====================================

-- Table1: Companies/Organizations
CREATE TABLE table1 (
    id VARCHAR(36) PRIMARY KEY,
    field1 VARCHAR(200) NOT NULL,              -- company_name
    field2 VARCHAR(100),                       -- industry
    field3 ENUM('startup', 'small', 'medium', 'large', 'enterprise') NOT NULL,  -- company_size
    field4 DECIMAL(15,2),                      -- annual_revenue
    field5 VARCHAR(255),                       -- website
    field6 VARCHAR(100),                       -- headquarters_country
    field7 VARCHAR(100),                       -- headquarters_state
    field8 VARCHAR(100),                       -- headquarters_city
    field9 INT,                                -- founded_year
    field10 ENUM('active', 'churned', 'trial', 'suspended') DEFAULT 'active',  -- status
    field11 ENUM('organic', 'paid_ads', 'referral', 'partner', 'direct_sales', 'content_marketing') NOT NULL,  -- acquisition_channel
    field12 VARCHAR(36),                       -- sales_rep_id
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table2: Users within organizations
CREATE TABLE table2 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                 -- company_id (FK to table1)
    field1 VARCHAR(100) NOT NULL,             -- first_name
    field2 VARCHAR(100) NOT NULL,             -- last_name
    field3 VARCHAR(255) UNIQUE NOT NULL,      -- email
    field4 VARCHAR(150),                      -- job_title
    field5 VARCHAR(100),                      -- department
    field6 BOOLEAN DEFAULT FALSE,             -- is_primary_contact
    field7 BOOLEAN DEFAULT FALSE,             -- is_billing_contact
    field8 VARCHAR(20),                       -- phone
    field9 VARCHAR(50),                       -- timezone
    field10 TIMESTAMP,                        -- last_login
    field11 ENUM('active', 'inactive', 'pending') DEFAULT 'active',  -- status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ref1) REFERENCES table1(id)
);

-- Table3: Product catalog
CREATE TABLE table3 (
    id VARCHAR(36) PRIMARY KEY,
    field1 VARCHAR(150) NOT NULL,             -- product_name
    field2 ENUM('analytics', 'automation', 'collaboration', 'security', 'integration') NOT NULL,  -- product_category
    field3 TEXT,                              -- description
    field4 BOOLEAN DEFAULT TRUE,              -- is_active
    field5 DATE,                              -- launch_date
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table4: Pricing plans
CREATE TABLE table4 (
    id VARCHAR(36) PRIMARY KEY,
    field1 VARCHAR(100) NOT NULL,             -- plan_name
    field2 ENUM('free', 'basic', 'professional', 'premium', 'enterprise') NOT NULL,  -- plan_tier
    field3 ENUM('monthly', 'quarterly', 'annual') NOT NULL,  -- billing_cycle
    field4 DECIMAL(10,2) NOT NULL,            -- base_price
    field5 INT,                               -- max_users
    field6 INT,                               -- max_storage_gb
    field7 JSON,                              -- features
    field8 BOOLEAN DEFAULT TRUE,              -- is_active
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table5: Product-Plan relationships (many-to-many)
CREATE TABLE table5 (
    ref1 VARCHAR(36),                         -- product_id (FK to table3)
    ref2 VARCHAR(36),                         -- plan_id (FK to table4)
    field1 JSON,                              -- included_features
    field2 JSON,                              -- usage_limits
    PRIMARY KEY (ref1, ref2),
    FOREIGN KEY (ref1) REFERENCES table3(id),
    FOREIGN KEY (ref2) REFERENCES table4(id)
);

-- Table6: Active subscriptions
CREATE TABLE table6 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                -- company_id (FK to table1)
    ref2 VARCHAR(36) NOT NULL,                -- plan_id (FK to table4)
    field1 ENUM('trial', 'active', 'paused', 'cancelled', 'expired') NOT NULL,  -- subscription_status
    field2 DATE NOT NULL,                     -- start_date
    field3 DATE,                              -- end_date
    field4 DATE,                              -- trial_end_date
    field5 ENUM('monthly', 'quarterly', 'annual') NOT NULL,  -- billing_cycle
    field6 DECIMAL(10,2) NOT NULL,            -- monthly_recurring_revenue
    field7 DECIMAL(12,2),                     -- annual_contract_value
    field8 INT DEFAULT 1,                     -- seats_purchased
    field9 INT DEFAULT 0,                     -- seats_used
    field10 BOOLEAN DEFAULT TRUE,             -- auto_renewal
    field11 TEXT,                             -- cancellation_reason
    field12 TIMESTAMP NULL,                   -- cancelled_at
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ref1) REFERENCES table1(id),
    FOREIGN KEY (ref2) REFERENCES table4(id)
);

-- Table7: Transaction history and invoices
CREATE TABLE table7 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                -- subscription_id (FK to table6)
    ref2 VARCHAR(36) NOT NULL,                -- company_id (FK to table1)
    field1 ENUM('subscription', 'setup_fee', 'overage', 'refund', 'discount') NOT NULL,  -- transaction_type
    field2 DECIMAL(10,2) NOT NULL,            -- amount
    field3 DECIMAL(8,2) DEFAULT 0,            -- tax_amount
    field4 DECIMAL(10,2) NOT NULL,            -- total_amount
    field5 VARCHAR(3) DEFAULT 'USD',          -- currency
    field6 DATE NOT NULL,                     -- transaction_date
    field7 ENUM('credit_card', 'bank_transfer', 'paypal', 'invoice') NOT NULL,  -- payment_method
    field8 ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL,  -- payment_status
    field9 VARCHAR(50),                       -- invoice_number
    field10 ENUM('Q1', 'Q2', 'Q3', 'Q4') NOT NULL,  -- quarter
    field11 INT NOT NULL,                     -- fiscal_year
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ref1) REFERENCES table6(id),
    FOREIGN KEY (ref2) REFERENCES table1(id)
);

-- Table8: Sales opportunities and pipeline
CREATE TABLE table8 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                -- company_id (FK to table1)
    field1 VARCHAR(200) NOT NULL,             -- opportunity_name
    field2 ENUM('lead', 'qualified', 'proposal', 'negotiation', 'closed_won', 'closed_lost') NOT NULL,  -- sales_stage
    field3 ENUM('website', 'referral', 'cold_outreach', 'marketing_campaign', 'trade_show', 'partner') NOT NULL,  -- lead_source
    field4 DECIMAL(12,2),                     -- expected_revenue
    field5 INT CHECK (field5 >= 0 AND field5 <= 100),  -- probability
    field6 DATE,                              -- expected_close_date
    field7 DATE,                              -- actual_close_date
    field8 VARCHAR(36),                       -- sales_rep_id
    field9 VARCHAR(100),                      -- sales_rep_name
    field10 TEXT,                             -- lost_reason
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ref1) REFERENCES table1(id)
);

-- Table9: Marketing campaigns
CREATE TABLE table9 (
    id VARCHAR(36) PRIMARY KEY,
    field1 VARCHAR(200) NOT NULL,             -- campaign_name
    field2 ENUM('email', 'social_media', 'ppc', 'content', 'webinar', 'trade_show', 'seo') NOT NULL,  -- campaign_type
    field3 ENUM('google_ads', 'facebook', 'linkedin', 'twitter', 'email', 'blog', 'webinar', 'events') NOT NULL,  -- channel
    field4 DATE NOT NULL,                     -- start_date
    field5 DATE,                              -- end_date
    field6 DECIMAL(10,2),                     -- budget
    field7 DECIMAL(10,2) DEFAULT 0,           -- spend
    field8 INT DEFAULT 0,                     -- impressions
    field9 INT DEFAULT 0,                     -- clicks
    field10 INT DEFAULT 0,                    -- conversions
    field11 INT DEFAULT 0,                    -- leads_generated
    field12 TEXT,                             -- target_audience
    field13 ENUM('planning', 'active', 'paused', 'completed') DEFAULT 'planning',  -- status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table10: Campaign attribution (linking leads to campaigns)
CREATE TABLE table10 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                -- company_id (FK to table1)
    ref2 VARCHAR(36) NOT NULL,                -- campaign_id (FK to table9)
    field1 ENUM('first_touch', 'last_touch', 'multi_touch') NOT NULL,  -- attribution_type
    field2 DATE NOT NULL,                     -- conversion_date
    field3 DECIMAL(12,2),                     -- revenue_attributed
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ref1) REFERENCES table1(id),
    FOREIGN KEY (ref2) REFERENCES table9(id)
);

-- Table11: Product usage metrics
CREATE TABLE table11 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                -- company_id (FK to table1)
    ref2 VARCHAR(36),                         -- user_id (FK to table2)
    ref3 VARCHAR(36) NOT NULL,                -- product_id (FK to table3)
    field1 DATE NOT NULL,                     -- metric_date
    field2 INT DEFAULT 0,                     -- daily_active_users
    field3 INT DEFAULT 0,                     -- monthly_active_users
    field4 JSON,                              -- feature_usage
    field5 INT DEFAULT 0,                     -- session_duration_minutes
    field6 INT DEFAULT 0,                     -- api_calls
    field7 DECIMAL(8,2) DEFAULT 0,            -- storage_used_gb
    field8 DECIMAL(10,2) DEFAULT 0,           -- data_processed_gb
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ref1) REFERENCES table1(id),
    FOREIGN KEY (ref2) REFERENCES table2(id),
    FOREIGN KEY (ref3) REFERENCES table3(id)
);

-- Table12: Customer success and health scores
CREATE TABLE table12 (
    id VARCHAR(36) PRIMARY KEY,
    ref1 VARCHAR(36) NOT NULL,                -- company_id (FK to table1)
    field1 INT CHECK (field1 >= 0 AND field1 <= 100),  -- health_score
    field2 ENUM('low', 'medium', 'high', 'critical') NOT NULL,  -- churn_risk
    field3 DATE,                              -- last_engagement_date
    field4 INT DEFAULT 0,                     -- support_tickets_count
    field5 INT CHECK (field5 >= -100 AND field5 <= 100),  -- nps_score
    field6 VARCHAR(100),                      -- csm_assigned
    field7 INT CHECK (field7 >= 0 AND field7 <= 100),  -- renewal_probability
    field8 ENUM('none', 'low', 'medium', 'high') DEFAULT 'none',  -- expansion_opportunity
    field9 TEXT,                              -- notes
    field10 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- calculated_at
    FOREIGN KEY (ref1) REFERENCES table1(id)
);

-- =====================================
-- INDEXES FOR PERFORMANCE
-- =====================================

-- Table1 (Companies) indexes
CREATE INDEX idx_table1_field10 ON table1(field10);      -- status
CREATE INDEX idx_table1_field7_field6 ON table1(field7, field6);  -- location
CREATE INDEX idx_table1_field3 ON table1(field3);        -- company_size
CREATE INDEX idx_table1_field11 ON table1(field11);      -- acquisition_channel

-- Table2 (Users) indexes
CREATE INDEX idx_table2_ref1 ON table2(ref1);            -- company_id
CREATE INDEX idx_table2_field3 ON table2(field3);        -- email

-- Subscription and financial indexes
CREATE INDEX idx_table6_ref1 ON table6(ref1);            -- company_id
CREATE INDEX idx_table6_ref2 ON table6(ref2);            -- plan_id
CREATE INDEX idx_table6_field1 ON table6(field1);        -- subscription_status
CREATE INDEX idx_table6_field2_field3 ON table6(field2, field3);  -- dates
CREATE INDEX idx_table7_ref2 ON table7(ref2);            -- company_id
CREATE INDEX idx_table7_field6 ON table7(field6);        -- transaction_date
CREATE INDEX idx_table7_field10_field11 ON table7(field10, field11);  -- quarter, fiscal_year

-- Sales and marketing indexes
CREATE INDEX idx_table8_ref1 ON table8(ref1);            -- company_id
CREATE INDEX idx_table8_field2 ON table8(field2);        -- sales_stage
CREATE INDEX idx_table8_field8 ON table8(field8);        -- sales_rep_id
CREATE INDEX idx_table9_field2 ON table9(field2);        -- campaign_type
CREATE INDEX idx_table9_field4_field5 ON table9(field4, field5);  -- dates
CREATE INDEX idx_table10_ref1 ON table10(ref1);          -- company_id

-- Usage and engagement indexes
CREATE INDEX idx_table11_ref1_field1 ON table11(ref1, field1);  -- company_id, metric_date
CREATE INDEX idx_table11_ref3 ON table11(ref3);          -- product_id
CREATE INDEX idx_table12_ref1 ON table12(ref1);          -- company_id
CREATE INDEX idx_table12_field2 ON table12(field2);      -- churn_risk 