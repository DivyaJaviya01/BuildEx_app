# BuildEx - System Design: Problem, Solution, Features & Users (Builder-Contractor Model)

This document defines the core business requirements, product scope, and user model for **BuildEx**, structured around the real-world operational relationship between a **Builder (Developer)** and a **Contractor**.

---

## 1. The Builder-Contractor Relationship

BuildEx connects two primary roles to manage site progress and materials:
1. **The Builder (Developer / Owner):** 
  * Monitors progress in percentage completion based on a detailed phase/sub-phase list.
  * Reviews material consumption and receives low-stock alerts.
  * Monitors active site issues on their central dashboard.
2. **The Contractor (Execution Agency):** 
  * Submits daily progress reports (what work was done, materials used, labor attendance, and machinery used).
  * Logs daily material consumption from available stock.
  * Reports site issues/snags.

```mermaid
graph TD
    subgraph Contractor ["Contractor (On-Site Log)"]
        Consumption[Log Daily Material Consumption]
        DPR[Log Daily Progress, Attendance, Machinery]
        Snag[Report Site Issues]
    end

    subgraph Builder ["Builder (Dashboard View)"]
        Stock[Record Material Stock & View Alerts]
        TrackProgress[Track Phase-wise Progress in %]
        TrackIssues[Monitor Site Issues]
    end

    Consumption --> Stock
    DPR --> TrackProgress
    Snag --> TrackIssues
```

---

## 2. Core Problem Statement

### Challenges in Traditional Operations
* **No Phase-wise Progress Tracking:** Builders do not know the exact percentage of completion for milestones like "Substructure" or "Digging & Base Creation."
* **No Material Stock Visibility:** Contractors use materials and inform builders via phone/chat. Builders have no real-time view of remaining stock levels or when materials will run out.
* **Daily Report Delays:** Builders have to call the contractor every evening to know about labor attendance, material consumption, and machinery usage.

---

## 3. Product Module Breakdown

### 1. Builder Dashboard (What the Builder Sees)
* **A. Progress Tracking (Phases & Sub-points):**
  * Displays overall and phase-wise completion in **percentages**.
  * Follows a strict hierarchy:
    * *Phase 1: Substructure*
      * Area Inspection (Sub-point)
      * Architecture Design (Sub-point)
    * *Phase 2: Digging and Base Creation*
      * Clean Area (Sub-point)
      * Clean Site (Sub-point)
* **B. Material Stock Panel:**
  * Record initial material stock deliveries.
  * View remaining stock levels with auto-calculated consumption.
  * Receive low-stock alerts for materials nearing depletion.
* **C. Issue Tracker:**
  * Real-time list of site blockages, defects, and safety snags.

### 2. Contractor App (What the Contractor Does)
* **A. Daily Progress Report (DPR):**
  * Select active sub-points (e.g. "Clean Area" under Phase 2) and mark them as complete.
  * Enter **materials used** today (e.g., "50 bags of cement").
  * Mark **labor attendance** (number of workers on site).
  * Log **machinery used** (e.g., "JCB operated for 4 hours").
* **B. Material Consumption Log:**
  * Log daily material usage (e.g., "Used 10 bags of cement").
  * View remaining stock levels from consumption records.
* **C. Report Site Issues:**
  * Quick form to report defects or problems with photos.

---

## 4. Scoped Features & Phases (MVP vs. Phase 2)

### Phase 1 (MVP Scope)
The MVP focuses on the daily communication loop: Contractor logs work & requests -> Builder tracks progress & approves requests.

| Feature Area | Role | MVP Functionality |
| :--- | :--- | :--- |
| **User Access** | Shared | Simple login. User starts as Builder. If invited/assigned to a site by email, they are resolved as a Contractor. |
| **Progress Tracker** | Shared | Contractor updates sub-points; Builder sees phase progress in %. |
| **Material Stock & Consumption** | Shared | Builder records initial stock; Contractor logs daily consumption; system tracks remaining. |
| **Daily Attendance** | Contractor | Add workers with daily wage and mark Present/Absent. |
| **Daily Site Logs** | Contractor | Log worker attendance, machinery usage, and site photos. |
| **Issue Logger** | Shared | Contractor reports issues; Builder monitors them on dashboard. |

### Phase 2 (Future Scope)
* **Vendor Purchasing:** Builder can upload and store invoices directly from vendors inside the app.
* **Offline Logging:** Allow the contractor to submit logs offline, which auto-sync when network is available.
* **Automated Alerts:** Send instant WhatsApp or Push Notifications when material status changes to "Arriving."

---

## 5. Roles & Permissions Matrix

| System Action | Builder | Contractor |
| :--- | :---: | :---: |
| Mark Sub-point as Completed | Cross (✗) | Check (✓) |
| View Phase Progress (%) | Check (✓) | Check (✓) |
| Log Material Consumption | Cross (✗) | Check (✓) |
| Record Initial Material Stock | Check (✓) | Cross (✗) |
| Log Daily Material Consumption | Cross (✗) | Check (✓) |
| View Stock Levels & Alerts | Check (✓) | Check (✓) |
| Mark Worker Attendance with Daily Wage | Cross (✗) | Check (✓) |
| Log Machinery Hours | Cross (✗) | Check (✓) |
| Report Site Issue (Snags) | Check (✓) | Check (✓) |
| Close Site Issue (Snags) | Check (✓) | Cross (✗) |
