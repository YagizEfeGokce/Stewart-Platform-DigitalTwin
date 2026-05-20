---
version: 1.0.0
last_updated: 2026-05-19
domain: roadmap
scope: root
---

# Project Roadmap

## Completed
- [x] 2026-05-18: Initial design and monolithic plan written
- [x] 2026-05-18: Mechanical Engineering sub-team sections in report completed
- [x] 2026-05-19: Multi-plan design approved and spec written
- [x] 2026-05-19: Domain-specific plans generated in `plans/`

## Parallel Development Tracks

### Track A: MATLAB Implementation — Owner: Yağız Efe Gökçe
All MATLAB coding, Simscape modeling, and analysis scripts.

### Track B: Report Writing — Owner: Elif Eylül Kavrazlı
All report sections, tables, and Computer/Software Engineering sub-team documentation.

Tracks are designed to minimize blocking:
- Elif drafts report sections from existing plans/specs without waiting for MATLAB completion.
- Yağız implements MATLAB code independently.
- Only Findings and Conclusion require MATLAB completion; Elif holds these until Yağız finishes Tasks 1–9.

## In Progress

### Track A (Yağız)
- [ ] **Task 1**: Project setup (`scripts/setupProject.m`, `src/config/platformGeometry.m`)
  - Blocked on: MATLAB environment availability
- [ ] **Task 2**: Import SolidWorks CAD to Simscape (`src/modeling/importCad.m`)
  - Blocked on: MATLAB R2023b+ license

### Track B (Elif)
- [ ] **Section 1**: General Information (team, course, instructor) — **NO BLOCKER**
- [ ] **Section 2**: Summary (project aim, current stage, keywords) — **NO BLOCKER**
- [ ] **Section 3**: Originality (research question, hypothesis) — **NO BLOCKER**
- [ ] **Section 4**: Purpose and Goals (measurable objectives) — **NO BLOCKER**
- [ ] **Section 6**: Project Management (Work-Time Schedule, Risk Management, Research Opportunities) — **NO BLOCKER**
- [ ] **Section 7**: Implications (scientific, economic, training) — **NO BLOCKER**
- [ ] **Section 10a**: Appendices — Sub-Team Overview, Literature Survey, Constraints, Requirements — **NO BLOCKER**

## Pending

### Track A (Yağız) — MATLAB Implementation
- [ ] **Task 3**: Inverse Kinematics library (`src/kinematics/`)
- [ ] **Task 4**: Forward Kinematics for validation (`src/kinematics/`)
- [ ] **Task 5**: Motion Profile Generator (`src/profiles/`)
- [ ] **Task 6**: Augment Simscape model with actuators & sensors (`src/modeling/`)
- [ ] **Task 7**: Control layer & real-time sync bridge (`src/control/`, `src/communication/`)
- [ ] **Task 8**: Logging & RMSE analysis (`src/analysis/`)
- [ ] **Task 9**: Full pipeline integration test & verification script

### Track B (Elif) — Report Writing
- [ ] **Section 5**: Methodology (Computer/Software Engineering perspective) — **Blocked on**: Yağız Task 2–3 for accurate Simscape/IK descriptions
- [ ] **Section 8**: Findings (update with technical progress) — **Blocked on**: Yağız Task 9 completion
- [ ] **Section 9**: Conclusion (update with final status) — **Blocked on**: Section 8 completion
- [ ] **Section 10b**: Appendices — Sub-Team Methodology, System Integration — **Blocked on**: Yağız Task 3–7 for accurate technical descriptions
- [ ] **Section 11**: References (APA-style) — **NO BLOCKER** (add digital twin references as work progresses)
- [ ] **Section 12**: Evaluation Form (learning outcomes matrix) — **NO BLOCKER**

## Last Session
- Date: 2026-05-19
- Left off: Multi-plan design approved; task delegation assigned (Yağız → MATLAB, Elif → Report)
- Next: Yağız begins Task 1 (MATLAB setup); Elif begins Section 1 (General Information) and independent report sections
