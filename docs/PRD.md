# BuildTrack - Product Requirements Document (PRD)

**Project:** BuildTrack (Working Title)  
**Platform:** Flutter (Android first, iOS later)  
**Version:** 1.0  
**Purpose:** Team onboarding document

---

# 1. Project Overview

BuildTrack is a mobile application that helps construction companies replace paper-based daily site management with a simple digital system.

Instead of using notebooks, WhatsApp messages, Excel sheets, and phone galleries, engineers can record everything inside one app.

The goal is to make site reporting faster, organized, and easier to access for everyone involved.

---

# 2. Problem Statement

Many small and medium construction companies still manage projects manually.

A typical site engineer has to:

- Write daily work in a notebook
- Take photos with their phone
- Record worker attendance on paper
- Track material usage manually
- Report progress to the project manager using WhatsApp or phone calls

This creates several problems:

- Information gets lost
- Reports take too much time
- Photos are difficult to organize
- Managers don't know the actual site progress
- Issues and defects are forgotten
- Paper records are difficult to search later

---

# 3. Our Solution

BuildTrack provides one mobile application where the site engineer can manage daily construction work.

Instead of maintaining multiple records, everything is stored inside one app.

The engineer simply:

- Selects the project
- Records today's work
- Uploads photos
- Marks attendance
- Logs material usage
- Reports issues
- Submits the daily report

The manager can later view all project updates from one place.

---

# 4. Target Users

### Site Engineer

Uses the app daily to record construction activities.

### Project Manager

Monitors project progress and reviews reports.

### Contractor / Company Owner

Tracks overall project status and performance.

---

# 5. Project Goals

Our app should help construction companies:

- Reduce paperwork
- Save reporting time
- Keep records organized
- Improve communication
- Track project progress easily
- Maintain digital history of every project

---

# 6. MVP Features (Minimum Version)

These are the features we will build first.

## User Login

- Secure login
- User profile

---

## Project List

- View assigned projects
- Select active project

---

## Daily Progress Report

- Enter today's work
- Add progress notes
- Save report

---

## Photo Upload

- Capture site photos
- Attach photos to reports

---

## Worker Attendance

- Mark workers present or absent
- View attendance history

---

## Material Usage

- Record materials used
- Enter quantity

---

## Issue / Defect Reporting

- Report construction issues
- Add photo
- Add description

---

## Daily Report Summary

- Automatically generate today's report
- Submit to manager

---

# 7. Future Enhancements

These features are planned after the MVP.

- GPS location tracking
- QR code for projects
- Push notifications
- Offline mode
- PDF report export
- Safety inspection checklist
- Equipment tracking
- AI-generated report summary
- Dashboard with charts
- Multi-language support

---

# 8. How We Will Solve the Problem

Current Workflow

```
Site Work
    ↓
Engineer writes notes
    ↓
Takes photos
    ↓
Marks attendance
    ↓
Creates report manually
    ↓
Sends via WhatsApp
```

Problems

- Slow
- Paper-based
- Easy to lose information
- Hard to organize

---

New Workflow Using BuildTrack

```
Open App
      ↓
Select Project
      ↓
Record Today's Work
      ↓
Upload Photos
      ↓
Mark Attendance
      ↓
Record Materials
      ↓
Report Issues
      ↓
Submit Daily Report
      ↓
Manager Reviews Report
```

Everything is stored in one place.

---

# 9. User Flow

## Site Engineer

Login

↓

Select Project

↓

Fill Daily Report

↓

Upload Photos

↓

Submit

---

## Project Manager

Login

↓

View Projects

↓

Open Daily Reports

↓

Review Progress

↓

Monitor Site

---

# 10. Team Roles & Responsibilities

## Member 1 – UI Designer

Responsible for:

- Designing app screens
- Colors
- Layout
- User experience
- Icons

---

## Member 2 – Flutter Developer

Responsible for:

- Building app screens
- Navigation
- Connecting features
- Managing app logic

---

## Member 3 – Backend & Database

Responsible for:

- User accounts
- Saving data
- Database
- Login system
- Cloud storage

---

## Everyone

- Testing
- Finding bugs
- Discussing improvements
- Project documentation
- Presentation preparation

---

# 11. Success Criteria

The project is successful if:

- Engineers can submit reports in less than 10 minutes.
- Managers can view reports from anywhere.
- Photos remain organized by project.
- Attendance is stored digitally.
- Material records are searchable.
- Daily reports no longer require paper.

---

# 12. Timeline

## Week 1

- Research
- Design UI
- Create Flutter project
- Plan database

---

## Week 2

- Login
- Project management
- Daily report
- Navigation

---

## Week 3

- Attendance
- Materials
- Photos
- Issue reporting

---

## Week 4

- Testing
- Fix bugs
- Improve UI
- Final presentation
- Documentation

---

# 13. Expected Benefits

For Engineers

- Less paperwork
- Faster reporting
- Easier photo management

For Managers

- Better project visibility
- Faster decision making
- Organized records

For Company

- Digital documentation
- Improved productivity
- Reduced paper usage

---

# 14. Future Vision

In the future, BuildTrack can become a complete construction management platform.

Possible future modules:

- AI progress analysis
- Cost estimation
- Project scheduling
- Worker management
- Equipment management
- Safety inspections
- Material inventory
- Client reporting
- Analytics dashboard

---

# 15. Non-Technical Glossary

| Term | Meaning |
|-------|---------|
| Flutter | A tool used to build mobile apps for Android and iPhone using one codebase. |
| MVP (Minimum Viable Product) | The first version of the app with only the most important features. |
| UI (User Interface) | Everything the user sees and interacts with on the screen. |
| Backend | The part of the system that stores data and manages user accounts behind the scenes. |
| Database | A digital storage place where app information is saved. |
| Cloud | Online storage that lets data be accessed from different devices. |
| Daily Report | A summary of the work completed on a construction site each day. |
| Defect | A construction issue or problem that needs to be fixed. |
| Dashboard | A screen that shows project information and summaries in one place. |
| Offline Mode | Allows the app to work even when there is no internet connection. |

---

# 16. Final Goal

Our goal is to create a simple, user-friendly mobile application that helps construction companies move from paper-based reporting to a digital workflow.

The app should save time, improve communication, keep project information organized, and make construction site management easier for everyone involved.