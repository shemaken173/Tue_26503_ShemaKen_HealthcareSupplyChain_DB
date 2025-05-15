# Healthcare Supply Chain Management System

![Oracle](https://img.shields.io/badge/Oracle-SQL-blue.svg)
![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Database-orange.svg)
![GitHub](https://img.shields.io/badge/GitHub-Repository-green.svg)

## 📋 Project Overview

This project, developed for the **Database Development with PL/SQL (INSY 8311)** course at the Adventist University of Central Africa (AUCA), implements an Oracle PL/SQL database to streamline hospital supply chain management. It addresses inefficiencies in inventory tracking, procurement, and decision-making for a large metropolitan hospital network.

- **Student**: ShemaKen
- **Student ID**: 26503
- **Group**: Tuesday
- **Academic Year**: 2024-2025
- **Lecturer**: Eric Maniraguha (`eric.maniraguha@auca.ac.rw`)
- **Submission Date**: April 20, 2025

### Objectives
- Automate medical supply procurement processes.
- Enable real-time inventory tracking.
- Optimize supply chain efficiency and reduce costs by 30%.
- Provide data-driven insights for hospital administrators.

### Benefits
- Reduced inventory carrying costs.
- Improved supply availability and procurement accuracy.
- Enhanced reporting and analytics for decision-making.

## 📂 Repository Structure

The repository is organized as follows:

| Directory       | Description                                      |
|-----------------|--------------------------------------------------|
| `/docs`         | Documentation for project phases (e.g., UML, ERD) |
| `/sql`          | SQL scripts for database creation and operations |
| `/screenshots`  | OEM screenshots and query outputs                |
| `/presentation` | Final PowerPoint presentation                    |

### Key Files
- **Docs**:
  - `Problem_Statement.md`: Phase I problem definition.
  - `Business_Process_Model_UML.md`: Phase II UML activity diagram.
  - `Logical_Model_Design.md`: Phase III ER model and normalization.
- **SQL Scripts**:
  - `Database_Creation.sql`: Phase IV pluggable database setup.
  - `Table_Implementation.sql`: Phase V table creation and data insertion.
  - `Database_Interactions.sql`: Phase VI PL/SQL package with procedures.
  - `Advanced_Programming.sql`: Phase VII triggers and auditing.
- **Presentation**:
  - `Tue_26503_ShemaKen_HealthcareSupplyChain_DB.pptx`: Final presentation.

## 🛠️ Setup and Execution

### Prerequisites
- Oracle Database (version compatible with PL/SQL)
- Oracle SQL Developer or similar IDE
- Oracle Enterprise Manager (OEM) for monitoring
- Lucidchart for UML diagrams
- GitHub account for version control

### Installation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/<your-username>/HealthcareSupplyChain_DB.git
   ```

2. **Database Setup**:
   - Run `sql/Database_Creation.sql` to create the pluggable database:
     ```sql
     CREATE PLUGGABLE DATABASE Tue_26503_ShemaKen_HealthcareSupplyChain_DB
     ADMIN USER shemaken IDENTIFIED BY shemaken
     ROLES = (DBA);
     ```
   - Connect to the database: `CONNECT shemaken/shemaken@Tue_26503_ShemaKen_HealthcareSupplyChain_DB`.

3. **Table Implementation**:
   - Execute `sql/Table_Implementation.sql` to create tables and insert sample data:
     ```sql
     CREATE TABLE MedicalSupplies (
         SupplyID NUMBER PRIMARY KEY,
         SupplyName VARCHAR2(100) NOT NULL,
         Category VARCHAR2(50),
         UnitPrice NUMBER CHECK (UnitPrice >= 0)
     );
     INSERT INTO MedicalSupplies VALUES (1, 'Syringes', 'Equipment', 2.5);
     ```

4. **Database Interactions**:
   - Deploy `sql/Database_Interactions.sql` to create the `SupplyChain_Pkg` package:
     ```sql
     CREATE OR REPLACE PACKAGE SupplyChain_Pkg AS
         PROCEDURE FetchInventoryStatus(p_SupplyID IN NUMBER, p_Quantity OUT NUMBER, p_LastUpdated OUT DATE);
         PROCEDURE CreatePurchaseOrder(p_VendorID IN NUMBER, p_DepartmentID IN NUMBER, p_SupplyID IN NUMBER, p_Quantity IN NUMBER, p_OrderID OUT NUMBER);
     END SupplyChain_Pkg;
     ```

5. **Auditing**:
   - Run `sql/Advanced_Programming.sql` to implement triggers and auditing:
     ```sql
     CREATE OR REPLACE TRIGGER SupplyChain_Restrictions
     FOR INSERT OR UPDATE OR DELETE ON MedicalSupplies
     COMPOUND TRIGGER
         BEFORE STATEMENT IS
         BEGIN
             IF TO_CHAR(SYSDATE, 'DY') IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
                 RAISE_APPLICATION_ERROR(-20004, 'Table manipulations not allowed on weekdays.');
             END IF;
         END BEFORE STATEMENT;
     END SupplyChain_Restrictions;
     ```

### Testing
- Execute the test block in `Database_Interactions.sql` to verify procedures:
  ```sql
  DECLARE
      v_Quantity NUMBER;
      v_LastUpdated DATE;
  BEGIN
      SupplyChain_Pkg.FetchInventoryStatus(1, v_Quantity, v_LastUpdated);
      DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_Quantity || ', Last Updated: ' || v_LastUpdated);
  END;
  ```

## 📸 Screenshots
- **OEM Dashboard**: Displays database status and performance metrics.
- **Query Outputs**:
  - Inventory levels for `Syringes` and `Paracetamol`.
  - Total spending per department.
  - Usage history with timestamps.

## 📊 Final Presentation
- **File**: `presentation/Tue_26503_ShemaKen_HealthcareSupplyChain_DB.pptx`
- **Content**:
  - Introduction and problem definition
  - Methodology (UML modeling, ER design, PL/SQL programming)
  - Results (30% cost reduction, improved efficiency)
  - Screenshots of OEM and query outputs
  - Conclusion and future recommendations
- **Submission**: Shared via Google Drive with `eric.maniraguha@auca.ac.rw`.

## 📝 Notes
- **File Naming**: All files follow the convention `Tue_26503_ShemaKen_HealthcareSupplyChain_DB_[Phase]`.
- **Independent Work**: This project is an individual effort, with no plagiarism.
- **Tools Used**:
  - Lucidchart for UML activity diagrams
  - Oracle SQL Developer for database management
  - GitHub for version control
- **AI Usage**: AI tools used for research and paraphrasing only; all content is original.
- **Deadline Compliance**: All phases submitted by respective deadlines.

## 📬 Contact
For queries, contact ShemaKen (ID: 26503) or the lecturer at `eric.maniraguha@auca.ac.rw`.

> *Whatever you do, work at it with all your heart, as working for the Lord, not for human masters.* — Colossians 3:23 (NIV)