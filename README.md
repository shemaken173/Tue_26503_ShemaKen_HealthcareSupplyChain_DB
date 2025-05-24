# PL/SQL Market Access System - Capstone Project

## Introduction
- **Student**: Ishimwe Honore (26578)
- **Course**: Database Development with PL/SQL (INSY 8311)
- **Lecturer**: Eric Maniraguha

## Problem Statement
Rwandan smallholder farmers face challenges accessing fair markets due to digital barriers, weak logistics, and middlemen dominance, leading to low income and post-harvest wastage. This project develops a PL/SQL-based Oracle database to automate transactions, improve trade fairness, and reduce losses.

## Methodology
- **Phase I**: Defined problem and presented objectives.
- **Phase II**: Modeled order processing using UML.
- **Phase III**: Designed logical data model with ER diagram.
- **Phase IV**: Created pluggable database (Tues_26578_Honore_MarketAccess_DB).
- **Phase V**: Implemented tables and inserted realistic data.
- **Phase VI**: Developed procedures for order processing and data retrieval.
- **Phase VII**: Implemented triggers and auditing for security.
- **Phase VIII**: Compiled documentation and presentation.

## Screenshots
- **ER Diagram**: 
- **UML Diagram**:![DBMS ER diagram (UML notation) - Page 1](https://github.com/user-attachments/assets/c24fff2c-2225-4a8b-885d-2351866202c0)

- **OEM Dashboard**:![pdb1](https://github.com/user-attachments/assets/842d9bc7-2920-4555-ac3e-2c4d25ca3016)
![pdb2](https://github.com/user-attachments/assets/660fb6e8-896f-4dc0-863c-b0beacc44a03)![grant1](https://github.com/user-attachments/assets/6a3f9a2c-61e0-4ead-b456-d2d6724d5105)![grant2](https://github.com/user-attachments/assets/afb8fb42-65c2-47a8-b083-ef43e8cedbc1)



- **Sample Query Output**:![tables-createtion](https://github.com/user-attachments/assets/2746bdae-a720-4fcd-8b31-422c02e9ab09)
![insert data](https://github.com/user-attachments/assets/9431b4cc-0ceb-4ade-91d7-ae22f6aa4c74)
![Create sequences](https://github.com/user-attachments/assets/ff01c227-aa5b-4649-8882-636406376466)
![trigger](https://github.com/user-attachments/assets/ec9af861-7521-45b4-8b1f-c9c0dc8a44c5)
![procedure](https://github.com/user-attachments/assets/e428521e-4615-4009-88fd-c3a3b26cf240)

## SQL Queries
- **Table Creation and Data Insertion**:
```sql
 -- Table Creation
CREATE TABLE Farmer (
    FarmerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Phone VARCHAR2(15) UNIQUE,
    Location VARCHAR2(100)
);

CREATE TABLE Buyer (
    BuyerID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Address VARCHAR2(200)
);

CREATE TABLE Produce (
    ProduceID NUMBER PRIMARY KEY,
    FarmerID NUMBER,
    Name VARCHAR2(50) NOT NULL,
    Quantity NUMBER CHECK (Quantity >= 0),
    PricePerUnit NUMBER CHECK (PricePerUnit > 0),
    FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID)
);

CREATE TABLE OrderTable (
    OrderID NUMBER PRIMARY KEY,
    BuyerID NUMBER,
    ProduceID NUMBER,
    OrderDate DATE DEFAULT SYSDATE,
    Quantity NUMBER CHECK (Quantity > 0),
    TotalAmount NUMBER,
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    FOREIGN KEY (ProduceID) REFERENCES Produce(ProduceID)
);

CREATE TABLE Logistics (
    LogisticsID NUMBER PRIMARY KEY,
    OrderID NUMBER,
    ProviderName VARCHAR2(100),
    DeliveryDate DATE,
    Status VARCHAR2(20) CHECK (Status IN ('Pending', 'In Transit', 'Delivered')),
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
);

CREATE TABLE Payment (
    PaymentID NUMBER PRIMARY KEY,
    OrderID NUMBER UNIQUE,
    Amount NUMBER CHECK (Amount > 0),
    PaymentDate DATE DEFAULT SYSDATE,
    Status VARCHAR2(20) CHECK (Status IN ('Pending', 'Completed', 'Failed')),
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
);

-- Data Insertion
INSERT INTO Farmer (FarmerID+-- Data Insertion
INSERT INTO Farmer (FarmerID, FirstName, LastName, Phone, Location) VALUES (1, 'John', 'Mugabo', '0781234567', 'Kigali');
INSERT INTO Farmer (FarmerID, FirstName, LastName, Phone, Location) VALUES (2, 'Marie', 'Uwase', '0798765432', 'Musanze');

INSERT INTO Buyer (BuyerID, FirstName, LastName, Email, Address) VALUES (1, 'Paul', 'Kagame', 'paul@example.com', 'Kigali City');
INSERT INTO Buyer (BuyerID, FirstName, LastName, Email, Address) VALUES (2, 'Jane', 'Akili', 'jane@example.com', 'Huye');

INSERT INTO Produce (ProduceID, FarmerID, Name, Quantity, PricePerUnit) VALUES (1, 1, 'Maize', 100, 500);
INSERT INTO Produce (ProduceID, FarmerID, Name, Quantity, PricePerUnit.AbsoluteZero) VALUES (2, 2, 'Beans', 80, 700);

INSERT INTO OrderTable (OrderID, BuyerID, ProduceID, OrderDate, Quantity, TotalAmount) VALUES (1, 1, 1, SYSDATE, 50, 25000);
INSERT INTO OrderTable (OrderID, BuyerID, ProduceID, OrderDate, Quantity, TotalAmount) VALUES (2, 2, 2, SYSDATE, 30, 21000);

INSERT INTO Logistics (LogisticsID, OrderID, ProviderName, DeliveryDate, Status) VALUES (1, 1, 'Rwanda Logistics', TO_DATE('2025-05-20', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Logistics (LogisticsID, OrderID, ProviderName, DeliveryDate, Status) VALUES (2, 2, 'Fast Delivery', TO_DATE('2025-05-21', 'YYYY-MM-DD'), 'In Transit');

INSERT INTO Payment (PaymentID, OrderID, Amount, PaymentDate, Status) VALUES (1, 1, 25000, SYSDATE, 'Completed');
INSERT INTO Payment (PaymentID, OrderID, Amount, PaymentDate, Status) VALUES (2, 2, 21000, SYSDATE, 'Pending');
```
- **Triggers**:
```sql
-- Create Holiday Table
CREATE TABLE PublicHolidays (
    HolidayDate DATE PRIMARY KEY,
    HolidayName VARCHAR2(100)
);

-- Insert Holidays for June 2025
INSERT INTO PublicHolidays (HolidayDate, HolidayName) VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Heroes Day');
INSERT INTO PublicHolidays (HolidayDate, HolidayName) VALUES (TO_DATE('2025-06-04', 'YYYY-MM-DD'), 'Liberation Day');

-- Create Audit Table
CREATE TABLE AuditLog (
    LogID NUMBER PRIMARY KEY,
    UserID VARCHAR2(50),
    ActionDate DATE,
    Operation VARCHAR2(50),
    TableName VARCHAR2(50),
    Status VARCHAR2(20)
);

-- Sequence for AuditLog
CREATE SEQUENCE AuditLog_Seq START WITH 1 INCREMENT BY 1;

-- Compound Trigger to Restrict DML and Log Actions
CREATE OR REPLACE TRIGGER Restrict_DML FOR INSERT OR UPDATE OR DELETE ON Farmer COMPOUND TRIGGER
    -- Variables declaration in declaration section
    v_day VARCHAR2(10);
    v_holiday NUMBER := 0;
    v_operation VARCHAR2(10);
    
    BEFORE STATEMENT IS
    BEGIN
        -- Determine the operation type
        IF INSERTING THEN
            v_operation := 'INSERT';
        ELSIF UPDATING THEN
            v_operation := 'UPDATE';
        ELSIF DELETING THEN
            v_operation := 'DELETE';
        END IF;
        
        -- Get the day of week
        SELECT TO_CHAR(SYSDATE, 'DY') INTO v_day FROM DUAL;
        
        -- Check if it's a weekend
        IF v_day IN ('SAT', 'SUN') THEN
            -- Log the denied operation
            INSERT INTO AuditLog (LogID, UserID, ActionDate, Operation, TableName, Status)
            VALUES (AuditLog_Seq.NEXTVAL, USER, SYSDATE, v_operation, 'Farmer', 'Denied - Weekend');
            
            -- Raise application error
            RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekends.');
        END IF;
        
        -- Check if it's a holiday
        BEGIN
            SELECT COUNT(*) INTO v_holiday
            FROM PublicHolidays
            WHERE HolidayDate = TRUNC(SYSDATE);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_holiday := 0;
        END;
        
        IF v_holiday > 0 THEN
            -- Log the denied operation
            INSERT INTO AuditLog (LogID, UserID, ActionDate, Operation, TableName, Status)
            VALUES (AuditLog_Seq.NEXTVAL, USER, SYSDATE, v_operation, 'Farmer', 'Denied - Holiday');
            
            -- Raise application error
            RAISE_APPLICATION_ERROR(-20002, 'DML operations are not allowed on public holidays.');
        END IF;
    END BEFORE STATEMENT;
    
    AFTER STATEMENT IS
    BEGIN
        -- Log successful operation
        INSERT INTO AuditLog (LogID, UserID, ActionDate, Operation, TableName, Status)
        VALUES (AuditLog_Seq.NEXTVAL, USER, SYSDATE, v_operation, 'Farmer', 'Allowed');
    END AFTER STATEMENT;
END;
/
```
- **Procedures**:
```sql
-- Compound Trigger to Restrict DML and Log Actions
CREATE OR REPLACE TRIGGER Restrict_DML FOR INSERT OR UPDATE OR DELETE ON Farmer COMPOUND TRIGGER
    -- Variables declaration in declaration section
    v_day VARCHAR2(10);
    v_holiday NUMBER := 0;
    v_operation VARCHAR2(10);
    
    BEFORE STATEMENT IS
    BEGIN
        -- Determine the operation type
        IF INSERTING THEN
            v_operation := 'INSERT';
        ELSIF UPDATING THEN
            v_operation := 'UPDATE';
        ELSIF DELETING THEN
            v_operation := 'DELETE';
        END IF;
        
        -- Get the day of week
        SELECT TO_CHAR(SYSDATE, 'DY') INTO v_day FROM DUAL;
        
        -- Check if it's a weekend
        IF v_day IN ('SAT', 'SUN') THEN
            -- Log the denied operation
            INSERT INTO AuditLog (LogID, UserID, ActionDate, Operation, TableName, Status)
            VALUES (AuditLog_Seq.NEXTVAL, USER, SYSDATE, v_operation, 'Farmer', 'Denied - Weekend');
            
            -- Raise application error
            RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekends.');
        END IF;
        
        -- Check if it's a holiday
        BEGIN
            SELECT COUNT(*) INTO v_holiday
            FROM PublicHolidays
            WHERE HolidayDate = TRUNC(SYSDATE);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_holiday := 0;
        END;
        
        IF v_holiday > 0 THEN
            -- Log the denied operation
            INSERT INTO AuditLog (LogID, UserID, ActionDate, Operation, TableName, Status)
            VALUES (AuditLog_Seq.NEXTVAL, USER, SYSDATE, v_operation, 'Farmer', 'Denied - Holiday');
            
            -- Raise application error
            RAISE_APPLICATION_ERROR(-20002, 'DML operations are not allowed on public holidays.');
        END IF;
    END BEFORE STATEMENT;
    
    AFTER STATEMENT IS
    BEGIN
        -- Log successful operation
        INSERT INTO AuditLog (LogID, UserID, ActionDate, Operation, TableName, Status)
        VALUES (AuditLog_Seq.NEXTVAL, USER, SYSDATE, v_operation, 'Farmer', 'Allowed');
    END AFTER STATEMENT;
END;
/
-- Stored Procedure for Order Processing
CREATE OR REPLACE PROCEDURE ProcessOrder (
    p_BuyerID IN NUMBER,
    p_ProduceID IN NUMBER,
    p_Quantity IN NUMBER
) AS
    v_Available NUMBER;
    v_Price NUMBER;
    v_OrderID NUMBER;
BEGIN
    -- Check availability
    SELECT Quantity, PricePerUnit INTO v_Available, v_Price
    FROM Produce
    WHERE ProduceID = p_ProduceID
    FOR UPDATE;
    
    IF v_Available < p_Quantity THEN
        RAISE_APPLICATION_ERROR(-20003, 'Insufficient stock.');
    END IF;
    
    -- Generate OrderID
    SELECT MAX(OrderID) + 1 INTO v_OrderID FROM OrderTable;
    IF v_OrderID IS NULL THEN
        v_OrderID := 1;
    END IF;
    
    -- Insert Order
    INSERT INTO OrderTable (OrderID, BuyerID, ProduceID, Quantity, TotalAmount)
    VALUES (v_OrderID, p_BuyerID, p_ProduceID, p_Quantity, p_Quantity * v_Price);
    
    -- Update Produce Quantity
    UPDATE Produce
    SET Quantity = Quantity - p_Quantity
    WHERE ProduceID = p_ProduceID;
    
    -- Insert Payment
    INSERT INTO Payment (PaymentID, OrderID, Amount, Status)
    VALUES (v_OrderID, v_OrderID, p_Quantity * v_Price, 'Pending');
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
```

## Results
- Automated order processing with real-time stock updates.
- Secured transactions with auditing and restrictions.
- Reduced wastage through demand-driven sales.
- Enhanced market access for farmers.

## Conclusion
The system addresses key challenges faced by Rwandan farmers, providing a scalable solution for fair trade and efficient supply chains.

## References
- Oracle PL/SQL Documentation
- BPMN 2.0 Specifications
