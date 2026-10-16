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
├── README.md            # this file
├── history.md           # job / application history — the running record
├── sources/
│   └── profile.md       # source of truth for Arun's facts (roles, skills, …)
└── outputs/             # generated resume / CV / portfolio artefacts
```

## Conventions

- **`sources/profile.md` is the source of truth.** Any fact that lands on the
  resume, CV, portfolio or a cover letter is recorded there first. If it isn't
  in there, it doesn't go on a published surface.
- **`history.md` is append-mostly.** Each application gets an entry; update
  status in place and keep the dated trail rather than rewriting it.
- **`outputs/` is generated.** Don't hand-edit anything in there.

## Status

Scaffolding only. **Blocked on Arun's actual CV content** — see
`sources/profile.md`, which is a questionnaire until it's filled in.
