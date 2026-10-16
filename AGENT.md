# AGENT.md — working in this repo

Instructions for any agent working on Arun Philip's resume and portfolio.
Read this before touching anything.

---

## What this repo is, and whose it is

This is **Arun Philip's** material. He is a **Data Analyst in Trivandrum,
India** — a friend of the repo owner (Santhosh Raju), not Santhosh himself.

⚠️ **Do not conflate the two people.** `../portfolio/` is Santhosh's resume,
CV and website. It is a *reference for tooling conventions only*. Never copy
his facts, roles, skills, metrics or framing into Arun's documents.

⚠️ **This repo is deliberately outside the `jobs` domain.** Nothing here feeds
`~/dev-stuff/claude-workspace/domains/jobs/` — not its `profile-sources.md`,
not its `applications.yaml`, not its memory. This was an explicit instruction.
Arun's facts live in `sources/profile.md`; his applications live in
`history.md`. Do not update domain memory about this work.

## Layout

| Path | Role |
|------|------|
| `sources/profile.md` | **Source of truth.** Every fact, with provenance |
| `history.md` | Application / interview record. Append-mostly |
| `questions-for-arun.md` | Questionnaire sent to him; answers flow into `profile.md` |
| `outputs/` | **Generated.** Gitignored. Never hand-edit |
| `flake.nix` | `nix develop` → typst, typstyle, poppler-utils, gnumake, fonts |

**Primary source document:** `../arun-philip-linkedin.pdf` — his LinkedIn
export. It sits **outside this repo** (not committed). Read it with
`pdftotext -layout` inside `nix develop`.

## The one rule that matters most

> **Never invent a fact, and never infer one.**

`sources/profile.md` is what the resume is *generated from*. A guess there
becomes a false claim on a document a real person sends to employers, and he is
the one who has to defend it in an interview.

**This has already gone wrong once.** An early version of `profile.md` was
seeded with a target role, a years-of-experience figure, a location and a
Python/FastAPI skill list — all back-filled by inference from an unrelated job
posting belonging to a *different* friend. None of it was Arun's. If a fact
didn't come from him or a verifiable source, it does not go in the file.

### Confidence markers — use them on every claim

| Marker | Meaning |
|--------|---------|
| `[LI]` | From the LinkedIn PDF export — strong |
| `[SR]` | Relayed second-hand by Santhosh — **needs Arun's confirmation** |
| `[?]` | Unresolved |
| `[web, verified <date>]` | From web research, with the date checked |

**`[?]` and `[SR]` must never reach a published document unresolved.** A
visible gap is always better than a plausible-looking guess.

## Established facts about positioning

Settled after interview and research — don't relitigate without new evidence:

- **Target: Data Analyst.** Defensible. His LinkedIn is badly maintained and
  silent on ~5 years of genuine analyst work at CoreTech (Tableau dashboards,
  pivot tables, reconciliation, forecasting support) across two US client
  accounts with real dollar scale.
- **He is an Excel/Tableau analyst, not a programmer.** ⚠️ SQL is
  self-described as "minor" / "a little bit". Write it as *"exposure to SQL for
  data extraction"* and **never in a headline skills list** — it is the easiest
  claim for a technical screen to dismantle.
- **He builds reports, dashboards and macros — not tools or systems.** Asked
  what existed because of him that didn't before, the answer was *"None"*.
  Do not use "builds internal tooling" framing.
- **Degree is Mechanical Engineering**, not CS or statistics. The analyst
  framing rests on demonstrated work, not credentials.

## Confidentiality — check before publishing

🚨 His work is **BPO/outsourcing for US clients**, which is usually under NDA.
Until Arun confirms his contract permits it, **do not name clients.** Use
*"a North American semi-trailer leasing and sales company"* and *"a US
residential property-management client"*. The scale figures carry the weight,
not the names, so this costs almost nothing.

Also: **"Golden Bear" is unverified** — possibly CoreTech's internal project
name rather than a client's legal name. It must not be printed until identified.

## Writing conventions

Adopted from `../portfolio/` because the owner prefers them:

- **Bold the quantified part** of any number, percentage or money figure.
- *Italicise* a rare impactful one-line claim. Don't decorate every line — one
  bold span per bullet is usually plenty, italics should be rare.
- **Jargon-free**, and when a term is unavoidable, add a short context phrase
  so a non-expert recruiter can follow.
- Always include the **link** for a publication, talk or certification.
- **Resume ≈ one page** here — ~15 years of history, but the last 5 carry
  nearly all the signal. Older call-centre and data-entry roles compress to a
  single line each. A CV can be longer and comprehensive.
- **Quantify relentlessly.** "Built dashboards" is worth a fraction of
  "dashboards giving **USD 500K–1.5M/month** of sales visibility".

## Workflow

1. **`sources/profile.md` first.** A new fact is recorded there, with a
   confidence marker, before it reaches any output.
2. **Review before commit.** Run the annot CLI **from this repo's directory**
   (the cwd selects the repo):
   ```sh
   cd <this repo>
   annot diff --json \
     --exit-mode "Apply and commit:Apply the changes and make the commit" \
     --exit-mode "Needs changes:Address the annotations, then re-review" \
     --exit-mode "Reject and explain why:Reject the changes, the reason for rejection is given in annotation"
   ```
   Flags before `--`; everything after `--` is a pathspec. Never commit
   without approval.
3. **Conventional Commits** — `type(scope): description`, types `feat`, `fix`,
   `docs`, `chore`, `refactor`, `test`, `build`, `ci`.
4. **`nix develop`** for any Typst or PDF work.

## Known open items

Tracked in full at the end of `sources/profile.md`. The blocking ones are in
`questions-for-arun.md` and need **Arun himself**, not Santhosh:

1. Whether clients may be named (NDA)
2. What "Golden Bear" actually is
3. Whether USD 800–2,000/apartment is rent or arrears
4. Two timeline gaps: 06/2008 → 07/2011 and 07/2020 → 11/2021

## Also in scope

**His LinkedIn needs rewriting, not just the resume.** The headline currently
reads *"Data Entry/Voice Assistance"* and his top three skills are Data Entry,
Office Administration and Compliance Management. A recruiter who reads a
resume about Tableau and forecasting, then opens LinkedIn, believes LinkedIn.
Draft the replacement headline, summary and CoreTech description alongside the
resume so the two agree.

## Decisions not yet made

- **Resume format** — reuse the Typst pipeline from `../portfolio/`
  (recommended) or something lighter. ⚠️ If adopting its `neat-cv` theme, it
  needs a *static* Noto Sans; nixpkgs ships only the variable font, which Typst
  cannot use. `../portfolio/flake.nix` has a `noto-sans-static` derivation to
  copy.
- **Portfolio form** — no GitHub, no site, no public code. So written case
  studies (the two client engagements, anonymised) plus the Atal Tinkering Lab
  Arduino mentoring, rather than a repo showcase.
