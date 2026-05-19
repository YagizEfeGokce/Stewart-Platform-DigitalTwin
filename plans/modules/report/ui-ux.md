---
version: 1.0.0
last_updated: 2026-05-19
domain: ui-ux
scope: module
module: report
---

# Report UI/UX Plan: Formatting and Style

## Goal

Define the visual and typographic rules for the ENS003 Project Report.

## Document Format

- **Source template**: `ENS003 Project Report Template (taslak) son hali 999999999.-1.docx`
- **Final format**: `.docx` per course requirements
- **Version control**: `project_report.md` (Markdown export for git tracking)

## Typography

- **Font**: Use the template's default font (likely Times New Roman or Arial). Do not change unless specified.
- **Size**: 12 pt for body text, 14 pt for headings, 10 pt for table content.
- **Line spacing**: 1.5 for body text; single for tables.
- **Margins**: Follow template defaults (likely 2.5 cm all sides).

## Section Numbering

- Main sections use bold headings without numbers (e.g., **SUMMARY**).
- Sub-sections use numbered headings (e.g., `1.1. Importance of the Topic...`).
- Appendix sections use bold labels (e.g., **Mechanical Engineering Team**).

## Tables

### Work – Time Schedule
- Columns: Work No, Name and goals, Responsible Student, Time Range, Success Criteria
- Rows: expandable; use 5 work packages as baseline.
- Borders: full grid, header row shaded or bold.

### Risk Management Table
- Columns: Work No, Major Risks, Risk Management (Plan B)
- Rows: 2 risks minimum; expandable.

### Research Opportunities Table
- Columns: Infrastructure/Equipment Type and Model, Purpose of Use
- Rows: list all lab equipment used.

### Expected Implications Table
- Columns: Implication Types, Expected Outputs/Results/Findings/Impacts
- Rows: Scientific/Academic, Economic/Commercial/Social, Training Researchers.

### Evaluation Form
- **Learning Outcomes Matrix**: 5 outcomes × 5 sections; checkboxes or marks.
- **Student Scoring Grid**: 5 students × 5 sections (20 points each); leave blank for instructor.

## Citations and References

- **Style**: APA 7th edition.
- **In-text**: Author (Year) or (Author, Year).
- **Reference list**: Hanging indent, alphabetical by first author surname.
- **Current references** in template:
  - Aytaç Adali et al. (2022)
  - Savaş et al. (2021)
  - Taherdoost & Madanchian (2023)
  - Topcu et al. (2021)
- **Potential additions** (to be added during implementation):
  - Stewart platform kinematics classic papers (e.g., Stewart 1965, if applicable)
  - Digital twin in health sciences recent papers
  - MATLAB Simscape Multibody documentation citations

## Figures and Diagrams

- **Numbering**: "Figure 1.", "Figure 2." etc., with descriptive captions below.
- **Placement**: Inline with text, centered, max width = text width.
- **Source files**: Use images from `extracted/` directory:
  - `Stewart Platform.png`
  - `Actuator.png`
  - `Adams Sine Wave Motion.png`
  - `Adams Linear Motion.png`

## Page Layout

- **Header**: none required by template.
- **Footer**: page numbers, centered, starting from page 2 (if template requires).
- **Title page**: project name, course, instructor, team members — as per template.

## Accessibility

- All tables must have header rows.
- Image alt text in Word (Right-click image → Edit Alt Text).
- Color contrast: if using colored table cells, ensure WCAG 2.1 AA compliance (contrast ratio ≥ 4.5:1).

## Conversion Workflow

Since the canonical source is Markdown (`project_report.md`) but submission is `.docx`:

1. Edit content in `project_report.md` (git-tracked).
2. Use `pandoc` or manual copy-paste to update `.docx`.
3. Re-apply formatting (tables, bold headings) in Word after each Markdown update.
4. Save `.docx` with version suffix if needed (e.g., `ENS003_Report_v2.docx`).

### Pandoc Command
```bash
pandoc project_report.md -o ENS003_Report.docx --reference-doc="ENS003 Project Report Template (taslak) son hali 999999999.-1.docx"
```
*Note: Pandoc may not perfectly preserve complex table formatting; manual review required.*
