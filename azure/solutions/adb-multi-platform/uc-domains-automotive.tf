# Discover domain "automotive" and its subdomains, one per schema of the
# Automotive ECM v2 industry data model (databricks-industry-solutions/lakehouse-industry-data-models).
# The empty "workflow" schema of the model has no tables and is not mapped to a subdomain.

locals {
  automotive_domain = {
    name        = "automotive"
    subtitle    = "Enterprise data domain for vehicle OEMs: from R&D and production to sales, aftersales and connected mobility."
    description = <<-EOT
      Automotive is the enterprise data domain of a vehicle manufacturer (OEM) producing cars, trucks, SUVs and commercial vehicles with ICE, hybrid and electric powertrains, connected mobility services and autonomous driving technology.
      It is modeled on the Automotive Expanded Coverage Model (ECM v2) of the Databricks industry data models: 19 subdomains and 578 governed tables, linked by more than 2,400 foreign keys and exposed through 247 metric views.
      Operations division: vehicle, engineering, manufacturing, supply, procurement, quality, logistics, inventory and asset, covering the value chain from product design to finished vehicle delivery.
      Business division: product, customer, sales, dealer, aftersales, billing and mobility, covering the commercial lifecycle from configuration and pricing to retail, warranty and connected services.
      Corporate division: finance, workforce and compliance, covering financial control, human capital and global regulatory obligations (CAFE, EPA/CARB, NHTSA, WLTP, UNECE).
      Use this domain to discover certified data products, understand ownership and navigate the end-to-end automotive value chain.
    EOT
    icon        = { name = "SPEEDOMETER", color = "#0B3D91" }
  }

  automotive_subdomains = {
    vehicle = {
      subtitle    = "Single source of truth for VIN-level vehicle identity, configurations, trims and powertrains."
      description = <<-EOT
        Single source of truth for all vehicle master data across the enterprise. Owns VIN-level vehicle identity, model configurations, trim levels and the model year lifecycle from SOP (Start of Production) to EOP (End of Production), together with powertrain variants (ICE, HEV, PHEV, EV), platform architectures and ADAS feature sets.
        Sub-areas: physical instances, product catalog and regulatory certification (23 tables).
        Key data products: vin_registry, model, vehicle_model_year_program, vehicle_trim_level, powertrain_variant, platform, vehicle_adas_feature, configuration, build_spec, homologation, ecu_catalog.
        Division: operations. It is the authoritative reference for every downstream domain that needs to identify or describe a vehicle instance.
      EOT
      icon        = { name = "FLAG_CHECKERED", color = "#C62828" }
    }
    product = {
      subtitle    = "Commercial product catalog and program portfolio: nameplates, options, BOM structures, MSRP and SKUs."
      description = <<-EOT
        Single source of truth for the commercial vehicle product catalog and program portfolio. Owns nameplate definitions, model year program plans, option and package configurations, BOM (Bill of Materials) product structures, MSRP price books, feature-to-market availability matrices and SKU (Stock Keeping Unit) structures.
        Sub-areas: configuration management, catalog publishing and pricing administration (16 tables).
        Key data products: bom_header, product_bom_line, product_segment, catalog_publication, package_availability, catalog_version, sku, msrp_price_book.
        Division: business. Distinct from engineering, which owns technical design data, and from vehicle, which owns VIN-level production instances.
      EOT
      icon        = { name = "PACKAGE", color = "#6A1B9A" }
    }
    engineering = {
      subtitle    = "Product design and development lifecycle: CAD/CAE, PLM, engineering BOM, validation and change control."
      description = <<-EOT
        Manages the full product design and development lifecycle, including CAD (Computer-Aided Design), CAE (Computer-Aided Engineering), PLM (Product Lifecycle Management) and digital twin modeling. Owns the engineering BOM, design specifications, CFD (Computational Fluid Dynamics), FEA (Finite Element Analysis), NVH (Noise Vibration Harshness) testing, prototype validation and engineering change orders (ECO/ECN).
        Sub-areas: program management, product definition, change control and validation testing (40 tables).
        Key data products: vehicle_program, bom, engineering_bom_line, part_master, design_specification, cad_model, change, cae_simulation, prototype_build, validation_test, engineering_test_result, digital_twin.
        Division: operations. Integrates with Siemens Teamcenter, CATIA and ENOVIA for collaborative engineering.
      EOT
      icon        = { name = "RULER", color = "#1565C0" }
    }
    manufacturing = {
      subtitle    = "Plant production and assembly: MES execution, work orders, JIS sequencing, WIP and build traceability."
      description = <<-EOT
        Core production and assembly operations across all manufacturing plants. Manages shop floor execution through the MES (Manufacturing Execution System), work order scheduling, production line sequencing (JIS - Just-in-Sequence), WIP (Work in Progress) tracking and build traceability, across stamping, body shop, paint and final assembly.
        Sub-areas: facility operations, build execution, material planning and contractual relationships (39 tables).
        Key data products: plant, production_line, work_center, production_order, build_sequence, vehicle_build, build_stage, shop_floor_event, wip_inventory, production_schedule, shift, downtime_event.
        Division: operations. Integrates with AGV (Automated Guided Vehicle), PLC (Programmable Logic Controller) and SCADA systems for real-time production control.
      EOT
      icon        = { name = "CRANE_TOWER", color = "#EF6C00" }
    }
    supply = {
      subtitle    = "Inbound supply chain from tier-1 and tier-2 suppliers to plant receiving: RFQ, PPAP, JIT/JIS and CKD/SKD kits."
      description = <<-EOT
        Governs the inbound supply chain from tier-1 and tier-2 suppliers through to plant receiving. Owns supplier master data, RFQ (Request for Quotation) events, PPAP (Production Part Approval Process) records, JIT/JIS delivery schedules, inbound logistics, supplier performance metrics (PPM defect rates, OTD - On-Time Delivery) and CKD/SKD kit management for global assembly operations.
        Sub-areas: supplier management and procurement execution (30 tables).
        Key data products: supply_supplier, supply_supplier_plant, inbound_part, sourcing_nomination, rfq, rfq_response, supply_purchase_order, supply_delivery_schedule, supply_ppap_submission, supplier_part_approval.
        Division: operations. Integrates with PTC Windchill for part and supplier collaboration.
      EOT
      icon        = { name = "INTERSECT_THREE", color = "#00838F" }
    }
    procurement = {
      subtitle    = "Strategic sourcing and purchasing of direct and indirect materials: contracts, POs, receipts and spend."
      description = <<-EOT
        Strategic sourcing and procurement operations for direct materials (production parts) and indirect materials (MRO, tooling, services). Manages supplier contracts, SOR (Statement of Requirements), purchase requisitions, purchase orders, goods receipts, invoice verification and spend analytics, including global sourcing strategies, supplier development programs and CapEx procurement workflows.
        Sub-areas: supplier management, order processing and analytics governance (34 tables).
        Key data products: procurement_supplier, sourcing_event, supplier_quote, purchase_requisition, procurement_purchase_order, procurement_po_line, supplier_contract, scheduling_agreement_line, procurement_goods_receipt, supplier_invoice.
        Division: operations. It is the commercial counterpart of the supply subdomain, which runs the physical inbound flow.
      EOT
      icon        = { name = "BASKET", color = "#2E7D32" }
    }
    quality = {
      subtitle    = "End-to-end quality assurance: APQP, FMEA, SPC, inspections, defects, PDI and corrective actions."
      description = <<-EOT
        End-to-end quality assurance and control across design, manufacturing and field operations. Owns APQP plans, FMEA (Failure Mode and Effects Analysis), SPC (Statistical Process Control) data, inspection plans, quality audits, defect tracking and PPM rates, together with incoming material inspection, in-process quality gates, final vehicle PDI (Pre-Delivery Inspection), NCAP/WLTP test results and corrective action processes (8D, 5-Why).
        Sub-areas: planning standards, inspection and measurement, defect resolution, supplier audits, testing and compliance (32 tables).
        Key data products: apqp_plan, fmea, control_plan, inspection_plan, inspection_lot, inspection_result, defect_record, spc_chart, spc_data_point, quality_corrective_action, audit.
        Division: operations. Supports IATF 16949 compliance.
      EOT
      icon        = { name = "SHIELD_CHECKERED", color = "#AD1457" }
    }
    logistics = {
      subtitle    = "Outbound finished vehicle distribution: shipments, carriers, compounds, ports and in-transit inventory."
      description = <<-EOT
        Outbound logistics and distribution of finished vehicles, including transportation, storage yards, compound operations, carrier management and delivery scheduling. Manages vehicle shipments from plant to dealer, rail, truck and vessel logistics, port processing, last-mile delivery and CKD/SKD kit logistics, tracking in-transit inventory, delivery lead times, transportation costs, carrier performance and OTD metrics.
        Sub-areas: outbound distribution, carrier management, yard operations and international trade (26 tables).
        Key data products: shipment, shipment_leg, vehicle_transport_order, logistics_delivery_schedule, carrier, carrier_performance, vehicle_compound, compound_movement, in_transit_inventory, port_processing, vessel_voyage.
        Division: operations. Includes export and import operations for global distribution.
      EOT
      icon        = { name = "TRUCK_TRAILER", color = "#5D4037" }
    }
    inventory = {
      subtitle    = "Stock of materials, components, WIP, finished vehicles and service parts across plants, warehouses and dealers."
      description = <<-EOT
        Inventory management for raw materials, components, WIP (Work in Progress), finished goods and service parts across plants, warehouses and dealer networks. Manages stock levels, inventory movements, cycle counting, MRP (Material Requirements Planning) execution and SKU master data, tracking inventory accuracy, turnover, obsolescence and safety stock levels.
        Sub-areas: material master and warehouse operations (27 tables).
        Key data products: sku_master, storage_location, stock_balance, goods_movement, stock_transfer_order, mrp_requirement, cycle_count, batch_record, serialized_unit, finished_vehicle_stock, service_parts_stock.
        Division: operations. Includes warehouse management, batch traceability and serialized inventory for high-value components such as ECUs and batteries.
      EOT
      icon        = { name = "CUBE_TRANSPARENT", color = "#455A64" }
    }
    asset = {
      subtitle    = "Manufacturing equipment and tooling: asset registry, preventive and predictive maintenance, downtime and calibration."
      description = <<-EOT
        Manufacturing asset and equipment management, including production machinery, tooling, dies, fixtures and plant infrastructure. Manages the asset registry, preventive and predictive maintenance schedules, equipment downtime tracking and calibration management, tracking asset utilization, MTBF (Mean Time Between Failures), MTTR (Mean Time To Repair) and maintenance costs.
        Sub-areas: equipment management, maintenance operations, quality assurance, tooling resources and financial tracking (28 tables).
        Key data products: equipment_registry, functional_location, tooling_registry, maintenance_plan, maintenance_order, maintenance_notification, equipment_downtime, calibration_record, equipment_counter, spare_parts_catalog.
        Division: operations. Includes spare parts inventory for maintenance and CMMS integration for enterprise asset management.
      EOT
      icon        = { name = "FADERS", color = "#546E7A" }
    }
    customer = {
      subtitle    = "Single source of truth for retail, fleet, corporate and government customers: identity, ownership, loyalty and consent."
      description = <<-EOT
        Single source of truth for all customer identities, including retail buyers, fleet operators, corporate accounts and government entities. Manages customer profiles, contact information, preferences, vehicle ownership history, loyalty program membership, household linkages and customer segmentation, tracking NPS (Net Promoter Score), CLTV (Customer Lifetime Value) and customer journey touchpoints.
        Sub-areas: identity management, ownership tracking, engagement programs, segmentation analytics, privacy preferences and experience feedback (29 tables).
        Key data products: party, individual, organization_account, household, contact_point, vehicle_ownership, loyalty_membership, loyalty_transaction, customer_segment, segment_membership, preference, customer_consent_record.
        Division: business. Supports both B2C and B2B customer types with unified identity management.
      EOT
      icon        = { name = "USERS_THREE", color = "#0277BD" }
    }
    sales = {
      subtitle    = "Sales operations from lead to order: opportunities, quotes, incentives, fleet contracts and territories."
      description = <<-EOT
        Sales operations including lead management, opportunity tracking, quote generation, order capture and sales performance analytics. Manages MSRP (Manufacturer Suggested Retail Price), incentive programs, fleet sales and commercial vehicle contracts, tracking the sales pipeline, conversion rates and regional sales performance.
        Sub-areas: revenue pursuit, incentive programs, commercial fleet, territory management, financial and insurance products, digital commerce (39 tables).
        Key data products: opportunity, quote, quote_line, vehicle_order, order_line, sales_incentive_program, sales_incentive_claim, fleet_contract, fleet_contract_line, msrp_schedule, sales_territory, rep.
        Division: business. Integrates with dealer networks for unified sales execution across direct and indirect channels.
      EOT
      icon        = { name = "CHART_PIE_SLICE", color = "#F9A825" }
    }
    dealer = {
      subtitle    = "Dealer network management: franchises, territories, vehicle allocation, dealer inventory and service performance."
      description = <<-EOT
        Dealer network management, including dealer profiles, franchise agreements, territory assignments and dealer performance scorecards. Manages dealer inventory allocation, vehicle allocation rules, dealer incentive programs and DMS (Dealer Management System) integration, tracking dealer sales performance, customer satisfaction scores, service capacity and parts inventory at dealer locations.
        Sub-areas: network management, inventory operations, sales performance and service execution (29 tables).
        Key data products: dealership, franchise_agreement, dealer_territory, dealer_certification, vehicle_allocation, allocation_rule, dealer_inventory, parts_inventory, retail_sale, dealer_service_appointment, dealer_repair_order.
        Division: business. Supports both OEM-owned and independent franchise dealer models and integrates with CDK Global DMS.
      EOT
      icon        = { name = "CITY", color = "#283593" }
    }
    aftersales = {
      subtitle    = "Post-sale support: warranty, service campaigns and recalls, repair orders, TSBs and parts distribution."
      description = <<-EOT
        Post-sale customer support, including warranty management, service campaigns, recall execution and parts distribution. Manages service appointments, repair orders, TSB (Technical Service Bulletin) distribution, DTC (Diagnostic Trouble Code) analysis and labor time standards, tracking warranty claims, parts consumption, service revenue and customer retention.
        Sub-areas: product catalog, service operations, warranty management, campaigns and recalls, parts distribution (37 tables).
        Key data products: aftersales_repair_order, repair_order_line, aftersales_warranty_claim, warranty_policy, vehicle_warranty, service_campaign, feature_content, option_constraint, product_lifecycle_event.
        Division: business. Includes field service operations and the authorized service center network, and integrates with CDK Global DMS and OBD (On-Board Diagnostics) systems.
      EOT
      icon        = { name = "CALL_BELL", color = "#00695C" }
    }
    billing = {
      subtitle    = "Single source of truth for revenue transactions and receivables: invoices, payments, credit notes and disputes."
      description = <<-EOT
        Single source of truth for all revenue transactions and receivables. Owns dealer invoices, retail customer billing, fleet account statements, parts and service charges, payment records, credit notes and dispute management, handling invoicing, payment receipt, credit memos and financial settlement for vehicle sales and services.
        Sub-areas: revenue collection, statement processing, pricing terms and incentive management (25 tables).
        Key data products: invoice, billing_invoice_line, payment, payment_allocation, credit_memo, debit_memo, account, receivable, dispute, dealer_statement, fleet_statement, billing_price_condition.
        Division: business. Supports both MSRP-based and negotiated pricing models.
      EOT
      icon        = { name = "RECEIPT", color = "#4E342E" }
    }
    mobility = {
      subtitle    = "Connected vehicle and mobility services: telematics, V2X, OTA updates, remote diagnostics and charging."
      description = <<-EOT
        Connected vehicle services and mobility solutions, including telematics, V2X (Vehicle-to-Everything communication), OTA (Over-the-Air update) management, fleet connectivity and autonomous driving feature entitlements. Manages connected vehicle data streams, remote diagnostics, predictive maintenance alerts, TPMS (Tire Pressure Monitoring System) telemetry and usage-based services.
        Sub-areas: vehicle connectivity, software updates, fleet operations and charging infrastructure (28 tables).
        Key data products: connected_vehicle, telematics_device, service_subscription, telemetry_event, trip, mobility_dtc_event, remote_diagnostic_session, predictive_maintenance_alert, ota_campaign, mobility_ota_deployment, tpms_reading, geofence.
        Division: business. Owns the connected vehicle device registry and mobility service agreements, and integrates with Geotab, Bosch IoT and cloud-based mobility platforms.
      EOT
      icon        = { name = "CLOUD", color = "#0097A7" }
    }
    finance = {
      subtitle    = "Core financial management: general ledger, payables and receivables, cost accounting, CapEx and profitability."
      description = <<-EOT
        Core financial management, including general ledger, accounts payable, accounts receivable, cost center accounting and financial reporting. Manages CapEx (Capital Expenditure) tracking, budget planning, fiscal year close, EBITDA reporting, profitability analysis by vehicle line, plant and region, and intercompany settlements, tracking manufacturing cost (material, labor, overhead), warranty reserves and inventory valuation.
        Sub-areas: general ledger, payables and receivables, asset management and profitability analysis (34 tables).
        Key data products: gl_account, cost_center, profit_center, company_code, fiscal_period, journal_entry, journal_entry_line, ap_invoice, ap_payment, ar_invoice, ar_payment, capex_request.
        Division: corporate. Supports SOX compliance and IFRS/GAAP reporting.
      EOT
      icon        = { name = "COINS", color = "#1B5E20" }
    }
    workforce = {
      subtitle    = "Human capital management: employees, organization, shifts, payroll, compensation, talent and safety."
      description = <<-EOT
        Human capital management, including employee records, organizational structure, talent acquisition, performance management, compensation, benefits and payroll. Manages workforce planning, shift scheduling for manufacturing operations, union labor agreements, skills inventory and IATF-required competency records, tracking headcount, turnover, training completion and safety certifications.
        Sub-areas: employee administration, compensation operations, talent development, labor relations and safety (31 tables).
        Key data products: employee, position, org_unit, job_classification, employment_contract, shift_schedule, time_entry, absence_record, payroll_result, compensation_plan, benefit_enrollment, talent_requisition.
        Division: corporate. Covers end-to-end HR processes for plant and office populations.
      EOT
      icon        = { name = "ADDRESS_BOOK", color = "#7B1FA2" }
    }
    compliance = {
      subtitle    = "Global regulatory compliance and homologation: emissions, safety, type approvals, recalls and audit trails."
      description = <<-EOT
        Regulatory compliance and homologation management across all global markets. Owns CAFE (Corporate Average Fuel Economy) reporting, EPA/CARB emissions certifications, NHTSA FMVSS homologation records, WLTP/Euro NCAP test submissions, UNECE type approvals and recall regulatory filings, managing compliance testing, certification documentation, regulatory submissions and audit trails.
        Sub-areas: regulatory certification, testing and validation, audit governance and environmental monitoring (31 tables).
        Key data products: homologation_record, compliance_emissions_certification, cafe_compliance_record, regulatory_submission, recall_campaign, test_event, compliance_test_result, regulatory_requirement, jurisdiction, obligation, ncap_submission, ota_compliance_approval.
        Division: corporate. Ensures adherence to environmental, safety and trade regulations across jurisdictions.
      EOT
      icon        = { name = "GAVEL", color = "#37474F" }
    }
  }
}

# Governed tags, domain and subdomains are account-level objects managed through a
# workspace-level provider: the module is called once, through the emmettbrown producer workspace.
module "uc-domains-automotive" {
  depends_on = [module.adb-platform-emmettbrown]
  source     = "../../modules/uc-domains"
  deploy_id  = var.deploy_id
  deploy_ver = var.deploy_ver
  domain     = local.automotive_domain
  subdomains = local.automotive_subdomains
  providers = {
    databricks = databricks.emmettbrown-producer-workspace
  }
}
