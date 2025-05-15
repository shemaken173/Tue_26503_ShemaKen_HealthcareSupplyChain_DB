# Logical Data Model for Healthcare Supply Chain Management

## Entity-Relationship (ER) Model

### Entities and Attributes
1. **Vendors**
   - VendorID (PK, NUMBER): Unique identifier for each vendor.
   - VendorName (VARCHAR2(100)): Name of the vendor.
   - ContactInfo (VARCHAR2(200)): Contact details (email, phone).
   - Address (VARCHAR2(200)): Vendor address.
2. **MedicalSupplies**
   - SupplyID (PK, NUMBER): Unique identifier for each supply item.
   - SupplyName (VARCHAR2(100)): Name of the medical supply.
   - Category (VARCHAR2(50)): Category (e.g., Medicine, Equipment).
   - UnitPrice (NUMBER): Price per unit.
3. **Inventory**
   - InventoryID (PK, NUMBER): Unique identifier for inventory record.
   - SupplyID (FK, NUMBER): References MedicalSupplies(SupplyID).
   - QuantityInStock (NUMBER): Current stock level.
   - LastUpdated (DATE): Date of last inventory update.
4. **Departments**
   - DepartmentID (PK, NUMBER): Unique identifier for each department.
   - DepartmentName (VARCHAR2(100)): Name of the department.
   - ManagerID (NUMBER): ID of the department manager.
5. **PurchaseOrders**
   - OrderID (PK, NUMBER): Unique identifier for each purchase order.
   - VendorID (FK, NUMBER): References Vendors(VendorID).
   - DepartmentID (FK, NUMBER): References Departments(DepartmentID).
   - OrderDate (DATE): Date the order was placed.
   - TotalAmount (NUMBER): Total cost of the order.
6. **OrderDetails**
   - OrderDetailID (PK, NUMBER): Unique identifier for order details.
   - OrderID (FK, NUMBER): References PurchaseOrders(OrderID).
   - SupplyID (FK, NUMBER): References MedicalSupplies(SupplyID).
   - QuantityOrdered (NUMBER): Quantity of items ordered.
   - UnitPrice (NUMBER): Price per unit at the time of order.
7. **UsageTracking**
   - UsageID (PK, NUMBER): Unique identifier for usage record.
   - SupplyID (FK, NUMBER): References MedicalSupplies(SupplyID).
   - DepartmentID (FK, NUMBER): References Departments(DepartmentID).
   - QuantityUsed (NUMBER): Quantity used by the department.
   - UsageDate (DATE): Date of usage.

### Relationships & Constraints
- **Vendors to PurchaseOrders**: One-to-Many (One vendor can have multiple purchase orders).
  - Constraint: VendorID in PurchaseOrders references Vendors(VendorID).
- **Departments to PurchaseOrders**: One-to-Many (One department can place multiple purchase orders).
  - Constraint: DepartmentID in PurchaseOrders references Departments(DepartmentID).
- **PurchaseOrders to OrderDetails**: One-to-Many (One purchase order can include multiple items).
  - Constraint: OrderID in OrderDetails references PurchaseOrders(OrderID).
- **MedicalSupplies to OrderDetails**: One-to-Many (One supply item can appear in multiple order details).
  - Constraint: SupplyID in OrderDetails references MedicalSupplies(SupplyID).
- **MedicalSupplies to Inventory**: One-to-One (Each supply item has one inventory record).
  - Constraint: SupplyID in Inventory references MedicalSupplies(SupplyID).
- **MedicalSupplies to UsageTracking**: One-to-Many (One supply item can be used by multiple departments).
  - Constraint: SupplyID in UsageTracking references MedicalSupplies(SupplyID).
- **Departments to UsageTracking**: One-to-Many (One department can use multiple supply items).
  - Constraint: DepartmentID in UsageTracking references Departments(DepartmentID).
- **Constraints**:
  - NOT NULL: VendorName, SupplyName, DepartmentName, QuantityInStock, OrderDate.
  - UNIQUE: VendorID, SupplyID, InventoryID, DepartmentID, OrderID, OrderDetailID, UsageID.
  - CHECK: QuantityInStock >= 0, QuantityOrdered > 0, UnitPrice >= 0.

### Normalization
- **1NF**: All attributes are atomic (no multi-valued attributes).
- **2NF**: No partial dependencies (e.g., OrderDetails separates SupplyID and QuantityOrdered from PurchaseOrders).
- **3NF**: No transitive dependencies (e.g., Vendor contact info is stored only in Vendors, not duplicated in PurchaseOrders).

### Handling Data Scenarios
- **Scenario 1**: Department requests supplies; system checks inventory and creates a purchase order if stock is low.
- **Scenario 2**: Vendor delivers supplies; inventory is updated, and usage is tracked.
- **Scenario 3**: Finance officer queries total spending by department for budgeting.

### Documentation
The ER model is documented using a diagram created in Lucidchart, showing entities, attributes, and relationships with proper cardinality and constraints.

**File Naming**: Tue_26503_ShemaKen_HealthcareSupplyChain_DB_LogicalModel