# ✦ EventSphere — College Event & Hackathon Platform

> **One Platform. Every College Event.**  
> An end-to-end, enterprise-grade college event, hackathon, and competition management platform built strictly with **Java Servlets (Jakarta Servlet 6.0) + JSP + JDBC + HTML5/CSS3/JavaScript + Apache Tomcat 10 + HttpSession**, adhering to clean MVC architectural principles without bulky third-party dependencies.

---

## 🚀 Live Access & Quick Start

EventSphere is running locally on Apache Tomcat 10:

- **Direct Web Access:** [http://localhost:8080/](http://localhost:8080/)
- **Context URL:** [http://localhost:8080/eventsphere/](http://localhost:8080/eventsphere/)

### 🛠️ One-Click PowerShell Commands

In PowerShell from `C:\Users\Joys\EVENTSPHERE`:

```powershell
# Compile all 41 Java classes with JDK 17
.\build.ps1

# Launch Tomcat server with dual-mode database
.\run.ps1
```

*(Note: EventSphere is a native Java Jakarta Servlet web application, so `npm` or Node.js commands are not used).*

### ☁️ Cloud Deployment (Render)

EventSphere is packaged with a production-ready `Dockerfile` and `render.yaml` Blueprint for Render:

1. Go to [Render Dashboard](https://dashboard.render.com/) and click **New +** > **Web Service**.
2. Connect your GitHub repository: `https://github.com/chn25csd565-bit/eventspherev2`.
3. Select **Docker** as the Runtime (detected automatically).
4. Render will build the container and deploy Tomcat 10 with the embedded database automatically!

*(Note: EventSphere is a stateful Java Jakarta Servlet application on Apache Tomcat, so it is deployed on Render Docker services rather than serverless static hosts like Vercel).*

---

## 🔑 Pre-Seeded Instant Demo Credentials

The platform features a **1-Click Quick Demo Login Switcher** directly on the [Sign In Page](http://localhost:8080/login):

| Role | Email | Password | Name & Title | Core Capabilities |
| :--- | :--- | :--- | :--- | :--- |
| 🛡️ **Admin** | `admin@eventsphere.edu` | `Admin@123` | Dr. Robert Vance (Dean of Student Affairs) | Event CRUD & publishing, judge assignments, check-in attendance desk, campus-wide announcements. |
| ⚖️ **Judge** | `judge.alan@eventsphere.edu` | `Judge@123` | Prof. Alan Turing (Jury Lead, AI Dept) | Assigned queue inspection, live interactive 5-criteria rubric scoring, draft saving, scorecard locks. |
| 🎓 **Student** | `alex.chen@student.edu` | `Student@123` | Alex Chen (CS & Engineering) | Event registration, team code creation & member invites, project submissions (GitHub, demo, slides). |
| 🎓 **Student** | `maya.patel@student.edu` | `Student@123` | Maya Patel (Data Science & AI) | Team member onboarding, collaborative prototype pitching. |
| 🎓 **Student** | `sarah.kim@student.edu` | `Student@123` | Sarah Kim (Software Engineering) | Leader of EcoPulse Analytics team. |

---

## 🌟 Core System Modules & Features

### 1. Public Discovery & Showcase Portal
- **Hero Countdown:** Real-time synchronized countdown clock targeting the flagship sprint (*HackSphere 2026*).
- **Live Event Filtering:** Filter campus events by Category (*Hackathon, Technical, Workshop, Cultural, Gaming*) and Status (*Upcoming, Ongoing, Closed*) with instant keyword search.
- **Previous Events Showcase (2023–2025):** Hall of Fame celebrating past championships (*HackSphere 2024, DesignStorm 2025, CodeClash 2024, RoboQuest 2024, InnoVate 2023*), complete with grand champions, prize amounts, and impact metrics.
- **High-Res Photo Gallery with Lightbox:** Categorized photo vault (*Coding, Jury Pitches, Mentorship, Celebration, Awards*) with an interactive zoom and fullscreen lightbox modal.
- **Dynamic Leaderboard:** Real-time SQL aggregation computing weighted multi-judge scores, top-3 podium highlights (*Gold, Silver, Bronze badges*), and 5-criteria rubric breakdowns.

### 2. Student Builder Portal (`/student/dashboard`)
- **Digital Registration Tickets:** Generates unique alphanumeric ticket IDs (e.g., `REG-HACK-819A2`).
- **Squad Formation Engine:** 
  - Create a new team with auto-generated unique team join codes.
  - Invite classmates via university email with automated invite notifications.
  - Accept or decline incoming invitations.
  - Lock team roster prior to project submission to freeze team composition.
- **Multi-Field Project Submission (`/submit-project`):** Title, problem summary, tech stack tags, GitHub repo link, live prototype demo link, slide deck link, and video walkthrough URL with version tracking (*v1.0, v2.0*).

### 3. Jury Evaluation Portal (`/judge/dashboard`)
- **Assigned Submissions Queue:** Status indicators for *Pending Review*, *Draft Saved*, and *Locked & Submitted*.
- **Interactive 5-Criteria Rubric Scoring (`/judge/evaluate`):**
  1. *Innovation & Creativity* (Weight: 25%)
  2. *Technical Complexity & Execution* (Weight: 30%)
  3. *Design & User Experience* (Weight: 20%)
  4. *Presentation & Pitch* (Weight: 15%)
  5. *Practical Feasibility & Scalability* (Weight: 10%)
- **Dynamic Formula Calculation:** Sliders recalculate the weighted scorecard in real-time as values are adjusted.
- **Qualitative Feedback:** Dedicated recommendations box for constructive student feedback.
- **Draft & Lock Controls:** Save in-progress drafts or permanently lock scores to publish them to the live leaderboard.

### 4. Admin Management Console (`/admin/dashboard`)
- **Real-Time KPI Dashboards:** Total active events, registered students, project submissions, and platform users.
- **Complete Event CRUD:** Create, edit, and delete events with custom capacities, registration deadlines, and prize pools.
- **Judge Assignment Interface:** Link specific jury members to target hackathons and technical contests.
- **Emergency Campus Broadcasts:** Publish announcements with priority tags (*NORMAL, HIGH, URGENT*) displayed across the homepage and user portals.
- **Operations Attendance Desk (`/admin/attendance`):** Real-time check-in tracker with ticket search and check-in rate calculations.

---

## 💾 Resilient Dual-Mode Database Architecture

To ensure the platform is instantly operational without requiring manual database installations:
1. **Primary Enterprise Mode:** Attempts standard JDBC connection to MySQL on port 3306 (`jdbc:mysql://localhost:3306/eventsphere`).
2. **Autonomous Embedded Mode (H2 in MySQL-compatible mode):** If local MySQL is offline, `DBConnection.java` automatically initializes an embedded database in `D:\dev_tools\eventsphere_db\eventsphere`, automatically executing `sql/schema_mysql.sql` and `sql/seed_data.sql`.
3. Zero manual setup needed to evaluate all features, logins, submissions, and leaderboards.

---

## 📁 Repository Structure

```
C:\Users\Joys\EVENTSPHERE\
├── build.ps1                       # Compiles all 41 Java classes using JDK 17
├── run.ps1                         # Configures Tomcat context and launches the server
├── README.md                       # Platform documentation and guides
├── sql\
│   ├── schema_mysql.sql            # Table DDL with indexes, foreign keys, and constraints
│   └── seed_data.sql               # Realistic demo builders, events, submissions, scores, photos
└── src\
    └── main\
        ├── java\com\eventsphere\
        │   ├── config\             # DBConnection (Dual-mode autonomous resilience)
        │   ├── controller\         # Servlets for Auth, Event, Student, Team, Judge, Admin
        │   ├── dao\                # PreparedStatements for all relational models
        │   ├── filter\             # AuthFilter (RBAC security), EncodingFilter (UTF-8)
        │   ├── model\              # POJOs (User, Event, Team, Submission, Score, etc.)
        │   └── util\               # PasswordUtil, ValidationUtil, DateUtil
        └── webapp\
            ├── index.jsp           # Landing page with hero countdown & featured events
            ├── events.jsp          # Event discovery with category pills & status filters
            ├── event-detail.jsp    # Schedule, rules, jury panel & registration modal
            ├── previous-events.jsp # 2023–2025 showcase & masonry photo gallery
            ├── leaderboard.jsp     # Live calculated leaderboard with rank badges
            ├── login.jsp           # Authentication with 1-click role switcher
            ├── register.jsp        # Student registration
            ├── WEB-INF\
            │   ├── web.xml         # Servlet mappings & error page configurations
            │   ├── classes\        # Compiled Java bytecode
            │   ├── lib\            # MySQL driver, H2 driver, Jakarta JSTL
            │   └── views\          # Protected views for student, judge, admin, common
            └── assets\
                ├── css\main.css    # Modern Dark College-Tech design system
                ├── js\main.js      # Countdown timers, live rubric calculator, lightbox
                └── images\         # High-resolution event banners, showcase, avatars
```

---

## 🎨 UI/UX Design System

- **Aesthetic:** Modern College-Tech / Hackathon Dark Mode
- **Palette:** Deep Void Navy (`#0a0e17`), Electric Indigo (`#6366f1`), Neon Cyan (`#06b6d4`), and Translucent Glass Charcoal (`rgba(18, 25, 43, 0.75)` with `backdrop-filter: blur(12px)`).
- **Typography:** Outfit & Plus Jakarta Sans for headings, Inter for high-legibility body copy.
- **Interactions:** Dynamic countdown clocks, card hover lift effects, responsive mobile drawer navigation, and fluid rubric calculation meters.
