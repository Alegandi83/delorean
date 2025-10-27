# DeLorean - Multi-Platform Data Lakehouse on Databricks

**DeLorean** è una soluzione Terraform che implementa due piattaforme dati Databricks completamente separate su Azure, rappresentanti due aziende distinte con condivisione dati sicura tramite **Delta Sharing**.

---

## 🏢 Architettura Overview

### Due Piattaforme Indipendenti

| Piattaforma | Azienda | Settore | Regione Azure | Workspace |
|-------------|---------|---------|---------------|-----------|
| **EmmettBrown** | Retail Company | Retail & E-commerce | West Europe | `datanostrum` (producer)<br>`fungodata` (consumer) |
| **CableMaster** | Manufacturing Company | Manufacturing & Industrial IoT | North Europe | `producer` (producer)<br>`consumer` (consumer) |

### Componenti per Piattaforma

Ogni piattaforma dispone di:

- ✅ **Unity Catalog Metastore** dedicato
- ✅ **2 Workspace Databricks**:
  - Producer: data ingestion e data asset storage
  - Consumer: data products e analytics
- ✅ **Azure Storage (ADLS Gen2)** per dati e metastore
- ✅ **Azure Key Vault** per secrets management
- ✅ **Azure Data Factory** per orchestrazione
- ✅ **VNet isolata** con subnets private/public
- ✅ **Network Security Groups** per sicurezza
- ✅ **Gruppi e Service Principals** configurati
- ✅ **Budget policies** per governance

---

## 🔄 Delta Sharing: Data Collaboration Sicura

**CableMaster** condivide dati di Operational Technologies (OT) con **EmmettBrown** attraverso Delta Sharing.

### Dati Condivisi (CableMaster → EmmettBrown)

| Share Name | Schema | Descrizione |
|------------|--------|-------------|
| `plc_programmable_logic_ontrollers` | `das_operational_technologies` | Dati PLC |
| `scada_supervisory_control_and_data_acquisition` | `das_operational_technologies` | Dati SCADA |
| `dcs_distribuited_control_systems` | `das_operational_technologies` | Dati DCS |
| `hmi_human_machine_interfaces` | `das_operational_technologies` | Dati HMI |

**Tipo di condivisione**: Cross-metastore, autenticazione Databricks, history sharing abilitato

---

## 📊 Data Assets

### EmmettBrown (Retail)

#### Workspace: datanostrum (Producer)
**20+ Domain Data Assets** organizzati in cataloghi:

- **Customer & Sales**: Consumer Engagement, Customer Service, Sales & Merchandising, Revenue Management
- **Operations**: Store Operations, Delivery & Returns, Logistics & Distribution
- **Supply Chain**: Supply Chain, Purchasing & Replenishment, Manufacturing & Procurement
- **Finance & Planning**: Finance, Planning, Operations
- **Marketing**: Marketing & Digital Advertising
- **Product**: Product Development, Quality
- **HR**: Human Resources
- **Channels**: Multi-channel data
- **Domains**: Business domains
- **Open Data**: External data sources

#### Workspace: fungodata (Consumer)
**10+ Data Products** per business units:

- Brand & Product Management
- Customer Service
- Digital & Retail
- Legal & Compliance
- Manufacturing & Procurement
- Marketing & Advertising
- Quality
- Sales & Finance
- Supply Chain & Logistics
- Talent & Human Resources

**Features speciali**:
- Databricks Apps
- SQL Warehouses
- Compute clusters
- Lakebase databases
- Jobs orchestrati
- Repository GitHub integrati

### CableMaster (Manufacturing)

#### Workspace: producer (Producer)
**Data Assets**:
- **Information Technologies**: sistemi IT aziendali
- **Operational Technologies**: 
  - PLC (Programmable Logic Controllers)
  - SCADA (Supervisory Control and Data Acquisition)
  - DCS (Distributed Control Systems)
  - HMI (Human Machine Interfaces)
- **Azure SQL Database**: source data system
- **Delta Sharing**: configurazione recipient e shares

#### Workspace: consumer (Consumer)
**Data Products**: consumo dati per analytics e business intelligence

---

## 🗄️ Source Systems

### Azure SQL Database
- **Server**: Managed SQL Server su Azure
- **Location**: North Europe
- **Usage**: Source system per CableMaster
- **Admin**: Configurabile via terraform.tfvars
- **Connessione**: Native connection da Databricks workspace

---

## 🔐 Security & Governance

### Identity & Access Management

**EmmettBrown** - 10 gruppi specializzati:
- `admins` - Amministratori piattaforma
- `quality`, `service`, `marketing`, `supplychain`, `sales`, `digital`, `manufacturing`, `legal`, `brand`, `talent`

**CableMaster** - 2 gruppi:
- `admins` - Amministratori
- `users` - Utenti standard

### Network Security
- VNet injection per workspace Databricks
- Private subnets: `10.178.0.0/20`
- Public subnets: `10.178.16.0/20`
- Network Security Groups con regole restrittive
- Service endpoints per Azure Storage

### Data Governance
- Unity Catalog metastore per lineage e audit
- External locations per storage sicuro
- Storage credentials con managed identities
- Budget policies per cost control
- Workspace-level assignments

---

## 🚀 Deployment

### Prerequisiti

**Azure**:
- Subscription con ruolo **Owner**
- Tenant ID
- Subscription ID

**Databricks**:
- Account con ruolo **Account Admin**
- Marketplace Admin (opzionale)
- Billing Admin (opzionale)
- Account ID

**Tools**:
- Terraform >= 1.0
- Azure CLI
- Git

### Configurazione

1. **Clona repository**:
```bash
git clone <repository-url>
cd delorean/azure/solutions/adb-multi-platform
```

2. **Configura credenziali** in `terraform.tfvars`:
```hcl
tenant_id       = "your-tenant-id"
subscription_id = "your-subscription-id"
account_id      = "your-databricks-account-id"

deploy_id  = "your-deployment-id"
deploy_prj = "your-project-name"
deploy_ver = "001"

# Credenziali SQL
sql_admin_usr = "your-sql-admin"
sql_admin_psw = "your-secure-password"

# GitHub (opzionale)
github_usr = "your-github-username"
github_tkn = "your-github-token"

# Metastore admins
metastore_admins = ["admin@company.com"]
```

3. **Configura gruppi e utenti** in `terraform.tfvars`:
```hcl
eb_account_groups = [{
  name                = "admins"
  permissions         = ["ADMIN"]
  users               = ["user@company.com"]
  service_principals  = ["admin"]
}]
```

### Deploy

```bash
# Inizializza Terraform
terraform init

# Pianifica deployment
terraform plan

# Applica configurazione
terraform apply

# Output: workspace URLs, metastore IDs, storage URLs
```

### Tempo Stimato
- **Full deployment**: ~45-60 minuti
- **Componenti Azure**: ~15-20 minuti
- **Metastore + Workspace**: ~15-20 minuti per piattaforma
- **Assets & Configurations**: ~10-15 minuti

---

## 📦 Moduli Terraform

### Core Modules

| Modulo | Path | Descrizione |
|--------|------|-------------|
| `adb-platform` | `modules/adb-platform` | Crea piattaforma completa (metastore + 2 workspace) |
| `adb-uc-metastore` | `modules/adb-uc-metastore` | Unity Catalog metastore setup |
| `adb-lakehouse` | `modules/adb-lakehouse` | Workspace con VNet injection |
| `az-resources` | `modules/az-resources` | Azure resources (SQL, Key Vault, Data Factory) |
| `uc-idf-assignment` | `modules/uc-idf-assignment` | Identity & group assignments |

### Solution Modules

| Modulo | Path | Descrizione |
|--------|------|-------------|
| `adb-multi-platform` | `solutions/adb-multi-platform` | **Main deployment** - orchestrata 2 piattaforme |
| `adb-platform-emmettbrown-assets` | `solutions/adb-platform-emmettbrown-assets` | Assets retail (catalogs, schemas, jobs) |
| `adb-platform-cablemaster-assets` | `solutions/adb-platform-cablemaster-assets` | Assets manufacturing + Delta Sharing |

---

## 🔧 Gestione Post-Deploy

### Verifica Deployment

```bash
# Lista workspace creati
databricks workspace list --profile <profile>

# Verifica metastore
databricks unity-catalog metastores list --profile <profile>

# Test connettività storage
databricks fs ls dbfs:/ --profile <workspace-profile>
```

### Accesso Workspace

**EmmettBrown**:
- Producer (datanostrum): `https://<workspace-url>`
- Consumer (fungodata): `https://<workspace-url>`

**CableMaster**:
- Producer: `https://<workspace-url>`
- Consumer: `https://<workspace-url>`

### Delta Sharing Setup

1. **CableMaster Producer**: Shares già configurati automaticamente
2. **EmmettBrown Consumer**: Configura recipient per consumare shares:
```sql
CREATE CATALOG IF NOT EXISTS cablemaster_shared
  USING SHARE cablemaster.<share_name>;
```

---

## 📈 Monitoring & Operations

### Costi
- Budget policies applicate automaticamente
- Cost tracking per workspace e metastore
- Azure Cost Management per resource groups

### Logs & Audit
- Unity Catalog audit logs
- Azure Monitor per networking e storage
- Databricks system tables per usage

### Backup & DR
- Metastore in Azure Storage (geo-redundant opzionale)
- Terraform state per infrastructure recovery
- Delta Lake time travel per dati

---

## 🧹 Cleanup

Per eliminare l'intera infrastruttura:

```bash
# ATTENZIONE: Operazione irreversibile!
terraform destroy

# Opzionale: elimina manualmente metastore storage
az storage account delete --name <storage-account> --resource-group <rg>
```

**Nota**: Alcuni metastore possono richiedere eliminazione manuale da Databricks Account Console.

---

## 📚 Risorse

### Documentazione
- [Databricks Unity Catalog](https://docs.databricks.com/data-governance/unity-catalog/index.html)
- [Delta Sharing](https://docs.databricks.com/data-sharing/index.html)
- [Azure Databricks](https://learn.microsoft.com/azure/databricks/)
- [Terraform Databricks Provider](https://registry.terraform.io/providers/databricks/databricks/latest/docs)

### Diagram
- Architecture diagram: `architecture-diagram.html`
- Interactive tree: `interactive-tree.html`

---

## 🤝 Contributi

**Maintainer**: Alessandro Gandini (alessandro.gandini@databricks.com)  
**Project**: Test deployment (ag83-test-001)  
**Version**: 001

---

## 📝 Note

- **Naming Convention**: `<deploy_id>-<deploy_env>-<component>-<deploy_ver>`
- **Regions**: West Europe (EmmettBrown), North Europe (CableMaster)
- **Tags**: Tutte le risorse sono taggate con Owner e Domain
- **State**: Terraform state può essere configurato per remote backend Azure Storage

### Limitazioni Conosciute
- Cross-region Delta Sharing richiede network connectivity
- Budget policies limitate a workspace-level
- GitHub integration richiede personal access token

---

**🎯 Status**: Production-ready  
**📅 Last Update**: October 2025  
**🏷️ Version**: 1.0.0
