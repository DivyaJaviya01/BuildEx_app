# BuildEx - System Design: Use Cases & Workflows (Simplified)

This document explains what the **Builder** and the **Contractor** can do inside the **BuildEx** app, written in simple everyday language.

---

## 1. User Roles

* **Builder (Owner):** 
  * Wants to see a **Dashboard** with overall project progress (in %).
  * Wants to track progress divided by **Phases (Points)** and **Sub-phases (Sub-points)** (e.g., *Phase 1: Substructure* -> *Area Inspection*).
  * Records initial material stock and monitors low stock alerts.
  * Monitors active site issues.
* **Contractor (Site Manager):** 
  * Submits **Daily Progress Reports (DPR)** (work done, materials used, labor attendance, machinery logs).
  * Marks phase sub-points as completed.
  * Logs daily material consumption from stock.
  * Reports site issues.

---

## 2. Use Case Diagram

This diagram shows what the Builder and Contractor do inside the app.

```mermaid
flowchart LR
    %% Actors
    B["👑 Builder<br/>(Owner / Dashboard Viewer)"]
    C["👷 Contractor<br/>(Site Manager)"]

    %% System Boundary
    subgraph BuildEx ["🛡️ BuildEx App"]
        
        %% Material Module
        subgraph MaterialModule ["Material Stock & Consumption"]
            UC_RecordStock(["Record Initial Material Stock"])
            UC_LogUsage(["Log Daily Material Consumption"])
            UC_ViewStock(["View Stock Levels & Alerts"])
        end

        %% Site Execution Module
        subgraph ExecutionModule ["Daily Site Work"]
            UC_MarkSubpoint(["Mark Sub-points as Completed"])
            UC_LogAttendance(["Log Worker Attendance with Wage"])
            UC_LogDPR(["Submit Daily Logs (Labor, Machine, Photos)"])
            UC_ReportSnag(["Report a Site Issue"])
        end

        %% Builder Dashboard Module
        subgraph DashboardModule ["Builder Dashboard"]
            UC_ViewDashboard(["View Progress in % & Phase Lists"])
            UC_ViewIssues(["Track Active Site Issues"])
        end
    end

    %% Contractor Actions
    C --> UC_LogUsage
    C --> UC_LogAttendance
    C --> UC_MarkSubpoint
    C --> UC_LogDPR
    C --> UC_ReportSnag

    %% Builder Actions
    B --> UC_RecordStock
    B --> UC_ViewStock
    B --> UC_ViewDashboard
    B --> UC_ViewIssues
    B --> UC_ReportSnag

    %% Custom formatting
    classDef actor fill:#FFC800,stroke:#0f1e1f,stroke-width:2px,color:#0f1e1f,font-weight:bold;
    classDef usecase fill:#FFFFFF,stroke:#00696e,stroke-width:2px,color:#0f1e1f;
    classDef boundary fill:#F2F8F8,stroke:#6d797a,stroke-width:2px,stroke-dasharray: 5 5;
    
    class B,C actor;
    class UC_RecordStock,UC_LogUsage,UC_ViewStock,UC_LogAttendance,UC_MarkSubpoint,UC_LogDPR,UC_ReportSnag,UC_ViewDashboard,UC_ViewIssues usecase;
    class BuildEx boundary;
```

---

## 3. How the Main Features Work (Step-by-Step)

Here are the 4 main workflows explaining what the contractor does daily, what the builder does, and what the builder sees.

### 1. Progress Tracking (Phases & Percentages)

* **What is it?** How the builder tracks progress using phases and sub-points.
* **Who does what?**
  * **Contractor** marks tasks (sub-points) as completed.
  * **Builder** monitors the phase completion percentages.
* **How it works step-by-step:**
  1. The project is set up with Phases and Sub-points:
     * *Phase 1: Substructure*
       * Area Inspection (Sub-point 1)
       * Architecture Design (Sub-point 2)
     * *Phase 2: Digging and Base Creation*
       * Clean Area (Sub-point 1)
       * Clean Site (Sub-point 2)
  2. The **Contractor** completes a task (e.g., "Clean Area") and marks it completed in the app.
  3. The app automatically calculates the completion percentage for that Phase and the overall project.
* **What the Builder sees on the Dashboard:** Overall progress (e.g., *"Overall Progress: 35%"*) and a breakdown of completed points under each Phase.

---

### 2. Material Stock & Consumption

* **What is it?** How material stock is recorded, consumed, and tracked so the Builder knows when to replenish.
* **Who does what?**
  * **Builder** records initial stock deliveries.
  * **Contractor** logs daily consumption.
  * **System** auto-calculates remaining stock and alerts on low levels.
* **How it works step-by-step:**
  1. **Builder** records material delivery (e.g., "50 bags of cement received").
  2. **Contractor** logs daily usage (e.g., "Used 10 bags of cement today").
  3. System deducts consumption and updates remaining quantity.
  4. When stock is low (e.g., below 20%), **Builder** sees an alert on the dashboard.
  5. **Builder** orders more stock from the supplier.
* **What the Builder sees on the Dashboard:** Stock levels per material, consumption trends, and low-stock alerts.

---

### 3. Daily Site Logs (DPR)

* **What is it?** Daily records of sub-phase progress, worker attendance (with wages), machinery, and materials used.
* **Who does what?**
  * **Contractor** logs everything daily.
  * **Builder** views daily details.
* **How it works step-by-step:**
  1. Throughout the day, the **Contractor** logs:
     * **Sub-phase Progress:** Marks sub-points as completed (e.g., "Clean Area").
     * **Material Used:** e.g., "Used 10 bags of cement for slab casting."
     * **Worker Attendance:** Adds each worker with name and daily wage, marks Present/Absent.
     * **Machinery:** e.g., "Mixer machine used for 3 hours."
  2. Contractor uploads site photos and submits the log.
  3. System auto-calculates phase progress and total wages payable.
* **What the Builder sees on the Dashboard:** Phase-wise progress %, worker attendance summary, wage liability, and material consumption.

---

### 4. Tracking Site Issues (Snags)

* **What is it?** Logging and tracking defects or delays.
* **Who does what?**
  * **Contractor / Builder** logs issues.
  * **Builder** tracks them until closed.
* **How it works step-by-step:**
  1. If a problem occurs (e.g., "Water leakage in column"), the **Contractor** (or Builder) logs it with a photo.
  2. The **Builder** sees this active issue highlighted on their dashboard.
  3. Once the contractor fixes the issue, they upload a photo of the resolved work.
  4. The **Builder** verifies and marks the issue as "Closed."
* **What the Builder sees on the Dashboard:** A list of unresolved site issues and photos of fixed items.
