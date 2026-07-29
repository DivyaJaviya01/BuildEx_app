# BuildEx -- Design Guidelines

## 1. Design Overview

BuildEx is a modern mobile-first construction project management
application designed for contractors and builders.

The interface must feel:

-   Modern
-   Minimal
-   Professional
-   Construction-focused
-   Clean and easy to scan
-   Fast to use on-site
-   Touch-friendly
-   Consistent across every screen

The UI should follow the supplied reference design while using the
**BuildEx brand identity and the user's own existing logo**.

------------------------------------------------------------------------

## 2. Mandatory Mobile Width

**All screens must be designed using a base mobile width of exactly
390px.**

### Layout Rules

-   Base design width: **390px**
-   Width: **100%**
-   Maximum width: **390px**
-   Center the app container when previewed on a larger viewport
-   Height should adapt naturally to screen content
-   No horizontal overflow
-   Use responsive spacing instead of fixed absolute positioning
-   The application is mobile-first; do not create desktop-style layouts

Example:

``` css
.app-container {
    width: 100%;
    max-width: 390px;
    margin: 0 auto;
}
```

For smaller phones, the layout should scale responsively while
preserving the same visual hierarchy.

------------------------------------------------------------------------

## 3. Logo -- Mandatory Rule

BuildEx has its **own custom logo**.

Always use the existing BuildEx logo asset supplied with the project.

### Do

-   Use the provided BuildEx logo asset
-   Preserve the original proportions
-   Keep sufficient clear space around the logo
-   Use it on authentication and branding screens

### Do Not

-   Generate a new logo
-   Redesign the logo
-   Replace it with a generic construction icon
-   Replace it with plain text
-   Distort, stretch, or unnecessarily modify the existing logo

The reference design is for **UI inspiration only**. Its logo must not
replace the BuildEx logo.

------------------------------------------------------------------------

## 4. Brand Color System

### Primary -- Teal / Turquoise

`#20AEB5`

Use for:

-   Top app bars
-   Primary brand areas
-   Selected states
-   Active UI elements
-   Important information cards
-   Progress-related elements

### Accent -- Construction Yellow

`#FFC800`

Use for:

-   Primary CTA buttons
-   Bottom navigation
-   Important actions
-   Selected highlights
-   Save and submit actions

### App Background

`#F2F8F8`

Alternative:

`#F5FAFA`

Use a subtle cool background instead of pure white across the entire
app.

### Card Background

`#FFFFFF`

### Primary Text

`#1F2D2E`

### Secondary Text

`#687879`

Avoid pure black for normal text.

------------------------------------------------------------------------

## 5. Typography

Use **Inter** as the preferred font.

Fallbacks:

1.  Inter
2.  Poppins
3.  Roboto
4.  System sans-serif

### Typography Scale

#### Page Title

-   20--22px
-   Weight: 700

#### Section Heading

-   16--18px
-   Weight: 600

#### Card Title

-   14--16px
-   Weight: 600

#### Body

-   13--14px
-   Weight: 400

#### Metadata / Supporting Text

-   11--12px
-   Weight: 400

#### Button Text

-   13--14px
-   Weight: 600

Readability is more important than decorative typography.

------------------------------------------------------------------------

## 6. General Layout

Use a clean vertical mobile layout.

### Standard Spacing

Use a consistent spacing system:

-   4px
-   8px
-   12px
-   16px
-   20px
-   24px
-   32px

### Recommended Values

-   Page horizontal padding: **16px**
-   Card padding: **12--16px**
-   Section gap: **16--24px**
-   Small element gap: **8--12px**

Avoid overcrowding.

------------------------------------------------------------------------

## 7. Top App Bar

Main application screens should use a clean teal top app bar.

### Style

-   Approximate height: 56px
-   Background: `#20AEB5`
-   White text
-   White/light icons
-   Minimal visual treatment

Typical structure:

`[Back/Menu]   Page Title   [Action/Profile]`

Examples:

-   My Projects
-   Project Hub
-   Daily Progress
-   Site Photos
-   Worker Attendance
-   Material Log
-   Report Issue
-   My Tasks
-   My Team
-   My Profile

------------------------------------------------------------------------

## 8. Cards

Cards are a core component of the BuildEx interface.

Use them for:

-   Projects
-   Tasks
-   Workers
-   Materials
-   Statistics
-   Project modules
-   Reports
-   Account settings
-   Information messages

### Card Style

-   Background: `#FFFFFF`
-   Border radius: **8--12px**
-   Padding: **12--16px**
-   Subtle border or subtle shadow
-   Clear internal hierarchy

Do not use heavy shadows or excessive glass effects.

------------------------------------------------------------------------

## 9. Buttons

### Primary CTA

Use construction yellow `#FFC800`.

Recommended:

-   Width: 100% when used as the main bottom action
-   Height: 48--52px
-   Radius: 8px
-   Dark readable text
-   Semi-bold label
-   Optional consistent leading icon

Examples:

-   SIGN UP
-   SIGN IN
-   SUBMIT DAILY REPORT
-   SAVE NOTES
-   SAVE PHOTOS
-   SAVE ATTENDANCE
-   SAVE MATERIAL LOG
-   LOG ISSUE

### Secondary Action

Use either:

-   White background + teal border + teal text

or

-   Light teal background + dark teal text

depending on hierarchy.

------------------------------------------------------------------------

## 10. Inputs and Forms

All forms should be simple and highly readable.

### Input Style

-   Height: minimum 44--48px
-   Radius: 8px
-   Clear label above input
-   Light border/background
-   Comfortable horizontal padding
-   Secondary gray placeholder
-   Strong focus state using teal

Text areas should be larger and adapt to their purpose.

------------------------------------------------------------------------

# SCREEN DESIGNS

## 11. Create Account

Create a clean registration screen.

### Content

-   Existing BuildEx logo at the top
-   Title: **Create Account**
-   Subtitle: **Join the professional construction network**

Fields:

-   Full Name
-   Email Address
-   Password
-   Confirm Password

Primary yellow button:

**SIGN UP**

Bottom text:

**Already have an account? Sign In**

Keep the screen minimal and focused.

------------------------------------------------------------------------

## 12. Sign In

Use the existing BuildEx logo prominently.

### Fields

-   Username / Email
-   Password

Primary yellow button:

**SIGN IN**

Secondary action:

**Forgot Password?**

Keep the authentication interface premium, minimal, and uncluttered.

------------------------------------------------------------------------

## 13. My Projects

### App Bar

Title:

**My Projects**

Include a search icon/action.

### Header Information

Display the number of assigned projects and a filter action.

### Project Cards

Each card should contain:

-   Project name
-   Location
-   Today's report status
-   Project status badge

Example content:

### Metro Line Phase 2A

Sector 62, Noida\
Today's Report: DRAFT\
Status: ACTIVE

### Downtown Commercial Hub

MG Road, Bengaluru\
Today's Report: PENDING\
Status: ACTIVE

### Riverside Apartments

Kochi\
Today's Report: NOT STARTED\
Status: ON HOLD

Below project cards include quick-access cards for:

-   New Project
-   Analytics

------------------------------------------------------------------------

## 14. Project Hub

The Project Hub is the main dashboard for a selected project.

### Header

Display:

-   Project name
-   Status badge
-   Daily Report Progress
-   Completion percentage
-   Progress bar

### Action Grid

Create a clean 2-column grid containing:

-   Progress Notes
-   Site Photos
-   Labor Attendance
-   Material Log

Each card should use a simple icon, title, and relevant status.

### Issue Card

Add:

**Report Issue / Defect**

Supporting text:

**Flag safety or structural concerns**

### Primary Action

Large yellow bottom CTA:

**SUBMIT DAILY REPORT**

Optional supporting sync information can appear beneath or near the CTA.

------------------------------------------------------------------------

## 15. Daily Progress

### Content

-   Today's Progress
-   Project ID
-   Progress Notes

Use a large multiline text area for progress notes.

Include a character counter.

### Progress Status

Provide selectable status options:

-   On Track
-   Delayed
-   Blocked

Use compact selectable cards or segmented controls.

Add a subtle information message explaining that status updates are
visible to the site supervisor and stakeholders.

### Bottom CTA

**SAVE NOTES**

------------------------------------------------------------------------

## 16. Site Photos

### Header Information

Show the project name.

### Existing Photos

Display previously uploaded photos as clean rounded thumbnails.

### Capture Area

Create a large upload/camera card containing:

-   Camera icon
-   **Tap to Capture**
-   **Add Site Photo**

### Photo Guidelines

Add a subtle information card explaining that site photos should be
clear, well-lit, and captured from useful angles.

### Bottom CTA

**SAVE PHOTOS**

------------------------------------------------------------------------

## 17. Worker Attendance

### Summary

Create three compact statistic cards:

-   TOTAL
-   PRESENT
-   ABSENT

### Search

Add:

**Search workers...**

### Worker Roll Call

Each worker row should contain:

-   Avatar
-   Worker name
-   Job role
-   Attendance state/control

Example workers:

-   Rajesh Kumar --- Mason
-   Vikram Singh --- Helper
-   Sunil Dutt --- Carpenter
-   Anil Sharma --- Mason

### Additional Information

Display compact cards/sections for:

-   SHIFT TIMING
-   CURRENT SITE

### Bottom CTA

**SAVE ATTENDANCE**

------------------------------------------------------------------------

## 18. Material Log

### Form

Fields:

-   Material Type
-   Quantity
-   Unit

Action:

**ADD TO RECORD**

This action can use teal because it is an intermediate action rather
than the final page submission.

### Recent Entries

Display recent materials as cards/list items.

Examples:

**Cement**\
Quantity: 50 Bags

**Coarse Sand**\
Quantity: 200 CFT

### Project / Material Status

Include a compact construction-phase or material-utilization information
card when useful.

### Bottom CTA

**SAVE MATERIAL LOG**

------------------------------------------------------------------------

## 19. Report Issue / Defect

### Header

**New Defect Report**

Add a short supporting description.

### Form Fields

-   Issue Title / Short Summary
-   Severity Level
-   Description
-   Attach Issue Photo

### Severity Options

-   Low
-   Medium
-   High
-   Critical

Use compact visual status options.

High and Critical should be visually noticeable, but avoid making the
entire interface aggressive.

### Photo Upload

Create a large touch-friendly camera/upload area.

### Bottom CTA

**LOG ISSUE**

------------------------------------------------------------------------

## 20. My Tasks

### Header

Title:

**My Tasks**

Subtitle:

**Daily Agenda**

### Task Cards

Each task should contain:

-   Task name
-   Project name
-   Due date
-   Status
-   Progress when applicable
-   Attachment information when applicable

Examples:

### Concreting Pier 45

Project: Metro Line Phase 2A\
Due: Today\
Status: IN PROGRESS\
Progress: 65%

### Rebar Binding Pier 46

Project: Metro Line Phase 2A\
Due: Tomorrow\
Status: PENDING

### Site Safety Walk

Project: Downtown Commercial Hub\
Status: COMPLETED

Use compact status badges.

------------------------------------------------------------------------

## 21. My Team

### Header

Title:

**My Team**

Subtitle:

**On Site Today**

### Team Member Cards

Each member should display:

-   Avatar
-   Name
-   Job role
-   Assigned project
-   Current status

Examples:

### Rajesh Kumar

Mason Lead\
Metro Line Phase 2A\
PRESENT

### Vikram Singh

Helper\
Metro Line Phase 2A\
PRESENT

### Amit Patel

Safety Inspector\
Downtown Commercial Hub\
OFF-SITE

### Productivity

Add an information/statistics card:

**Team Productivity is up by 12%**

Include compact statistics such as:

-   Tasks Done
-   Accidents

------------------------------------------------------------------------

## 22. My Profile

### Profile Header

Display:

-   Profile picture
-   Name
-   Site Engineer role
-   Email
-   EDIT PROFILE button

### Account Settings

Create clean list-style rows for:

-   Notification Settings
-   App Language
-   Help & Support
-   Logout

Use appropriate simple outline icons.

Optional compact activity/profile statistics can appear near the bottom.

------------------------------------------------------------------------

# NAVIGATION

## 23. Bottom Navigation

Use persistent bottom navigation on primary application screens.

### Navigation Items

1.  Projects
2.  Tasks
3.  Team
4.  Profile

### Style

-   Background: Construction Yellow `#FFC800`
-   Clear icons and labels
-   Active item highlighted using a dark teal circular or rounded
    indicator
-   Inactive items remain simple and readable

The navigation must remain visually consistent on every main screen.

------------------------------------------------------------------------

# COMPONENT RULES

## 24. Status Badges

Use compact badges for:

-   ACTIVE
-   PENDING
-   COMPLETED
-   DRAFT
-   ON HOLD
-   IN PROGRESS
-   OFF-SITE
-   DELAYED
-   BLOCKED

Badges should have:

-   Small padding
-   Rounded corners
-   Readable text
-   Subtle contextual background

Do not make status badges oversized.

------------------------------------------------------------------------

## 25. Icons

Use one consistent icon family.

Recommended:

-   Material Icons
-   Lucide
-   Flutter Material Icons

Prefer clean outline icons.

Do not randomly mix different icon styles.

------------------------------------------------------------------------

## 26. Border Radius

Recommended:

-   Inputs: 8px
-   Buttons: 8px
-   Cards: 8--12px
-   Images: 8px
-   Status badges: compact pill/rounded style

Avoid excessive pill-shaped components outside small badges and filters.

------------------------------------------------------------------------

## 27. Responsive Rules

The primary reference width is:

**390px**

Design every screen for 390px first.

Then make it responsive for smaller screens.

### Required

-   `width: 100%`
-   `max-width: 390px`
-   No horizontal scrolling
-   Cards normally use full available width
-   Inputs and buttons adapt to container width
-   Maintain 16px page padding where possible
-   Do not convert the mobile layout into a desktop dashboard

------------------------------------------------------------------------

## 28. UX Principles

Every BuildEx screen should prioritize:

1.  Clarity
2.  Fast navigation
3.  Large touch targets
4.  Readability
5.  Consistency
6.  Quick data entry
7.  Clear status communication
8.  Professional construction-tech appearance
9.  Easy one-handed mobile usage
10. Minimal cognitive load

The app may be used by engineers and workers on construction sites, so
information must be quickly understandable.

------------------------------------------------------------------------

## 29. Visual Restrictions

### Do Not

-   Generate or replace the BuildEx logo
-   Use the reference design logo
-   Create desktop layouts
-   Exceed the 440px base/max application width
-   Use excessive gradients
-   Use heavy shadows
-   Use unnecessary animations
-   Add excessive decoration
-   Overuse large rounded/pill components
-   Mix inconsistent icon styles
-   Overcrowd screens
-   Add unnecessary UI elements
-   Change the core teal + construction-yellow identity without a valid
    reason

------------------------------------------------------------------------

## 30. Overall Visual Direction

The application should communicate:

**Construction + Technology + Professional Project Management**

The finished interface should look like a polished production-ready
construction field-management mobile application.

The style should remain:

-   Modern
-   Minimal
-   Professional
-   Reliable
-   Functional
-   Clean
-   Construction-oriented

------------------------------------------------------------------------

# 31. Final Mandatory Design Rules

These requirements override optional styling decisions:

1.  **Base mobile design width must be 390px.**
2.  **Maximum application content width must be 390px.**
3.  **Always use the project's own existing BuildEx logo.**
4.  **Never generate, redesign, or substitute another logo.**
5.  **Never use the reference design logo as the final logo.**
6.  **Follow the supplied reference design's overall mobile layout and
    visual language.**
7.  **Maintain teal + construction-yellow branding.**
8.  **Keep every screen mobile-first.**
9.  **Use consistent bottom navigation across primary screens.**
10. **Maintain consistent typography, spacing, cards, inputs, buttons,
    and icons.**
11. **Keep the UI minimal and easy to use on a construction site.**
12. **Do not create desktop-style dashboards or layouts.**
13. **Prioritize readability and touch-friendly interactions.**
14. **Keep all content inside the 390px mobile application container.**
15. **The final UI should feel production-ready, modern, and
    professional.**