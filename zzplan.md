## Elder Shield – Modernization Plan

This plan is organized into **phases** so you can ship improvements incrementally while keeping the app stable and releasable at each step.

---

## Phase 0 – Baseline & Safety (verified)

- **Review existing architecture and flows**
  - Confirm current layers: `core/`, `domain/`, `data/`, `application/`, `presentation/`, `services/`, `platform/`, `l10n/`.
    - `core/`: `design_tokens.dart`, `localization/app_language.dart`.
    - `domain/`: `detector/heuristic_detector.dart`, `detector_config.dart`.
    - `data/`: `database.dart`, `message_repository.dart`.
    - `application/`: `app_providers.dart`, `security_controller.dart`.
    - `presentation/`: onboarding flow (`onboarding_flow.dart` + onboarding screens), `home_screen.dart`, `messages_screen.dart`, `settings_screen.dart`, `shell/main_shell.dart`, `launch_gate.dart`, message warning sheets.
    - `services/`: `settings_service.dart`, `notification_service.dart`.
    - `platform/`: `launch_sms.dart`, `native_event_stream.dart`, `overlay_alerts.dart`.
    - `l10n/`: generated localizations + ARB files.
  - Verify critical flows:
    - **Onboarding**: `ElderShieldApp` decides between `OnboardingFlow` and `LaunchGate` based on `SettingsService.isOnboardingComplete()`.
    - **Permissions**: `HomeScreen._ensurePermissionsAndStart()` requests SMS/phone/notification permissions and surfaces a dialog + app-settings link when permanently denied; Settings has a "Rerun permissions" action.
    - **Security controller**: `SecurityController` listens to `NativeEventStream`, runs `HeuristicDetector`, saves via `MessageRepository`, sets `pendingHighRiskMessageProvider`, and posts notifications; started from `HomeScreen` once permissions are granted.
    - **Messages**: `MessagesScreen` reads from `MessageRepository` (recent/high-risk), shows risk badges, and opens `RiskDetailSheet`; auto-refresh is scoped to the Messages tab.
    - **Settings**: `SettingsScreen` controls theme, language, font scale, sensitivity, trusted contacts, overlay permissions, and history deletion; hooks into `fontScaleProvider`, `themeModeProvider`, and `languageCodeProvider`.
- **Guardrails**
  - App boots via `main.dart` → `ElderShieldApp` with `ProviderScope`; current code builds and runs with Material 3 theming and detector bootstrap.
  - Keep app buildable and releasable after every phase.
  - Prefer small PRs per phase or sub-phase.

Deliverable: Shared understanding of current system; this document checked into git. Phase 0 review completed; safe to proceed to Phase 1.

---

## Phase 1 – Core Theme & Tokens (Foundation)

Goal: Establish a centralized, modern, Material 3–aligned theme + design token system without changing many screens.

- **1.1 Design tokens refinement**
  - Keep `lib/core/design_tokens.dart` but:
    - Ensure spacing follows an 8pt grid (`4, 8, 12, 16, 24, 32, 40`).
    - Confirm radii (12–20) and elevation constants are sufficient.
    - Add explicit animation durations + curves where needed.
- **1.2 Central theme module**
  - Create `lib/core/theme/app_theme.dart` with:
    - `ThemeData AppTheme.light()` and `AppTheme.dark()`.
    - Shared `TextTheme` for headings, titles, and body text.
    - Central configuration for `SnackBarTheme`, `CardTheme`, `FilledButtonTheme`, `InputDecorationTheme`, `ListTileTheme`, and `DividerTheme`.
  - Wire `ElderShieldApp` to use `AppTheme.light()` / `AppTheme.dark()` and keep `ThemeMode` logic via `SettingsService`.
- **1.3 Spacing and layout helpers**
  - Add `lib/core/theme/app_spacing.dart` with named spacing tokens (`AppSpacing.xs`, `AppSpacing.md`, etc.).
  - Start replacing ad-hoc paddings with spacing tokens in a few core widgets (e.g. `HomeScreen`).

Deliverable: Stable app with a single centralized theming system and tokens; visual changes should be subtle but more consistent.

---

## Phase 2 – Component System (Reusable UI)

Goal: Introduce reusable UI components and apply them to 1–2 key screens to validate patterns.

- **2.1 Core components**
  - Create a `lib/widgets/` directory with:
    - `AppScaffold` – wraps `Scaffold` with `SafeArea` and default padding.
    - `AppButton` – primary (and possibly secondary) button variants with min 48dp height and icon+label support.
    - `AppCard` – standard card surface with consistent shape, elevation, padding.
    - `AppHeader` – standardized large title / subtitle header block.
    - `AppEmptyState` / `AppErrorState` (optional) – standardized empty + error views.
- **2.2 Migrate one representative screen**
  - Refactor `HomeScreen` to:
    - Use `AppScaffold` for layout.
    - Use `AppCard` for the protection status block and “today’s risk” summary.
    - Use `AppButton` for the trusted contact call action.
  - Keep business logic and state management as-is to avoid risk.
- **2.3 Apply to a second screen**
  - Refactor `SettingsScreen` (or `MessagesScreen`) to also use `AppScaffold`, `AppCard`, and `AppButton`.

Deliverable: A small, reusable component library with 2 major screens using it, demonstrating the new design language.

---

## Phase 3 – Navigation & Flow Modernization (fresh)

Goal: Clarify all major flows, then modernize navigation in a way that is **simple, explicit, and testable**, without over-complicating the app or breaking existing behavior.

- **3.1 Map the current flows (on paper, then code)**
  - List the key user journeys with their entry points:
    - App launch → onboarding (first run) → home.
    - App launch → home → messages list → message detail / risk sheet.
    - App launch → home → settings → rerun permissions / change sensitivity / theme / language.
  - For each journey, write down:
    - What screen/widget is the entry point?
    - How is navigation triggered today (buttons, bottom nav, dialogs)?
    - Which parameters are passed (e.g., message id, risk level)?

- **3.2 Decide routing strategy (keep it minimal)**
  - Choose a **single primary routing mechanism** for app-level navigation:
    - Option A (simple): stay with `Navigator` + named routes but centralize all route names and arguments.
    - Option B (modern): introduce `go_router` and define a small, explicit route graph.
  - Document the choice in this file so the rest of the phases can assume it.

- **3.3 Centralize route definitions**
  - Create `lib/core/navigation/app_routes.dart`:
    - Define constants for route names / paths for:
      - root / launch gate
      - onboarding
      - shell (bottom-nav container)
      - home, messages, settings
      - message detail / warning sheet (with an `id` parameter)
    - Add small helper types for route arguments if using `Navigator` (e.g. `MessageDetailArgs`).

- **3.4 Create a single navigation entrypoint**
  - In `main.dart` / `ElderShieldApp`, expose exactly one configuration:
    - If using `Navigator`: `MaterialApp` with `onGenerateRoute` and `initialRoute` based on onboarding + permissions state.
    - If using `go_router`: `MaterialApp.router` with a `GoRouter` configured in a dedicated `app_router.dart`.
  - Ensure onboarding vs home vs shell are decided in one place, not scattered.

- **3.5 Migrate critical flows first**
  - Update navigation for:
    - Launch → onboarding → home.
    - Home → messages → message detail / risk sheet.
    - Home → settings → “rerun permissions”.
  - Remove any duplicate or ad-hoc `Navigator.push` calls that point to the same screens; route them through the centralized mechanism.

- **3.6 Add minimal tests for flows**
  - Write widget tests for:
    - First-run launch goes to onboarding, then home after completion.
    - Tapping a message navigates to the message detail / warning view with the correct id.
    - Opening Settings and using “rerun permissions” returns to Home as expected.

Deliverable: A **documented, centralized navigation strategy** with the core user journeys wired through a single routing mechanism and covered by a few high-value widget tests.

---

## Phase 4 – Architecture & Feature Organization

Goal: Move toward a feature-first structure while leveraging existing layers and Riverpod.

- **4.1 Introduce feature folders (non-breaking)**
  - Create `lib/features/` with subfolders:
    - `home/`, `messages/`, `onboarding/`, `settings/`, `shell/`, `security/`.
  - Copy relevant `presentation` files into these folders first; keep original paths temporarily (or export via barrel files) to avoid mass refactor.
- **4.2 Move data & services gradually**
  - Relocate:
    - `data/message_repository.dart` → `features/messages/data/message_repository.dart`.
    - `services/settings_service.dart` → `features/settings/data/settings_service.dart`.
    - `application/security_controller.dart` → `features/security/application/security_controller.dart`.
  - Update imports and `app_providers.dart` accordingly.
- **4.3 Introduce feature controllers**
  - For key screens (`HomeScreen`, `MessagesScreen`, `SettingsScreen`), introduce dedicated Riverpod controllers (e.g. `HomeController`, `MessagesController`) that:
    - Encapsulate async loading (today risk count, trusted contacts, messages).
    - Own any “one-off” logic (tooltips, post-onboarding dialogs) where practical.
  - Gradually move logic from `StatefulWidget` into controllers, simplifying widgets into `ConsumerWidget`s where possible.

Deliverable: Clear feature-based folder structure with controllers and data colocated; easier to extend and test.

---

## Phase 5 – Animations & Microinteractions

Goal: Add subtle, intentional motion that improves clarity and delight without harming accessibility.

- **5.1 Implicit animations**
  - Use `AnimatedContainer`, `AnimatedOpacity`, `AnimatedSwitcher` for:
    - Protection status / risk summary changes on Home.
    - Permission state transitions (“protected” vs “permissions needed”).
    - Showing / hiding tooltips and info banners.
  - Standardize duration (200–350 ms) and curves (`easeInOut`, `easeOutCubic`) via design tokens.
- **5.2 List → detail transitions**
  - Add `Hero` tags for messages / warnings:
    - Wrap list items (or their cards) in `Hero` widgets.
    - Mirror them in the detail / full-screen warning views.
  - Optionally use `animations` package or custom `PageRouteBuilder` for smoother page transitions.
- **5.3 Feedback and loading**
  - Add subtle animations for:
    - Button presses (scale / opacity using `flutter_animate` or implicit animations).
    - Pull-to-refresh completion (snackbar + small fade/scale of updated content).
  - Introduce skeleton loaders (via `shimmer`) for message list and high-risk alerts if network/data fetching becomes noticeable.

Deliverable: Noticeably smoother, more modern feel across key flows, with motion that aids understanding.

---

## Phase 6 – Performance & Quality Pass

Goal: Ensure the app is efficient, maintainable, and aligned with Effective Dart and Flutter best practices.

- **6.1 Const and rebuild minimization**
  - Audit widgets for `const` constructors and `const` children.
  - Ensure expensive widgets are only rebuilt when needed (better use of `Consumer` and `select` in Riverpod if required).
- **6.2 Lists and lazy loading**
  - Confirm `ListView.builder` / `ListView.separated` is used for message lists and other long, scrollable collections.
  - Add keys where necessary for stable list behavior and animations.
- **6.3 Lint cleanup**
  - Run `flutter analyze` and address new / critical lints.
  - Tidy up naming, extract duplicated logic into helpers or widgets, and remove dead code.

Deliverable: Clean `flutter analyze`, minimal unnecessary rebuilds, and snappy UI even on low-end devices.

---

## Phase 7 – Accessibility & Visual Polish

Goal: Ensure the app is comfortable for elderly users and meets modern accessibility expectations.

- **7.1 Accessibility refinements**
  - Review all major screens for:
    - Semantic labels on primary actions (call trusted contact, view warning details, mark safe).
    - Adequate color contrast, especially in dark mode and on custom surfaces.
    - Minimum 48dp tap targets for all interactive elements.
  - Validate with screen reader (TalkBack) and large system font sizes.
- **7.2 Visual hierarchy & consistency**
  - Align heading sizes and weights across screens using `AppTheme` typography.
  - Normalize spacing between sections and cards using `AppSpacing`.
  - Ensure consistent card shapes and button styles across Home, Messages, Onboarding, and Settings.
- **7.3 UX polish**
  - Add or refine:
    - Empty states for messages (e.g., “No suspicious messages yet – you’re safe”).
    - Clear error states where operations can fail.
    - Microcopy to reassure elderly users (e.g., around permissions and trusted contacts).

Deliverable: A cohesive, polished app experience that feels on par with modern, production-grade mobile apps.

---

## Phase 8 – Optional Enhancements / Future Work

These are nice-to-haves once the main modernization is complete:

- Remote configuration & experiments for detector thresholds and UI hints.
- In-app FAQ / education center for scams with localized content.
- Analytics/events (privacy-preserving, ideally on-device or aggregated) to understand feature usage.
- Additional personalization (e.g., text size presets, high-contrast theme).

Deliverable: A backlog of future improvements to prioritize based on user feedback and roadmap.

