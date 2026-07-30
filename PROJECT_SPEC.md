# Tazkiyah OS — Master Project Specification

> This document is the canonical project brief for humans and AI agents. It must be treated as the source of truth for scope, architecture, current status, and the implementation order.

## 1) Project Summary

Tazkiyah OS is a long-term, offline-first, privacy-first operating system for a Muslim daily life workflow. The purpose is to help a user turn correct knowledge into consistent action, then into reflection, then into growth. The system is designed as a personal operating system, not as a social network, not as a content feed, and not as a generic productivity app.

The project is currently implemented as a Flutter mobile application backed by modular Dart packages. The architecture intentionally separates domain logic from UI, so the same core can later support web, desktop, and other surfaces.

## 2) Core Product Principle

The project is built around one loop:

**Identity → Journey → Knowledge → Practice → Reflection**

Everything else must serve this loop.

The system must help the user:
- define identity and mission,
- choose or continue a journey,
- consume one piece of knowledge at a time,
- convert knowledge into practice,
- reflect on what happened,
- repeat with lower friction and higher consistency.

## 3) Non-Goals (Version 1)

Version 1 must **not** become:
- a social network,
- a chat app,
- a content marketplace,
- a gamified competition app,
- a multi-user collaboration platform,
- a feed-driven app,
- an AI-first app,
- an always-online app.

AI is allowed only as an optional helper later, and never as the core of the product.

## 4) Current Repository Status

The repository already contains a working foundation:

### Root / Docs
- `README.md`
- `LICENSE`
- `.gitignore`
- `docs/architecture.md`
- `docs/roadmap.md`
- `docs/philosophy.md`
- `PROJECT_SPEC.md` (this file)
- GitHub Actions CI workflow

### App
- `apps/mobile/` Flutter app
- `apps/mobile/lib/main.dart` is a clean entrypoint only
- `apps/mobile/lib/app.dart` is the app shell
- `apps/mobile/lib/dashboard.dart` is the dashboard view
- `apps/mobile/lib/app_state.dart` is the current snapshot model

### Packages
- `packages/core/`
- `packages/identity/`
- `packages/journey/`
- `packages/knowledge/`
- `packages/practice/`
- `packages/reflection/`

### Tests
- unit tests exist for `core`
- unit tests exist for `identity`
- unit tests exist for `journey`
- unit tests exist for `knowledge`
- unit tests exist for `practice`
- unit tests exist for `reflection`

## 5) Implemented Domains and Responsibilities

### 5.1 Core
Package: `packages/core`

Purpose:
Shared primitives for all other packages.

Implemented concepts:
- `Entity<TId>`
- `ValueObject<T>`
- `Id`
- `Result<T>`
- `Failure`
- `Command`
- `DomainEvent`
- `UseCase<Output, Input>`
- `Repository<T, TId>`

Rules:
- No application-specific logic in core.
- Core must remain small, stable, and reusable.

### 5.2 Identity
Package: `packages/identity`

Purpose:
Represent the user’s identity, mission, and long-term direction.

Implemented concepts:
- `Identity`
- `Mission`
- `IdentityCreated`
- `CreateIdentityUseCase`
- `IdentityRepository`

Behavior:
- The use case creates a new identity object from an input payload.
- The repository abstraction exists for future persistence.

### 5.3 Journey
Package: `packages/journey`

Purpose:
Represent a structured life or learning journey.

Implemented concepts:
- `Journey`
- `JourneyStarted`
- `StartJourneyUseCase`
- `JourneyRepository`

Behavior:
- Journey can be created and marked started.
- The domain is intentionally simple at this stage.

### 5.4 Knowledge
Package: `packages/knowledge`

Purpose:
Represent knowledge cards and reading flows.

Implemented concepts:
- `KnowledgeCard`
- `ReadKnowledgeCardUseCase`

Behavior:
- The use case returns the same card as a successful result.
- The domain is minimal by design for now.

### 5.5 Practice
Package: `packages/practice`

Purpose:
Represent repeated actions and practice completion.

Implemented concepts:
- `Practice`
- `PracticeCompleted`
- `CompletePracticeUseCase`
- `PracticeRepository`

Behavior:
- The use case marks a practice as completed.

### 5.6 Reflection
Package: `packages/reflection`

Purpose:
Represent daily or weekly reflection outputs.

Implemented concepts:
- `Reflection`
- `ReflectionRecorded`
- `RecordReflectionUseCase`
- `ReflectionRepository`

Behavior:
- The use case records a reflection object from input.

## 6) UI / App Architecture

### 6.1 Entry Point
File: `apps/mobile/lib/main.dart`

Current responsibility:
- call `runApp(const TazkiyahApp())`
- nothing else

### 6.2 App Shell
File: `apps/mobile/lib/app.dart`

Current responsibility:
- create `MaterialApp`
- point to `DashboardView`
- no business logic

### 6.3 Dashboard
File: `apps/mobile/lib/dashboard.dart`

Current responsibility:
- render the current skeleton view
- display the current snapshot
- remain UI-only as much as possible

### 6.4 App State
File: `apps/mobile/lib/app_state.dart`

Current responsibility:
- hold a demo snapshot of the five core domains
- act as the temporary bridge before persistence and state management are introduced

## 7) Current Walking Skeleton

The app currently shows a working dashboard for:
- Identity
- Journey
- Knowledge
- Practice
- Reflection

This is a demo skeleton only. It proves that the packages can be consumed together, but it is **not** the final state architecture.

## 8) Planned Architecture Targets

The intended final architecture will move from demo snapshot data toward real application state and persistence.

### Target layers
1. **Domain**
   - core primitives
   - identity
   - journey
   - knowledge
   - practice
   - reflection

2. **Application State**
   - app controller / state model
   - app events
   - UI state transitions

3. **Infrastructure**
   - local persistence
   - repository implementations
   - file/database storage
   - optional sync later

4. **Presentation**
   - dashboard
   - sub-screens
   - navigation
   - responsive UI

## 9) Decisions Already Made

### 9.1 Offline First
The app must work offline by default.

### 9.2 Privacy First
User data belongs to the user. Local-first storage is the default.

### 9.3 Knowledge Before UI
Domain model and content structure come before visual polish.

### 9.4 Practice Before Analytics
The product should help the user act, not just measure them.

### 9.5 Small, Reusable, Testable Modules
Each package must remain small and composable.

### 9.6 No Feature Bloat
Every feature must serve the core loop.

## 10) Existing Files and Their Roles

### Root
- `README.md` — short project intro
- `LICENSE` — MIT license
- `.gitignore` — Flutter/Dart ignore rules
- `PROJECT_SPEC.md` — canonical specification

### Docs
- `docs/architecture.md` — evolving architecture notes
- `docs/roadmap.md` — phase and sprint roadmap
- `docs/philosophy.md` — project principles

### GitHub Actions
- CI workflow runs Flutter analyze and Flutter tests for the mobile app

## 11) Implementation Order

The correct implementation order is:

1. Keep core stable.
2. Keep domain packages stable.
3. Replace demo `AppState` with real state management.
4. Add persistence.
5. Split the dashboard into reusable screens and widgets.
6. Add integration tests.
7. Add repository implementations.
8. Add optional sync later.
9. Add optional AI helper later, but never as the core.

## 12) Rules for Future AI Agents

Any AI agent asked to work on this repository must obey the following:

- Read this file first.
- Do not invent features outside the spec.
- Do not remove existing domain boundaries unless explicitly instructed.
- Do not replace offline-first with cloud-first.
- Do not introduce complex frameworks without a reason.
- Prefer a minimal implementation that is correct and testable.
- If a file already exists, update it with the current SHA; do not recreate it.
- Preserve the current package names and architecture unless a change is explicitly documented here.

## 13) What is already completed

Completed:
- repository initialized
- architecture docs created
- GitHub Actions CI added
- Flutter mobile app bootstrapped
- core package created
- identity package created
- journey package created
- knowledge package created
- practice package created
- reflection package created
- unit tests added for all core domains
- mobile dashboard skeleton created
- app shell simplified
- dashboard state snapshot extracted
- app state snapshot added

## 14) What is still pending

Pending:
- real state management
- persistence layer
- repository implementations
- integration tests
- UI split into smaller reusable screens
- navigation structure
- real app data flow
- optional sync
- optional AI helper

## 15) Short Execution Prompt for Future AI Agents

Build Tazkiyah OS as an offline-first Flutter app using the existing modular Dart packages. Preserve the core loop Identity → Journey → Knowledge → Practice → Reflection. Replace demo snapshot state with a real application state layer and persistence. Keep the UI simple, testable, and domain-driven. Do not add unrelated features.
