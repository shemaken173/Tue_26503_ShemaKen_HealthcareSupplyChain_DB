# Healthcare Supply Chain Management Process Model (UML)

## Scope
The business process modeled is the **Medical Supply Procurement and Inventory Management** for a large metropolitan hospital network. The process automates procurement, tracks inventory in real-time, and ensures supply availability to support hospital operations.

**Objectives:**
- Streamline procurement to reduce delays.
- Maintain optimal inventory levels to prevent shortages.
- Provide real-time data for decision-making by hospital administrators.

**Expected Outcomes:**
- Reduced procurement lead time.
- Minimized stockouts and overstocking.
- Enhanced visibility into supply chain operations.

## Key Entities and Roles
- **Procurement Manager**: Initiates and approves purchase orders.
- **Inventory Coordinator**: Monitors stock levels and updates inventory records.
- **Department Head**: Requests supplies for their department.
- **Vendors**: Supply medical items to the hospital.
- **Finance Officer**: Approves budgets and payments.
- **Database System**: Stores and processes supply chain data.

## UML Activity Diagram Description
The process is visualized using a UML activity diagram, created using Lucidchart, to represent the flow of activities in the medical supply procurement and inventory management process.

**Swimlanes:**
- **Procurement Manager**: Creates purchase orders, approves vendor selection.
- **Inventory Coordinator**: Checks and updates inventory levels.
- **Department Head**: Submits supply requests.
- **Vendor**: Receives orders and delivers supplies.
- **Finance Officer**: Approves budgets.
- **Database System**: Logs transactions and inventory updates.

**Activity Flow:**
1. **Initial Node**: Department Head submits a supply request.
2. **Activity**: Inventory Coordinator checks current stock levels in the database.
3. **Decision Node**: Evaluate if stock is sufficient.
   - If sufficient, proceed to fulfill the request from inventory.
   - If insufficient, proceed to procurement.
4. **Activity**: Procurement Manager creates a purchase order and selects a vendor.
5. **Activity**: Finance Officer approves the budget.
6. **Activity**: Vendor receives the order and delivers supplies.
7. **Activity**: Inventory Coordinator updates inventory levels in the database.
8. **Final Node**: Supplies are distributed to the requesting department.

**UML Elements:**
- **Initial Node**: Filled circle to mark the start.
- **Final Node**: Circle with an inner filled circle to mark the end.
- **Activities**: Rounded rectangles (e.g., "Check Inventory Levels", "Create Purchase Order").
- **Decision Node**: Diamond shape (e.g., "Is stock sufficient?").
- **Swimlanes**: Partitions to separate roles (e.g., Procurement Manager, Vendor).
- **Control Flows**: Arrows connecting activities and decision nodes.
- **Object Flows**: Dashed arrows to represent data objects (e.g., inventory records, purchase orders).
- **Annotations**: Notes to clarify actions (e.g., "Database update").

## Explanation
The UML activity diagram supports MIS by:
- **Automating Workflows**: Real-time inventory checks reduce manual errors.
- **Improving Decision-Making**: Data-driven procurement decisions based on stock levels.
- **Streamlining Operations**: Automated purchase order creation and approval reduce delays.
- **Enhancing Efficiency**: Centralized database ensures all stakeholders access up-to-date information.

**Tool Used**: Lucidchart for UML activity diagram creation.

**File Naming**: Tue_26503_ShemaKen_HealthcareSupplyChain_DB_UML