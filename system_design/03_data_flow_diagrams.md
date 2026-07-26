# BuildEx - System Design: Data Flow Diagrams (DFD)

This document shows how information (data) flows through the **BuildEx** system. It helps explain where the contractor's inputs go, how they are stored, and what the builder sees on the dashboard.

---

## 1. Level 0 DFD (Context Diagram)

The Level 0 diagram shows the big picture: how the **Builder** and the **Contractor** send and receive information through the **BuildEx App**.

```mermaid
flowchart TD
    %% External Entities
    C["👷 Contractor<br/>(Site Executor)"]
    B["👑 Builder<br/>(Owner / Approver)"]
    
    %% System Bubble
    System(["🛡️ BuildEx System"])

    %% Data Flow from Contractor to System
    C -- "1. Completed Sub-points" --> System
    C -- "2. Material Requests (Needs)" --> System
    C -- "3. Daily Logs (Labor, Machine, Usage)" --> System
    C -- "4. Site Issues & Snags" --> System

    %% Data Flow from System to Contractor
    System -- "a. Delivery Status (Arriving)" --> C
    System -- "b. Active Site Issues List" --> C

    %% Data Flow from Builder to System
    B -- "I. Update Material Status to 'Arriving'" --> System
    B -- "II. Close Resolved Site Issues" --> System

    %% Data Flow from System to Builder
    System -- "A. Overall Progress % & Phase Lists" --> B
    System -- "B. Active Material Requests" --> B
    System -- "C. Dashboard Overview & Active Issues" --> B

    %% Custom formatting
    classDef entity fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f,font-weight:bold;
    classDef system fill:#FFFFFF,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    class C,B entity;
    class System system;
```

---

## 2. Level 1 DFD (Detailed Data Flows)

The Level 1 diagram breaks the BuildEx app down into its **4 core processes** and shows how data is saved in different databases (**Data Stores**).

```mermaid
flowchart TD
    %% Actors
    C["👷 Contractor"]
    B["👑 Builder"]

    %% Processes (Bubbles)
    P1(["1.0 Track Progress & Phases"])
    P2(["2.0 Manage Material Needs"])
    P3(["3.0 Log Daily Operations (DPR)"])
    P4(["4.0 Manage Site Issues (Snags)"])

    %% Data Stores (Databases)
    D1[("DS1: Project Phases & Progress")]
    D2[("DS2: Material Requests")]
    D3[("DS3: Daily Site Reports")]
    D4[("DS4: Site Issues")]

    %% Process 1.0 (Progress Flow)
    C -- "Mark Sub-points Completed" --> P1
    P1 -- "Update Completed Points" --> D1
    D1 -- "Calculate Overall & Phase %" --> P1
    P1 -- "Display Percentage Progress" --> B

    %% Process 2.0 (Material Flow)
    C -- "Submit Material Requests" --> P2
    P2 -- "Save Request" --> D2
    D2 -- "Retrieve Pending Requests" --> P2
    P2 -- "Show Material Needs" --> B
    B -- "Mark Status as 'Arriving'" --> P2
    P2 -- "Update Request Status" --> D2
    P2 -- "Notify: 'Material Arriving'" --> C

    %% Process 3.0 (DPR Flow)
    C -- "Submit Labor, Machine, & Material Usage Logs" --> P3
    P3 -- "Save Daily Logs" --> D3
    D3 -- "Get Daily Summary Logs" --> P3
    P3 -- "Show Daily Logs Summary" --> B

    %% Process 4.0 (Issues Flow)
    C -- "Report Site Issue" --> P4
    B -- "Report Site Issue" --> P4
    P4 -- "Log New Issue" --> D4
    D4 -- "Retrieve Active Issues" --> P4
    P4 -- "Show Active Issues list" --> B
    C -- "Submit Photo of Fixed Issue" --> P4
    B -- "Mark Issue as 'Closed'" --> P4
    P4 -- "Update Issue Status to Closed" --> D4

    %% Custom formatting
    classDef actor fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f,font-weight:bold;
    classDef process fill:#FFFFFF,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef store fill:#F2F8F8,stroke:#6d797a,stroke-width:2px;
    class C,B actor;
    class P1,P2,P3,P4 process;
    class D1,D2,D3,D4 store;
```

---

## 3. Simple Data Flow Explanations

Here is what happens inside each of the 4 databases:

### DS1: Project Phases & Progress Database
* **Input from Contractor:** Checks off completed tasks (e.g., *Area Inspection*).
* **Output to Builder Dashboard:** Shows simple progress bars (e.g., *Substructure is 50% done*, *Overall Project is 12% done*).

### DS2: Material Requests Database
* **Input from Contractor:** List of materials needed (Cement, Sand, etc.).
* **Action by Builder:** Taps "Mark Arriving" when ordered.
* **Output to Contractor:** Changes status color from red (Pending) to yellow (Arriving) on their phone.

### DS3: Daily Site Reports Database
* **Input from Contractor:** Daily logs including worker count, machine hours, and material consumed today.
* **Output to Builder Dashboard:** A clean daily report ledger summarizing how resources are being used.

### DS4: Site Issues Database
* **Input from Contractor/Builder:** Defect reports with photos.
* **Action by Contractor:** Marks resolved with fix photo.
* **Action by Builder:** Closes the ticket.
* **Output to Builder Dashboard:** Highlighted warnings of unresolved issues on site.
