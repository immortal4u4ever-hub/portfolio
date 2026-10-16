# Arun Philip — resume & portfolio

Self-contained workspace for Arun's resume, portfolio and job search.
Separate from Santhosh's own material in `../portfolio/`.

> **Deliberately standalone.** Nothing here feeds the `jobs` domain
> (`~/dev-stuff/claude-workspace/domains/jobs/`) — not its `profile-sources.md`,
> not its `applications.yaml`, not its memory. Arun's facts live in
> `sources/profile.md` and his applications live in `history.md`, both below.

## Layout

```
arun-philip/
├── README.md                # this file
├── flake.nix                # nix devShell — typst, typstyle, poppler-utils, fonts
├── questions-for-arun.md    # questionnaire to send him — unblocks the draft
├── history.md               # job / application history — the running record
├── sources/
│   └── profile.md           # source of truth for Arun's facts (roles, skills, …)
└── outputs/                 # generated resume / CV / portfolio artefacts
```

## Conventions

- **`sources/profile.md` is the source of truth.** Any fact that lands on the
  resume, CV, portfolio or a cover letter is recorded there first. If it isn't
  in there, it doesn't go on a published surface.
- **`history.md` is append-mostly.** Each application gets an entry; update
  status in place and keep the dated trail rather than rewriting it.
- **`outputs/` is generated.** Don't hand-edit anything in there.

## Toolchain

```sh
nix develop     # typst, typstyle, pdftotext, gnumake, fonts on TYPST_FONT_PATHS
```

## Status

`sources/profile.md` is populated from Arun's LinkedIn PDF export plus an
interview, with confidence markers on every claim (`[LI]` export, `[SR]`
second-hand, `[?]` unresolved).

**Positioning: Data Analyst** — defensible. His LinkedIn is badly maintained
and silent on five years of genuine analyst work (Tableau, pivot tables,
reconciliation, forecasting support) across two US client accounts.

**Blocked on four answers** before a draft is worth writing — whether clients
may be named, what "Golden Bear" really is, whether a dollar figure is rent or
arrears, and two timeline gaps. These need Arun himself:
**send him `questions-for-arun.md`.**
