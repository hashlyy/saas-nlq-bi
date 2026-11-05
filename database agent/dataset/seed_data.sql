USE saas_bi_db;

-- =====================================
-- TABLE1 DATA (Companies/Organizations)
-- =====================================

INSERT INTO table1 (id, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12) VALUES
('comp-001', 'TechCorp Solutions', 'technology', 'large', 50000000.00, 'www.techcorp.com', 'USA', 'California', 'San Francisco', 2015, 'active', 'direct_sales', 'rep-001'),
('comp-002', 'DataDriven Analytics', 'consulting', 'medium', 8500000.00, 'www.datadriven.com', 'USA', 'New York', 'New York City', 2018, 'active', 'content_marketing', 'rep-002'),
('comp-003', 'StartupFlow Inc', 'fintech', 'startup', 1200000.00, 'www.startupflow.io', 'USA', 'California', 'Los Angeles', 2021, 'trial', 'organic', 'rep-001'),
('comp-004', 'Global Manufacturing Co', 'manufacturing', 'enterprise', 250000000.00, 'www.globalmfg.com', 'USA', 'Texas', 'Houston', 2005, 'active', 'partner', 'rep-003'),
('comp-005', 'HealthTech Innovations', 'healthcare', 'medium', 15000000.00, 'www.healthtech.com', 'USA', 'Massachusetts', 'Boston', 2017, 'active', 'paid_ads', 'rep-002'),
('comp-006', 'RetailMax Systems', 'retail', 'large', 75000000.00, 'www.retailmax.com', 'USA', 'Illinois', 'Chicago', 2012, 'active', 'referral', 'rep-004'),
('comp-007', 'EduLearn Platform', 'education', 'small', 2500000.00, 'www.edulearn.org', 'USA', 'California', 'Palo Alto', 2019, 'active', 'organic', 'rep-001'),
('comp-008', 'FinanceFlow Corp', 'financial_services', 'large', 95000000.00, 'www.financeflow.com', 'USA', 'New York', 'Manhattan', 2010, 'active', 'direct_sales', 'rep-005'),
('comp-009', 'CloudFirst Solutions', 'technology', 'medium', 12000000.00, 'www.cloudfirst.tech', 'USA', 'Washington', 'Seattle', 2016, 'active', 'content_marketing', 'rep-003'),
('comp-010', 'AgriTech Innovations', 'agriculture', 'small', 3200000.00, 'www.agritech.farm', 'USA', 'Iowa', 'Des Moines', 2020, 'churned', 'paid_ads', 'rep-002'),
('comp-011', 'MedDevice Corp', 'healthcare', 'enterprise', 180000000.00, 'www.meddevice.com', 'USA', 'California', 'San Diego', 2008, 'active', 'direct_sales', 'rep-006'),
('comp-012', 'SportsTech Analytics', 'sports', 'startup', 800000.00, 'www.sportstech.com', 'USA', 'Colorado', 'Denver', 2022, 'trial', 'referral', 'rep-001'),
('comp-013', 'LegalFlow Systems', 'legal', 'medium', 6800000.00, 'www.legalflow.com', 'USA', 'Washington DC', 'Washington', 2014, 'active', 'partner', 'rep-004'),
('comp-014', 'RealEstate Plus', 'real_estate', 'large', 45000000.00, 'www.realestateplus.com', 'USA', 'Florida', 'Miami', 2011, 'active', 'organic', 'rep-005'),
('comp-015', 'AutoTech Solutions', 'automotive', 'large', 85000000.00, 'www.autotech.com', 'USA', 'Michigan', 'Detroit', 2009, 'active', 'direct_sales', 'rep-006'),
('comp-016', 'GreenEnergy Solutions', 'energy', 'medium', 18000000.00, 'www.greenenergy.com', 'USA', 'California', 'Sacramento', 2020, 'active', 'organic', 'rep-002'),
('comp-017', 'LogiFlow Systems', 'logistics', 'large', 65000000.00, 'www.logiflow.com', 'USA', 'Georgia', 'Atlanta', 2013, 'active', 'partner', 'rep-003'),
('comp-018', 'AITech Innovations', 'technology', 'startup', 2100000.00, 'www.aitech.io', 'USA', 'California', 'Mountain View', 2023, 'trial', 'direct_sales', 'rep-001'),
('comp-019', 'BioMed Research Corp', 'biotechnology', 'enterprise', 320000000.00, 'www.biomed.com', 'USA', 'Massachusetts', 'Cambridge', 2006, 'active', 'referral', 'rep-006'),
('comp-020', 'UrbanTech Solutions', 'construction', 'medium', 22000000.00, 'www.urbantech.com', 'USA', 'Texas', 'Dallas', 2016, 'active', 'paid_ads', 'rep-004'),
('comp-021', 'FoodFlow Networks', 'food_service', 'small', 4500000.00, 'www.foodflow.com', 'USA', 'Oregon', 'Portland', 2019, 'active', 'content_marketing', 'rep-002'),
('comp-022', 'TransitTech Corp', 'transportation', 'large', 89000000.00, 'www.transittech.com', 'USA', 'New York', 'Buffalo', 2011, 'active', 'direct_sales', 'rep-005'),
('comp-023', 'SecureNet Systems', 'cybersecurity', 'medium', 16500000.00, 'www.securenet.com', 'USA', 'Virginia', 'Arlington', 2018, 'active', 'partner', 'rep-003'),
('comp-024', 'MarketPlace Dynamics', 'e_commerce', 'startup', 950000.00, 'www.marketplace.io', 'USA', 'Colorado', 'Boulder', 2022, 'suspended', 'organic', 'rep-001'),
('comp-025', 'InsurTech Partners', 'insurance', 'large', 125000000.00, 'www.insurtech.com', 'USA', 'Connecticut', 'Hartford', 2008, 'active', 'referral', 'rep-006');

-- =====================================
-- TABLE2 DATA (Users)
-- =====================================

INSERT INTO table2 (id, ref1, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11) VALUES
('user-001', 'comp-001', 'John', 'Smith', 'john.smith@techcorp.com', 'CTO', 'Engineering', TRUE, FALSE, '555-0101', 'America/Los_Angeles', '2024-01-15 14:30:00', 'active'),
('user-002', 'comp-001', 'Sarah', 'Johnson', 'sarah.johnson@techcorp.com', 'CFO', 'Finance', FALSE, TRUE, '555-0102', 'America/Los_Angeles', '2024-01-14 09:15:00', 'active'),
('user-003', 'comp-002', 'Michael', 'Brown', 'michael.brown@datadriven.com', 'CEO', 'Executive', TRUE, TRUE, '555-0201', 'America/New_York', '2024-01-15 16:45:00', 'active'),
('user-004', 'comp-003', 'Emily', 'Davis', 'emily.davis@startupflow.io', 'Founder', 'Executive', TRUE, TRUE, '555-0301', 'America/Los_Angeles', '2024-01-13 11:20:00', 'active'),
('user-005', 'comp-004', 'Robert', 'Wilson', 'robert.wilson@globalmfg.com', 'VP Operations', 'Operations', TRUE, FALSE, '555-0401', 'America/Chicago', '2024-01-15 13:10:00', 'active'),
('user-006', 'comp-005', 'Lisa', 'Garcia', 'lisa.garcia@healthtech.com', 'Product Manager', 'Product', TRUE, FALSE, '555-0501', 'America/New_York', '2024-01-15 12:30:00', 'active'),
('user-007', 'comp-006', 'David', 'Martinez', 'david.martinez@retailmax.com', 'CIO', 'IT', TRUE, FALSE, '555-0601', 'America/Chicago', '2024-01-14 15:45:00', 'active'),
('user-008', 'comp-007', 'Jennifer', 'Anderson', 'jennifer.anderson@edulearn.org', 'Head of Technology', 'Engineering', TRUE, TRUE, '555-0701', 'America/Los_Angeles', '2024-01-15 10:15:00', 'active'),
('user-009', 'comp-008', 'James', 'Taylor', 'james.taylor@financeflow.com', 'Managing Director', 'Executive', TRUE, FALSE, '555-0801', 'America/New_York', '2024-01-15 17:20:00', 'active'),
('user-010', 'comp-009', 'Maria', 'Rodriguez', 'maria.rodriguez@cloudfirst.tech', 'DevOps Lead', 'Engineering', TRUE, FALSE, '555-0901', 'America/Los_Angeles', '2024-01-15 14:05:00', 'active'),
('user-011', 'comp-010', 'Carlos', 'Lopez', 'carlos.lopez@agritech.farm', 'CEO', 'Executive', TRUE, TRUE, '555-1001', 'America/Chicago', '2023-05-10 08:20:00', 'inactive'),
('user-012', 'comp-011', 'Amanda', 'Chen', 'amanda.chen@meddevice.com', 'VP Engineering', 'Engineering', TRUE, FALSE, '555-1101', 'America/Los_Angeles', '2024-01-15 11:45:00', 'active'),
('user-013', 'comp-012', 'Kevin', 'Thompson', 'kevin.thompson@sportstech.com', 'Founder', 'Executive', TRUE, TRUE, '555-1201', 'America/Denver', '2024-01-12 16:30:00', 'active'),
('user-014', 'comp-013', 'Rachel', 'White', 'rachel.white@legalflow.com', 'CTO', 'Engineering', TRUE, FALSE, '555-1301', 'America/New_York', '2024-01-14 13:15:00', 'active'),
('user-015', 'comp-014', 'Daniel', 'Moore', 'daniel.moore@realestateplus.com', 'VP Sales', 'Sales', TRUE, FALSE, '555-1401', 'America/New_York', '2024-01-15 09:30:00', 'active'),
('user-016', 'comp-015', 'Jessica', 'Davis', 'jessica.davis@autotech.com', 'Head of Product', 'Product', TRUE, FALSE, '555-1501', 'America/Detroit', '2024-01-15 14:20:00', 'active'),
('user-017', 'comp-016', 'Brian', 'Wilson', 'brian.wilson@greenenergy.com', 'CTO', 'Engineering', TRUE, FALSE, '555-1601', 'America/Los_Angeles', '2024-01-14 12:10:00', 'active'),
('user-018', 'comp-017', 'Michelle', 'Lee', 'michelle.lee@logiflow.com', 'VP Operations', 'Operations', TRUE, TRUE, '555-1701', 'America/New_York', '2024-01-15 15:40:00', 'active'),
('user-019', 'comp-018', 'Andrew', 'Kim', 'andrew.kim@aitech.io', 'CEO', 'Executive', TRUE, TRUE, '555-1801', 'America/Los_Angeles', '2024-01-13 10:25:00', 'active'),
('user-020', 'comp-019', 'Nicole', 'Brown', 'nicole.brown@biomed.com', 'Chief Science Officer', 'Research', TRUE, FALSE, '555-1901', 'America/New_York', '2024-01-15 16:55:00', 'active'),
('user-021', 'comp-020', 'Steven', 'Johnson', 'steven.johnson@urbantech.com', 'VP Engineering', 'Engineering', TRUE, FALSE, '555-2001', 'America/Chicago', '2024-01-14 11:35:00', 'active'),
('user-022', 'comp-021', 'Laura', 'Garcia', 'laura.garcia@foodflow.com', 'Founder', 'Executive', TRUE, TRUE, '555-2101', 'America/Los_Angeles', '2024-01-15 08:45:00', 'active'),
('user-023', 'comp-022', 'Mark', 'Rodriguez', 'mark.rodriguez@transittech.com', 'CIO', 'IT', TRUE, FALSE, '555-2201', 'America/New_York', '2024-01-15 13:50:00', 'active'),
('user-024', 'comp-023', 'Catherine', 'Miller', 'catherine.miller@securenet.com', 'CISO', 'Security', TRUE, FALSE, '555-2301', 'America/New_York', '2024-01-14 17:15:00', 'active'),
('user-025', 'comp-024', 'Patrick', 'Anderson', 'patrick.anderson@marketplace.io', 'CTO', 'Engineering', TRUE, TRUE, '555-2401', 'America/Denver', '2023-12-20 14:20:00', 'pending');

-- =====================================
-- TABLE3 DATA (Products)
-- =====================================

INSERT INTO table3 (id, field1, field2, field3, field4, field5) VALUES
('prod-001', 'DataFlow Analytics Pro', 'analytics', 'Advanced data analytics and visualization platform for enterprise customers', TRUE, '2022-03-15'),
('prod-002', 'AutoSync Integration Hub', 'integration', 'Seamless data integration and workflow automation tools', TRUE, '2021-11-20'),
('prod-003', 'TeamCollab Workspace', 'collaboration', 'Real-time collaboration and project management suite', TRUE, '2020-08-10'),
('prod-004', 'SecureShield Enterprise', 'security', 'Comprehensive cybersecurity and compliance management platform', TRUE, '2023-01-05'),
('prod-005', 'WorkFlow Automation Engine', 'automation', 'Intelligent process automation and workflow optimization', TRUE, '2022-09-30'),
('prod-006', 'CloudSync Pro', 'integration', 'Cloud-native data synchronization and backup solutions', TRUE, '2021-07-12'),
('prod-007', 'MetricsTracker Elite', 'analytics', 'Real-time performance monitoring and KPI dashboard system', TRUE, '2022-11-08'),
('prod-008', 'CollabSpace Advanced', 'collaboration', 'Enhanced team workspace with AI-powered productivity tools', TRUE, '2023-02-20'),
('prod-009', 'ThreatGuard Pro', 'security', 'Next-generation threat detection and incident response platform', TRUE, '2023-05-14'),
('prod-010', 'ProcessFlow Smart', 'automation', 'AI-driven business process automation and optimization suite', TRUE, '2022-12-03'),
('prod-011', 'DataLake Manager', 'analytics', 'Enterprise data lake management and analytics platform', TRUE, '2021-09-25'),
('prod-012', 'API Gateway Plus', 'integration', 'Scalable API management and integration orchestration platform', TRUE, '2022-04-18'),
('prod-013', 'TeamSync Hub', 'collaboration', 'Cross-functional team coordination and communication platform', TRUE, '2020-12-07'),
('prod-014', 'CyberShield Advanced', 'security', 'Advanced persistent threat protection and forensics suite', TRUE, '2023-03-22'),
('prod-015', 'AutoOps Engine', 'automation', 'DevOps automation and continuous deployment orchestration', TRUE, '2022-08-16'),
('prod-016', 'InsightFlow Pro', 'analytics', 'Predictive analytics and machine learning insights platform', TRUE, '2023-01-30'),
('prod-017', 'ConnectBridge Enterprise', 'integration', 'Enterprise application integration and message routing', TRUE, '2021-10-14'),
('prod-018', 'WorkHub Digital', 'collaboration', 'Digital workplace and employee engagement platform', TRUE, '2022-06-29'),
('prod-019', 'SecureVault Pro', 'security', 'Data encryption and secure storage management system', TRUE, '2023-04-11'),
('prod-020', 'SmartFlow Optimizer', 'automation', 'Intelligent workflow optimization and resource allocation', TRUE, '2022-10-05');

-- =====================================
-- TABLE4 DATA (Pricing Plans)
-- =====================================

INSERT INTO table4 (id, field1, field2, field3, field4, field5, field6, field7, field8) VALUES
('plan-001', 'Starter Monthly', 'basic', 'monthly', 99.00, 5, 50, '{"dashboards": 10, "reports": 50, "api_calls": 10000}', TRUE),
('plan-002', 'Professional Monthly', 'professional', 'monthly', 299.00, 25, 250, '{"dashboards": 50, "reports": 500, "api_calls": 100000}', TRUE),
('plan-003', 'Premium Monthly', 'premium', 'monthly', 599.00, 100, 1000, '{"dashboards": 200, "reports": 2000, "api_calls": 500000}', TRUE),
('plan-004', 'Enterprise Monthly', 'enterprise', 'monthly', 1299.00, 500, 5000, '{"dashboards": "unlimited", "reports": "unlimited", "api_calls": 2000000}', TRUE),
('plan-005', 'Professional Annual', 'professional', 'annual', 2990.00, 25, 250, '{"dashboards": 50, "reports": 500, "api_calls": 100000}', TRUE),
('plan-006', 'Premium Annual', 'premium', 'annual', 5990.00, 100, 1000, '{"dashboards": 200, "reports": 2000, "api_calls": 500000}', TRUE),
('plan-007', 'Enterprise Annual', 'enterprise', 'annual', 12990.00, 500, 5000, '{"dashboards": "unlimited", "reports": "unlimited", "api_calls": 2000000}', TRUE),
('plan-008', 'Starter Annual', 'basic', 'annual', 990.00, 5, 50, '{"dashboards": 10, "reports": 50, "api_calls": 10000}', TRUE),
('plan-009', 'Free Trial', 'free', 'monthly', 0.00, 2, 10, '{"dashboards": 3, "reports": 10, "api_calls": 1000}', TRUE),
('plan-010', 'Small Business Monthly', 'basic', 'monthly', 149.00, 10, 100, '{"dashboards": 15, "reports": 100, "api_calls": 25000}', TRUE),
('plan-011', 'Small Business Annual', 'basic', 'annual', 1490.00, 10, 100, '{"dashboards": 15, "reports": 100, "api_calls": 25000}', TRUE),
('plan-012', 'Mid-Market Monthly', 'professional', 'monthly', 449.00, 50, 500, '{"dashboards": 75, "reports": 750, "api_calls": 250000}', TRUE),
('plan-013', 'Mid-Market Annual', 'professional', 'annual', 4490.00, 50, 500, '{"dashboards": 75, "reports": 750, "api_calls": 250000}', TRUE),
('plan-014', 'Premium Plus Monthly', 'premium', 'monthly', 899.00, 200, 2000, '{"dashboards": 300, "reports": 3000, "api_calls": 750000}', TRUE),
('plan-015', 'Premium Plus Annual', 'premium', 'annual', 8990.00, 200, 2000, '{"dashboards": 300, "reports": 3000, "api_calls": 750000}', TRUE),
('plan-016', 'Enterprise Plus Monthly', 'enterprise', 'monthly', 1999.00, 1000, 10000, '{"dashboards": "unlimited", "reports": "unlimited", "api_calls": 5000000}', TRUE),
('plan-017', 'Enterprise Plus Annual', 'enterprise', 'annual', 19990.00, 1000, 10000, '{"dashboards": "unlimited", "reports": "unlimited", "api_calls": 5000000}', TRUE),
('plan-018', 'Developer Monthly', 'basic', 'monthly', 49.00, 3, 25, '{"dashboards": 5, "reports": 25, "api_calls": 5000}', TRUE),
('plan-019', 'Developer Annual', 'basic', 'annual', 490.00, 3, 25, '{"dashboards": 5, "reports": 25, "api_calls": 5000}', TRUE),
('plan-020', 'Team Quarterly', 'professional', 'quarterly', 799.00, 25, 250, '{"dashboards": 50, "reports": 500, "api_calls": 100000}', TRUE);

-- =====================================
-- TABLE5 DATA (Product-Plan Relationships)
-- =====================================

INSERT INTO table5 (ref1, ref2, field1, field2) VALUES
('prod-001', 'plan-002', '{"analytics": "standard", "visualizations": "basic"}', '{"monthly_queries": 1000}'),
('prod-001', 'plan-003', '{"analytics": "advanced", "visualizations": "premium"}', '{"monthly_queries": 10000}'),
('prod-001', 'plan-004', '{"analytics": "enterprise", "visualizations": "unlimited"}', '{"monthly_queries": "unlimited"}'),
('prod-002', 'plan-001', '{"integrations": 5, "workflows": 10}', '{"monthly_syncs": 1000}'),
('prod-002', 'plan-002', '{"integrations": 25, "workflows": 50}', '{"monthly_syncs": 10000}'),
('prod-003', 'plan-001', '{"projects": 5, "team_members": 5}', '{"monthly_messages": 1000}'),
('prod-003', 'plan-002', '{"projects": 25, "team_members": 25}', '{"monthly_messages": 10000}'),
('prod-004', 'plan-003', '{"security_scans": "weekly", "compliance_reports": "monthly"}', '{"monitored_endpoints": 100}'),
('prod-004', 'plan-004', '{"security_scans": "daily", "compliance_reports": "weekly"}', '{"monitored_endpoints": "unlimited"}'),
('prod-005', 'plan-002', '{"automation_flows": 20, "triggers": 50}', '{"monthly_executions": 5000}'),
('prod-005', 'plan-003', '{"automation_flows": 100, "triggers": 250}', '{"monthly_executions": 25000}'),
('prod-006', 'plan-001', '{"cloud_storage": "50GB", "backup_frequency": "weekly"}', '{"monthly_transfers": 100}'),
('prod-006', 'plan-002', '{"cloud_storage": "250GB", "backup_frequency": "daily"}', '{"monthly_transfers": 1000}'),
('prod-007', 'plan-002', '{"metrics": "standard", "alerts": 10}', '{"data_retention_days": 90}'),
('prod-007', 'plan-003', '{"metrics": "advanced", "alerts": 50}', '{"data_retention_days": 365}'),
('prod-008', 'plan-003', '{"ai_features": "enabled", "workspace_templates": 20}', '{"monthly_ai_requests": 1000}'),
('prod-008', 'plan-004', '{"ai_features": "premium", "workspace_templates": "unlimited"}', '{"monthly_ai_requests": "unlimited"}'),
('prod-009', 'plan-003', '{"threat_detection": "real_time", "incident_response": "automated"}', '{"monitored_assets": 500}'),
('prod-009', 'plan-004', '{"threat_detection": "ai_powered", "incident_response": "orchestrated"}', '{"monitored_assets": "unlimited"}'),
('prod-010', 'plan-002', '{"smart_processes": 15, "ml_models": 3}', '{"monthly_optimizations": 100}'),
('prod-010', 'plan-003', '{"smart_processes": 50, "ml_models": 10}', '{"monthly_optimizations": 500}'),
('prod-011', 'plan-003', '{"data_lakes": 3, "analytics_engines": 2}', '{"monthly_queries": 10000}'),
('prod-011', 'plan-004', '{"data_lakes": "unlimited", "analytics_engines": 5}', '{"monthly_queries": "unlimited"}'),
('prod-012', 'plan-002', '{"api_endpoints": 50, "rate_limit": "1000/hour"}', '{"monthly_requests": 100000}'),
('prod-012', 'plan-003', '{"api_endpoints": 200, "rate_limit": "5000/hour"}', '{"monthly_requests": 500000}');

-- =====================================
-- TABLE6 DATA (Subscriptions)
-- =====================================

INSERT INTO table6 (id, ref1, ref2, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10) VALUES
('sub-001', 'comp-001', 'plan-004', 'active', '2023-01-01', '2024-01-01', NULL, 'annual', 1299.00, 15588.00, 150, 142, TRUE),
('sub-002', 'comp-002', 'plan-003', 'active', '2023-03-15', '2024-03-15', NULL, 'annual', 599.00, 7188.00, 45, 38, TRUE),
('sub-003', 'comp-003', 'plan-001', 'trial', '2024-01-01', NULL, '2024-01-31', 'monthly', 0.00, 0.00, 5, 3, FALSE),
('sub-004', 'comp-004', 'plan-007', 'active', '2022-06-01', '2024-06-01', NULL, 'annual', 1299.00, 25980.00, 200, 185, TRUE),
('sub-005', 'comp-005', 'plan-002', 'active', '2023-09-01', '2024-09-01', NULL, 'monthly', 299.00, 3588.00, 20, 16, TRUE),
('sub-006', 'comp-006', 'plan-006', 'active', '2023-02-01', '2024-02-01', NULL, 'annual', 599.00, 11980.00, 80, 72, TRUE),
('sub-007', 'comp-007', 'plan-002', 'active', '2023-07-01', '2024-07-01', NULL, 'monthly', 299.00, 3588.00, 12, 9, TRUE),
('sub-008', 'comp-008', 'plan-004', 'active', '2022-11-01', '2024-11-01', NULL, 'annual', 1299.00, 25980.00, 250, 230, TRUE),
('sub-009', 'comp-009', 'plan-005', 'active', '2023-04-01', '2024-04-01', NULL, 'annual', 299.00, 2990.00, 25, 22, TRUE),
('sub-010', 'comp-010', 'plan-001', 'cancelled', '2023-01-01', '2023-06-01', NULL, 'monthly', 0.00, 0.00, 8, 0, FALSE),
('sub-011', 'comp-011', 'plan-007', 'active', '2023-01-01', '2024-01-01', NULL, 'annual', 1299.00, 25980.00, 300, 275, TRUE),
('sub-012', 'comp-012', 'plan-001', 'trial', '2024-01-10', NULL, '2024-02-10', 'monthly', 0.00, 0.00, 3, 2, FALSE),
('sub-013', 'comp-013', 'plan-003', 'active', '2023-05-01', '2024-05-01', NULL, 'monthly', 599.00, 7188.00, 35, 28, TRUE),
('sub-014', 'comp-014', 'plan-006', 'active', '2023-08-01', '2024-08-01', NULL, 'annual', 599.00, 11980.00, 90, 85, TRUE),
('sub-015', 'comp-015', 'plan-004', 'active', '2022-12-01', '2024-12-01', NULL, 'annual', 1299.00, 25980.00, 180, 165, TRUE),
('sub-016', 'comp-016', 'plan-002', 'active', '2023-10-01', '2024-10-01', NULL, 'monthly', 299.00, 3588.00, 18, 14, TRUE),
('sub-017', 'comp-017', 'plan-006', 'active', '2023-03-01', '2024-03-01', NULL, 'annual', 599.00, 11980.00, 65, 58, TRUE),
('sub-018', 'comp-018', 'plan-009', 'trial', '2024-01-15', NULL, '2024-02-15', 'monthly', 0.00, 0.00, 2, 1, FALSE),
('sub-019', 'comp-019', 'plan-007', 'active', '2022-08-01', '2024-08-01', NULL, 'annual', 1299.00, 25980.00, 320, 290, TRUE),
('sub-020', 'comp-020', 'plan-003', 'active', '2023-06-01', '2024-06-01', NULL, 'monthly', 599.00, 7188.00, 22, 18, TRUE),
('sub-021', 'comp-021', 'plan-001', 'active', '2023-11-01', '2024-11-01', NULL, 'monthly', 99.00, 1188.00, 4, 3, TRUE),
('sub-022', 'comp-022', 'plan-005', 'active', '2023-02-15', '2024-02-15', NULL, 'annual', 299.00, 2990.00, 89, 78, TRUE),
('sub-023', 'comp-023', 'plan-003', 'active', '2023-04-15', '2024-04-15', NULL, 'monthly', 599.00, 7188.00, 16, 14, TRUE),
('sub-024', 'comp-024', 'plan-001', 'suspended', '2023-08-01', '2023-12-01', NULL, 'monthly', 0.00, 0.00, 3, 0, FALSE),
('sub-025', 'comp-025', 'plan-007', 'active', '2022-10-01', '2024-10-01', NULL, 'annual', 1299.00, 25980.00, 125, 115, TRUE);

-- =====================================
-- TABLE7 DATA (Transactions)
-- =====================================

INSERT INTO table7 (id, ref1, ref2, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11) VALUES
-- Q1 2023 Transactions
('txn-001', 'sub-001', 'comp-001', 'subscription', 15588.00, 1247.04, 16835.04, 'USD', '2023-01-01', 'credit_card', 'completed', 'INV-2023-001', 'Q1', 2023),
('txn-002', 'sub-004', 'comp-004', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2023-01-15', 'bank_transfer', 'completed', 'INV-2023-002', 'Q1', 2023),
('txn-003', 'sub-006', 'comp-006', 'subscription', 5990.00, 479.20, 6469.20, 'USD', '2023-02-01', 'credit_card', 'completed', 'INV-2023-003', 'Q1', 2023),
('txn-004', 'sub-002', 'comp-002', 'subscription', 7188.00, 575.04, 7763.04, 'USD', '2023-03-15', 'invoice', 'completed', 'INV-2023-004', 'Q1', 2023),

-- Q2 2023 Transactions
('txn-005', 'sub-005', 'comp-005', 'subscription', 299.00, 23.92, 322.92, 'USD', '2023-04-01', 'credit_card', 'completed', 'INV-2023-005', 'Q2', 2023),
('txn-006', 'sub-009', 'comp-009', 'subscription', 2990.00, 239.20, 3229.20, 'USD', '2023-04-01', 'credit_card', 'completed', 'INV-2023-006', 'Q2', 2023),
('txn-007', 'sub-013', 'comp-013', 'subscription', 599.00, 47.92, 646.92, 'USD', '2023-05-01', 'paypal', 'completed', 'INV-2023-007', 'Q2', 2023),
('txn-008', 'sub-010', 'comp-010', 'subscription', 99.00, 7.92, 106.92, 'USD', '2023-05-01', 'credit_card', 'failed', 'INV-2023-008', 'Q2', 2023),

-- Q3 2023 Transactions  
('txn-009', 'sub-007', 'comp-007', 'subscription', 299.00, 23.92, 322.92, 'USD', '2023-07-01', 'credit_card', 'completed', 'INV-2023-009', 'Q3', 2023),
('txn-010', 'sub-014', 'comp-014', 'subscription', 5990.00, 479.20, 6469.20, 'USD', '2023-08-01', 'bank_transfer', 'completed', 'INV-2023-010', 'Q3', 2023),
('txn-011', 'sub-005', 'comp-005', 'subscription', 299.00, 23.92, 322.92, 'USD', '2023-09-01', 'credit_card', 'completed', 'INV-2023-011', 'Q3', 2023),

-- Q4 2023 Transactions
('txn-012', 'sub-008', 'comp-008', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2023-11-01', 'bank_transfer', 'completed', 'INV-2023-012', 'Q4', 2023),
('txn-013', 'sub-015', 'comp-015', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2023-12-01', 'credit_card', 'completed', 'INV-2023-013', 'Q4', 2023),
('txn-014', 'sub-011', 'comp-011', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2023-12-15', 'invoice', 'completed', 'INV-2023-014', 'Q4', 2023),

-- Additional 2023 Transactions
('txn-015', 'sub-016', 'comp-016', 'subscription', 299.00, 23.92, 322.92, 'USD', '2023-10-01', 'credit_card', 'completed', 'INV-2023-015', 'Q4', 2023),
('txn-016', 'sub-017', 'comp-017', 'subscription', 5990.00, 479.20, 6469.20, 'USD', '2023-03-01', 'bank_transfer', 'completed', 'INV-2023-016', 'Q1', 2023),
('txn-017', 'sub-020', 'comp-020', 'subscription', 599.00, 47.92, 646.92, 'USD', '2023-06-01', 'credit_card', 'completed', 'INV-2023-017', 'Q2', 2023),
('txn-018', 'sub-021', 'comp-021', 'subscription', 99.00, 7.92, 106.92, 'USD', '2023-11-01', 'paypal', 'completed', 'INV-2023-018', 'Q4', 2023),
('txn-019', 'sub-022', 'comp-022', 'subscription', 2990.00, 239.20, 3229.20, 'USD', '2023-02-15', 'invoice', 'completed', 'INV-2023-019', 'Q1', 2023),
('txn-020', 'sub-023', 'comp-023', 'subscription', 599.00, 47.92, 646.92, 'USD', '2023-04-15', 'credit_card', 'completed', 'INV-2023-020', 'Q2', 2023),

-- 2024 Transactions
('txn-021', 'sub-001', 'comp-001', 'subscription', 15588.00, 1247.04, 16835.04, 'USD', '2024-01-01', 'credit_card', 'completed', 'INV-2024-001', 'Q1', 2024),
('txn-022', 'sub-004', 'comp-004', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2024-01-15', 'bank_transfer', 'completed', 'INV-2024-002', 'Q1', 2024),
('txn-023', 'sub-025', 'comp-025', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2023-10-01', 'invoice', 'completed', 'INV-2023-021', 'Q4', 2023),
('txn-024', 'sub-019', 'comp-019', 'subscription', 12990.00, 1039.20, 14029.20, 'USD', '2023-08-01', 'credit_card', 'completed', 'INV-2023-022', 'Q3', 2023),
('txn-025', 'sub-016', 'comp-016', 'subscription', 299.00, 23.92, 322.92, 'USD', '2023-11-01', 'credit_card', 'completed', 'INV-2023-023', 'Q4', 2023);

-- =====================================
-- TABLE8 DATA (Sales Opportunities)
-- =====================================

INSERT INTO table8 (id, ref1, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10) VALUES
('opp-001', 'comp-003', 'StartupFlow Enterprise Upgrade', 'proposal', 'website', 15000.00, 75, '2024-02-15', NULL, 'rep-001', 'Alex Thompson', NULL),
('opp-002', 'comp-012', 'SportsTech Premium Plan', 'qualified', 'referral', 8000.00, 60, '2024-03-01', NULL, 'rep-001', 'Alex Thompson', NULL),
('opp-003', 'comp-016', 'NewTech Solutions Initial', 'lead', 'marketing_campaign', 25000.00, 25, '2024-04-01', NULL, 'rep-002', 'Sarah Chen', NULL),
('opp-004', 'comp-001', 'TechCorp Additional Licenses', 'negotiation', 'cold_outreach', 50000.00, 85, '2024-01-30', NULL, 'rep-001', 'Alex Thompson', NULL),
('opp-005', 'comp-017', 'MegaCorp Enterprise Deal', 'proposal', 'trade_show', 150000.00, 70, '2024-02-28', NULL, 'rep-003', 'Michael Rodriguez', NULL),
('opp-006', 'comp-010', 'AgriTech Win-Back Campaign', 'closed_lost', 'cold_outreach', 12000.00, 0, '2023-12-15', '2023-12-15', 'rep-002', 'Sarah Chen', 'Budget constraints'),
('opp-007', 'comp-005', 'HealthTech Expansion', 'closed_won', 'referral', 35000.00, 100, '2023-11-30', '2023-11-28', 'rep-002', 'Sarah Chen', NULL),
('opp-008', 'comp-018', 'GreenTech Startup', 'qualified', 'partner', 8500.00, 50, '2024-03-15', NULL, 'rep-004', 'Jessica Martinez', NULL),
('opp-009', 'comp-019', 'BioMed Platform Expansion', 'proposal', 'referral', 75000.00, 80, '2024-02-20', NULL, 'rep-006', 'Tom Wilson', NULL),
('opp-010', 'comp-020', 'UrbanTech Integration Suite', 'qualified', 'website', 22000.00, 65, '2024-03-10', NULL, 'rep-004', 'Jessica Martinez', NULL),
('opp-011', 'comp-021', 'FoodFlow Premium Upgrade', 'lead', 'organic', 12000.00, 40, '2024-04-05', NULL, 'rep-002', 'Sarah Chen', NULL),
('opp-012', 'comp-022', 'TransitTech Enterprise License', 'negotiation', 'direct_outreach', 95000.00, 90, '2024-01-25', NULL, 'rep-005', 'David Park', NULL),
('opp-013', 'comp-023', 'SecureNet Advanced Security', 'proposal', 'partner', 45000.00, 75, '2024-03-05', NULL, 'rep-003', 'Michael Rodriguez', NULL),
('opp-014', 'comp-024', 'MarketPlace Recovery Plan', 'lead', 'cold_outreach', 18000.00, 30, '2024-04-15', NULL, 'rep-001', 'Alex Thompson', NULL),
('opp-015', 'comp-025', 'InsurTech Analytics Expansion', 'closed_won', 'trade_show', 125000.00, 100, '2023-12-10', '2023-12-08', 'rep-006', 'Tom Wilson', NULL),
('opp-016', 'comp-002', 'DataDriven Premium Analytics', 'qualified', 'referral', 28000.00, 70, '2024-03-20', NULL, 'rep-002', 'Sarah Chen', NULL),
('opp-017', 'comp-006', 'RetailMax Integration Platform', 'proposal', 'marketing_campaign', 65000.00, 60, '2024-02-25', NULL, 'rep-004', 'Jessica Martinez', NULL),
('opp-018', 'comp-008', 'FinanceFlow Security Suite', 'negotiation', 'partner', 85000.00, 85, '2024-01-20', NULL, 'rep-005', 'David Park', NULL),
('opp-019', 'comp-014', 'RealEstate Analytics Plus', 'qualified', 'website', 38000.00, 55, '2024-03-25', NULL, 'rep-005', 'David Park', NULL),
('opp-020', 'comp-009', 'CloudFirst Automation Suite', 'lead', 'organic', 42000.00, 45, '2024-04-10', NULL, 'rep-003', 'Michael Rodriguez', NULL);

-- =====================================
-- TABLE9 DATA (Marketing Campaigns)
-- =====================================

INSERT INTO table9 (id, field1, field2, field3, field4, field5, field6, field7, field8, field9, field10, field11, field12, field13) VALUES
('camp-001', 'Q1 2024 Enterprise Outreach', 'email', 'email', '2024-01-01', '2024-03-31', 15000.00, 12500.00, 250000, 5800, 145, 89, 'Enterprise decision makers', 'active'),
('camp-002', 'Google Ads - Analytics Keywords', 'ppc', 'google_ads', '2023-10-01', '2024-01-31', 25000.00, 22000.00, 1200000, 24000, 480, 320, 'Data analysts and managers', 'completed'),
('camp-003', 'LinkedIn Thought Leadership', 'social_media', 'linkedin', '2023-11-01', '2024-02-29', 18000.00, 16500.00, 800000, 12000, 200, 150, 'Tech executives', 'active'),
('camp-004', 'SaaS Integration Webinar Series', 'webinar', 'webinar', '2024-01-15', '2024-04-15', 8000.00, 6200.00, 15000, 3200, 180, 125, 'IT professionals', 'active'),
('camp-005', 'Content Marketing - Analytics Blog', 'content', 'blog', '2023-09-01', '2024-03-31', 12000.00, 9800.00, 450000, 18000, 350, 280, 'Data professionals', 'active'),
('camp-006', 'Trade Show - Tech Conference 2023', 'trade_show', 'events', '2023-11-15', '2023-11-17', 35000.00, 33500.00, 25000, 1200, 85, 65, 'Enterprise tech buyers', 'completed'),
('camp-007', 'Facebook Ads - SMB Focus', 'ppc', 'facebook', '2023-12-01', '2024-02-29', 10000.00, 8900.00, 600000, 9500, 95, 78, 'Small business owners', 'active'),
('camp-008', 'Twitter Security Awareness', 'social_media', 'twitter', '2023-08-01', '2023-12-31', 7500.00, 6800.00, 350000, 4200, 120, 98, 'Security professionals', 'completed'),
('camp-009', 'Email Nurture - Healthcare', 'email', 'email', '2023-09-15', '2024-01-15', 5000.00, 4200.00, 180000, 3600, 85, 72, 'Healthcare executives', 'completed'),
('camp-010', 'SEO Content Strategy', 'seo', 'blog', '2023-07-01', '2024-06-30', 20000.00, 18500.00, 850000, 15200, 420, 385, 'Technical decision makers', 'active'),
('camp-011', 'Retargeting Campaign Q4', 'ppc', 'google_ads', '2023-10-15', '2023-12-31', 12000.00, 11200.00, 500000, 8500, 180, 145, 'Previous website visitors', 'completed'),
('camp-012', 'Partnership Webinar Series', 'webinar', 'webinar', '2023-06-01', '2023-09-30', 15000.00, 14200.00, 28000, 4800, 250, 215, 'Channel partners', 'completed'),
('camp-013', 'Manufacturing Industry Focus', 'content', 'blog', '2023-05-01', '2024-04-30', 18000.00, 16800.00, 420000, 12600, 320, 295, 'Manufacturing leaders', 'active'),
('camp-014', 'LinkedIn Video Series', 'social_media', 'linkedin', '2024-02-01', '2024-05-31', 22000.00, 18500.00, 950000, 18500, 380, 295, 'C-level executives', 'active'),
('camp-015', 'Automation Demo Campaign', 'email', 'email', '2023-11-01', '2024-02-29', 8500.00, 7200.00, 220000, 4800, 125, 105, 'Operations managers', 'active'),
('camp-016', 'Financial Services Outreach', 'ppc', 'linkedin', '2023-08-15', '2023-12-15', 25000.00, 23800.00, 680000, 14200, 285, 248, 'Financial executives', 'completed'),
('camp-017', 'Mobile App Promotion', 'social_media', 'facebook', '2023-09-01', '2024-01-31', 16000.00, 14500.00, 750000, 11800, 240, 195, 'Mobile users', 'completed'),
('camp-018', 'Enterprise Security Summit', 'trade_show', 'events', '2024-03-10', '2024-03-12', 45000.00, 42000.00, 35000, 1800, 125, 95, 'Security leaders', 'completed'),
('camp-019', 'Developer Community Outreach', 'content', 'blog', '2023-04-01', '2024-03-31', 14000.00, 12800.00, 580000, 16200, 450, 420, 'Software developers', 'active'),
('camp-020', 'Q2 2024 Product Launch', 'email', 'email', '2024-04-01', '2024-06-30', 30000.00, 12000.00, 150000, 2800, 65, 45, 'Existing customers', 'active');

-- =====================================
-- TABLE10 DATA (Campaign Attribution)
-- =====================================

INSERT INTO table10 (id, ref1, ref2, field1, field2, field3) VALUES
('attr-001', 'comp-003', 'camp-002', 'first_touch', '2024-01-01', 0.00),
('attr-002', 'comp-005', 'camp-003', 'multi_touch', '2023-09-01', 3588.00),
('attr-003', 'comp-012', 'camp-004', 'first_touch', '2024-01-10', 0.00),
('attr-004', 'comp-002', 'camp-005', 'last_touch', '2023-03-15', 7188.00),
('attr-005', 'comp-009', 'camp-006', 'first_touch', '2023-04-01', 2990.00),
('attr-006', 'comp-007', 'camp-001', 'multi_touch', '2023-07-01', 3588.00),
('attr-007', 'comp-013', 'camp-002', 'first_touch', '2023-05-01', 7188.00),
('attr-008', 'comp-014', 'camp-006', 'last_touch', '2023-08-01', 11980.00),
('attr-009', 'comp-016', 'camp-010', 'first_touch', '2023-10-01', 3588.00),
('attr-010', 'comp-017', 'camp-012', 'multi_touch', '2023-03-01', 11980.00),
('attr-011', 'comp-018', 'camp-019', 'first_touch', '2024-01-15', 0.00),
('attr-012', 'comp-019', 'camp-006', 'last_touch', '2022-08-01', 25980.00),
('attr-013', 'comp-020', 'camp-013', 'multi_touch', '2023-06-01', 7188.00),
('attr-014', 'comp-021', 'camp-017', 'first_touch', '2023-11-01', 1188.00),
('attr-015', 'comp-022', 'camp-016', 'last_touch', '2023-02-15', 2990.00),
('attr-016', 'comp-023', 'camp-008', 'multi_touch', '2023-04-15', 7188.00),
('attr-017', 'comp-024', 'camp-002', 'first_touch', '2023-08-01', 0.00),
('attr-018', 'comp-025', 'camp-015', 'last_touch', '2022-10-01', 25980.00),
('attr-019', 'comp-001', 'camp-014', 'multi_touch', '2023-01-01', 15588.00),
('attr-020', 'comp-004', 'camp-013', 'first_touch', '2022-06-01', 25980.00),
('attr-021', 'comp-006', 'camp-011', 'multi_touch', '2023-02-01', 11980.00),
('attr-022', 'comp-008', 'camp-016', 'last_touch', '2022-11-01', 25980.00),
('attr-023', 'comp-011', 'camp-018', 'first_touch', '2023-01-01', 25980.00),
('attr-024', 'comp-015', 'camp-020', 'multi_touch', '2022-12-01', 25980.00);

-- =====================================
-- TABLE11 DATA (Usage Metrics)
-- =====================================

INSERT INTO table11 (id, ref1, ref2, ref3, field1, field2, field3, field4, field5, field6, field7, field8) VALUES
-- January 2024 data
('usage-001', 'comp-001', 'user-001', 'prod-001', '2024-01-15', 142, 142, '{"dashboards": 45, "reports": 280, "exports": 15}', 85, 45000, 450.5, 125.8),
('usage-002', 'comp-002', 'user-003', 'prod-001', '2024-01-15', 35, 38, '{"dashboards": 12, "reports": 95, "exports": 8}', 62, 12000, 89.2, 34.5),
('usage-003', 'comp-004', 'user-005', 'prod-002', '2024-01-15', 180, 185, '{"workflows": 125, "integrations": 25, "syncs": 8500}', 45, 180000, 1200.8, 450.2),
('usage-004', 'comp-005', 'user-006', 'prod-003', '2024-01-15', 14, 16, '{"projects": 8, "messages": 1250, "files": 245}', 75, 8500, 25.4, 12.1),
('usage-005', 'comp-006', 'user-007', 'prod-001', '2024-01-14', 68, 72, '{"dashboards": 28, "reports": 180, "exports": 12}', 90, 28000, 235.6, 89.4),
('usage-006', 'comp-008', 'user-009', 'prod-004', '2024-01-15', 225, 230, '{"security_scans": 45, "alerts": 12, "reports": 8}', 35, 95000, 890.5, 245.8),
('usage-007', 'comp-011', 'user-012', 'prod-001', '2024-01-15', 260, 275, '{"dashboards": 85, "reports": 450, "exports": 35}', 95, 125000, 1250.8, 485.2),
('usage-008', 'comp-014', 'user-015', 'prod-002', '2024-01-15', 80, 85, '{"workflows": 45, "integrations": 15, "syncs": 5200}', 55, 48000, 425.6, 156.8),
('usage-009', 'comp-015', 'user-016', 'prod-004', '2024-01-15', 155, 165, '{"security_scans": 38, "alerts": 8, "reports": 15}', 42, 78000, 680.4, 198.5),
('usage-010', 'comp-016', 'user-017', 'prod-003', '2024-01-14', 12, 14, '{"projects": 6, "messages": 850, "files": 125}', 68, 6200, 18.5, 8.2),
('usage-011', 'comp-017', 'user-018', 'prod-002', '2024-01-15', 55, 58, '{"workflows": 35, "integrations": 18, "syncs": 4800}', 72, 35000, 285.4, 95.6),
('usage-012', 'comp-018', 'user-019', 'prod-005', '2024-01-13', 2, 1, '{"automation_flows": 3, "triggers": 8, "executions": 125}', 15, 850, 2.5, 1.1),
('usage-013', 'comp-019', 'user-020', 'prod-001', '2024-01-15', 285, 290, '{"dashboards": 95, "reports": 520, "exports": 45}', 98, 145000, 1485.6, 625.8),
('usage-014', 'comp-020', 'user-021', 'prod-003', '2024-01-14', 18, 18, '{"projects": 12, "messages": 1580, "files": 285}', 85, 12000, 45.8, 18.5),
('usage-015', 'comp-021', 'user-022', 'prod-006', '2024-01-15', 3, 3, '{"cloud_storage": "25GB", "backups": 8, "transfers": 45}', 45, 2800, 8.5, 3.2),
('usage-016', 'comp-022', 'user-023', 'prod-007', '2024-01-15', 78, 78, '{"metrics": 125, "alerts": 8, "reports": 25}', 68, 52000, 285.4, 125.8),
('usage-017', 'comp-023', 'user-024', 'prod-009', '2024-01-14', 14, 14, '{"threat_scans": 28, "incidents": 3, "reports": 12}', 58, 8500, 45.8, 18.5),
('usage-018', 'comp-024', 'user-025', 'prod-008', '2023-12-20', 0, 0, '{"ai_requests": 0, "templates": 0, "workspaces": 0}', 0, 0, 0.0, 0.0),
('usage-019', 'comp-025', 'user-020', 'prod-011', '2024-01-15', 115, 115, '{"data_lakes": 2, "queries": 2850, "analytics": 125}', 82, 85000, 625.8, 285.4),
('usage-020', 'comp-009', 'user-010', 'prod-010', '2024-01-15', 22, 22, '{"smart_processes": 12, "ml_models": 2, "optimizations": 85}', 75, 15000, 58.5, 25.4),
('usage-021', 'comp-007', 'user-008', 'prod-012', '2024-01-15', 9, 9, '{"api_endpoints": 18, "requests": 2500, "rate_limit": "500/hour"}', 52, 4500, 12.5, 5.8),
('usage-022', 'comp-013', 'user-014', 'prod-013', '2024-01-14', 28, 28, '{"team_sync": 85, "coordination": 45, "messages": 1250}', 68, 18500, 85.4, 45.2),
('usage-023', 'comp-012', 'user-013', 'prod-014', '2024-01-12', 2, 2, '{"cyber_shield": 5, "threats": 2, "forensics": 1}', 25, 1200, 2.5, 1.1),
('usage-024', 'comp-003', 'user-004', 'prod-015', '2024-01-13', 3, 3, '{"devops": 8, "deployments": 12, "automation": 25}', 35, 2500, 8.5, 3.8);

-- =====================================
-- TABLE12 DATA (Customer Health)
-- =====================================

INSERT INTO table12 (id, ref1, field1, field2, field3, field4, field5, field6, field7, field8, field9) VALUES
('health-001', 'comp-001', 92, 'low', '2024-01-15', 2, 75, 'Jennifer Wilson', 95, 'high', 'Excellent product adoption, interested in additional modules'),
('health-002', 'comp-002', 78, 'medium', '2024-01-14', 5, 45, 'Michael Brown', 80, 'medium', 'Good usage but some support issues, working on resolution'),
('health-003', 'comp-003', 45, 'high', '2024-01-10', 0, NULL, 'Jennifer Wilson', 25, 'none', 'Trial customer, limited engagement so far'),
('health-004', 'comp-004', 95, 'low', '2024-01-15', 1, 85, 'Sarah Rodriguez', 98, 'high', 'Power user, excellent ROI, renewal discussions started'),
('health-005', 'comp-005', 82, 'low', '2024-01-15', 3, 65, 'Michael Brown', 85, 'medium', 'Strong adoption, minor feature requests'),
('health-006', 'comp-006', 88, 'low', '2024-01-14', 2, 70, 'Sarah Rodriguez', 90, 'medium', 'Consistent usage, exploring additional use cases'),
('health-007', 'comp-007', 71, 'medium', '2024-01-13', 4, 40, 'Jennifer Wilson', 70, 'low', 'Slower adoption, providing additional training'),
('health-008', 'comp-008', 94, 'low', '2024-01-15', 1, 80, 'David Chen', 96, 'high', 'Strategic customer, excellent partnership'),
('health-009', 'comp-009', 85, 'low', '2024-01-15', 2, 68, 'Michael Brown', 88, 'medium', 'Good product fit, regular usage patterns'),
('health-010', 'comp-010', 15, 'critical', '2023-05-15', 12, -20, NULL, 5, 'none', 'Churned customer, multiple unresolved issues'),
('health-011', 'comp-011', 96, 'low', '2024-01-15', 1, 88, 'David Chen', 98, 'high', 'Enterprise flagship customer, driving product roadmap'),
('health-012', 'comp-012', 35, 'high', '2024-01-12', 1, NULL, 'Jennifer Wilson', 30, 'none', 'New trial, limited initial engagement'),
('health-013', 'comp-013', 79, 'medium', '2024-01-14', 3, 52, 'Sarah Rodriguez', 75, 'low', 'Moderate usage, some feature adoption challenges'),
('health-014', 'comp-014', 91, 'low', '2024-01-15', 2, 78, 'Michael Brown', 93, 'high', 'Strong ROI demonstrated, expansion discussions active'),
('health-015', 'comp-015', 89, 'low', '2024-01-15', 1, 72, 'David Chen', 91, 'medium', 'Solid customer, consistent growth in usage'),
('health-016', 'comp-016', 73, 'medium', '2024-01-14', 6, 35, 'Jennifer Wilson', 68, 'low', 'New customer, still onboarding, minor issues'),
('health-017', 'comp-017', 86, 'low', '2024-01-15', 3, 72, 'Sarah Rodriguez', 88, 'medium', 'Good adoption rate, expanding use cases'),
('health-018', 'comp-018', 25, 'high', '2024-01-13', 2, NULL, 'Jennifer Wilson', 20, 'none', 'Early trial stage, limited product exploration'),
('health-019', 'comp-019', 97, 'low', '2024-01-15', 1, 92, 'David Chen', 99, 'high', 'Top-tier customer, driving innovation roadmap'),
('health-020', 'comp-020', 80, 'medium', '2024-01-14', 4, 58, 'Michael Brown', 78, 'medium', 'Steady usage, some integration challenges'),
('health-021', 'comp-021', 68, 'medium', '2024-01-15', 7, 28, 'Jennifer Wilson', 65, 'low', 'Small customer, basic usage patterns'),
('health-022', 'comp-022', 92, 'low', '2024-01-15', 2, 82, 'Sarah Rodriguez', 94, 'high', 'Strong customer success, looking at expansion'),
('health-023', 'comp-023', 76, 'medium', '2024-01-14', 5, 48, 'Michael Brown', 72, 'low', 'Security-focused customer, good engagement'),
('health-024', 'comp-024', 8, 'critical', '2023-12-20', 15, -35, NULL, 2, 'none', 'Suspended account, payment and usage issues'),
('health-025', 'comp-025', 93, 'low', '2024-01-15', 2, 85, 'David Chen', 96, 'high', 'Long-term enterprise customer, excellent relationship'); 



