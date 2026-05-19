---
version: 1.0.0
last_updated: 2026-05-19
domain: meta
scope: root
---

# How to Use These Plans

This directory contains focused, domain-specific implementation plans for the Stewart Platform Digital Twin project.

## Directory Layout

```
plans/
├── README.md                # This file
├── roadmap.md               # Dual-track progress tracker
├── architecture.md          # System components and tech stack
├── api.md                   # Interface contracts (UDP, Simscape I/O)
├── business-logic.md        # Kinematics, motion profiles, control
├── data-model.md            # Geometry structs, trajectory formats
├── testing.md               # MATLAB Unit Test strategy
└── modules/
    └── report/
        ├── architecture.md  # Report section hierarchy
        ├── business-logic.md # Content rules per section
        └── ui-ux.md         # Formatting and APA style
```

## Plan Query

When implementing a task:

1. **Identify the relevant domain plan** based on the file you're editing:
   - `src/kinematics/` → `business-logic.md`
   - `src/communication/` → `api.md`
   - `src/analysis/` → `testing.md`
   - `project_report.md` or docx sections → `modules/report/`

2. **Check module plans first.** If a file falls under a module scope (e.g., `modules/report/`), read the module plan before the root plan.

3. **Fall back to root plans.** If a module plan doesn't cover a domain, fall back to the root plan for that domain.

4. **If no plan exists**, note the gap in `roadmap.md` and proceed with the spec (`docs/superpowers/specs/2026-05-19-stewart-platform-multi-plan-design.md`).

## Updating Plans

When the spec changes or a new requirement emerges:

1. Update the relevant domain plan first.
2. Update `roadmap.md` to reflect the new task.
3. If a change affects multiple domains, update all relevant plans and note cross-dependencies.

## Legacy Plan

The original monolithic plan lives at `docs/superpowers/plans/2026-05-18-stewart-platform-digital-twin.md`. It is the source of truth for technical task details (Task 1–9). These domain plans decompose and reference it.
