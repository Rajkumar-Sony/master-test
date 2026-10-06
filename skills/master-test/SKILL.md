---
name: master-test
description: Use for comprehensive software testing and QA validation before considering a software change, release, bug fix, refactor, migration, API change, UI change, dependency update, or deployment complete.
---

# Master Test

Apply this skill when validating software quality, correctness, reliability, security, performance, maintainability, and production readiness. It is universal: adapt it to the current project regardless of language, framework, architecture, database, deployment platform, or project size.

Do not assume code is correct because it compiles, builds, looks right, passes one happy path, was AI-generated, has existing passing tests, or was claimed to work. Verify actual behavior.

## Primary Objective

Before considering any feature, bug fix, refactor, migration, API change, database change, configuration change, infrastructure change, frontend change, backend change, or dependency update complete, perform all relevant testing and quality checks.

Look for functional bugs, logic errors, regressions, integration failures, security and authorization problems, data corruption risks, race conditions, performance problems, resource leaks, invalid assumptions, broken edge cases, incorrect API behavior, UI/UX failures, accessibility problems, deployment issues, configuration problems, dependency vulnerabilities, compatibility problems, and production readiness risks.

Never mark a task complete without testing it.

## Non-Negotiable Rules

- Never trust AI-generated code without verification.
- Never remove, disable, skip, weaken, or modify a valid test only to make the build pass.
- Never ignore a failing test, warning, security issue, or failing check.
- Never hardcode values only to satisfy tests.
- Never change correct production behavior only to make an incorrect test pass.
- Never claim something was tested if it was not actually tested.
- Never claim perfect security, correctness, reliability, or coverage unless objectively proven.
- Never invent test results.
- Never silently ignore an area that could not be tested.
- Always report untested areas and remaining risks.
- Preserve existing working behavior unless the requirement explicitly changes it.
- Check the Git diff before completion.
- Do not introduce unrelated changes.
- Do not expose credentials, secrets, tokens, private keys, personal data, or sensitive configuration in source code, logs, test output, screenshots, documentation, or commits.

## Understand the Project First

Before testing, identify the project shape:

- Programming languages, frameworks, frontend and backend technology.
- Databases, caches, queues, file storage, background jobs, webhooks, event-driven components, microservices, cloud services, and external APIs.
- Authentication and authorization model.
- Third-party dependencies.
- Deployment environment, build system, existing CI/CD pipeline.
- Existing test framework, linting/static-analysis tools, and security tools.

Use the most appropriate testing tools already available in the repository whenever possible. Do not force incompatible tools.

## Required Execution Flow

Use this flow where applicable, adapting to project scope and risk:

1. Requirements review.
2. Code review.
3. Compile/build.
4. Lint/static analysis/format verification.
5. Unit tests.
6. Integration tests.
7. Database tests.
8. API tests.
9. Authentication and authorization tests.
10. Security tests.
11. Regression tests.
12. Frontend/component tests.
13. End-to-end tests.
14. Performance and concurrency tests.
15. Manual exploratory testing.
16. Git diff review.
17. Deployment verification, when deployment is in scope.
18. Smoke testing after deployment, when deployment is in scope.
19. Final validation report.

Do not blindly run irrelevant tests. Determine which categories apply to the current project and explain why.

## Build, Compile, Lint, and Static Checks

Run applicable project checks, such as compilation, build, type checking, linting, formatting verification, static code analysis, dependency validation, and configuration validation.

Verify there are no compilation errors, type errors, unresolved imports, missing dependencies, broken configuration, unexpected warnings, dead code introduced, or unnecessary duplicate code. Inspect warnings instead of ignoring them.

## Unit Testing

Write and run focused tests for isolated business logic, services, utility classes, validators, calculations, parsers, formatters, converters, mappers, domain logic, error handling, boundary conditions, and state transitions.

Cover relevant normal, empty, null, minimum, maximum, invalid, duplicate, unexpected, and boundary inputs. Unit tests must be deterministic, independent, repeatable, fast, readable, and focused. Do not over-mock important behavior.

## Integration Testing

Test how components work together, such as frontend to API to backend to database, controller to service to repository, services to queues and workers, application to external API, cache, database, or object storage.

Verify data flow, transactions, configuration, serialization/deserialization, error propagation, dependency interaction, and real database behavior. When practical, use the same database engine used in production rather than only simplified in-memory substitutes.

## API and Contract Testing

Test every relevant API endpoint and method, including success and failure paths. Verify status codes, validation, response structure/schema, required and optional fields, null and empty values, wrong types, invalid IDs, nonexistent resources, duplicate requests, pagination, filtering, sorting, search, headers, content types, and error responses.

When multiple services or clients depend on an API, verify request and response schema compatibility, required and optional field compatibility, enum compatibility, version compatibility, and backward compatibility.

## End-to-End, Regression, Smoke, and Sanity Testing

Test complete real user workflows across important system layers. Do not rely only on mocked backend responses for critical flows.

For every reproducible bug:

1. Reproduce the bug.
2. Understand the root cause.
3. Create a failing regression test.
4. Fix the root cause.
5. Run the test.
6. Run the related suite.
7. Verify no regression.
8. Keep the regression test permanently.

After builds, deployments, major configuration changes, database migrations, or infrastructure updates, smoke-test critical functionality such as startup, login, main page, health endpoint, database connection, core API, and important external integrations. After focused changes, sanity-check the changed feature and closely related features.

## Negative and Edge-Case Testing

Deliberately test invalid behavior. Relevant examples include invalid requests, invalid JSON, missing fields, wrong types, invalid IDs, unsupported operations, invalid or malformed tokens, missing permissions, invalid files, oversized files, duplicate submissions, and unsupported content types.

Test relevant edge cases such as null, empty string, whitespace, zero, negative numbers, very large numbers, extremely long text, Unicode, emoji, special characters, duplicates, missing references, expired data, timezone boundaries, daylight-saving transitions, leap years, empty or huge collections, unusual filenames, and duplicate filenames.

The system must fail safely and predictably.

## Authentication and Authorization Testing

Test authentication thoroughly, including valid login, invalid credentials, logout, session expiration, token expiration, token refresh, revoked token, invalid token, missing token, reused token, password reset, account lockout, and MFA when applicable.

Authentication does not prove authorization. Test role-based access, permission-based access, resource ownership, tenant isolation, organization isolation, admin restrictions, user restrictions, horizontal privilege escalation, and vertical privilege escalation. User A must not access, modify, or delete User B's resources unless explicitly authorized.

## Security Testing

Perform security testing appropriate to the application and follow OWASP guidance where applicable. Check for injection issues, XSS, CSRF, SSRF, XXE, path traversal, directory traversal, IDOR, broken access control, authentication bypass, session fixation, insecure deserialization, open redirect, header injection, host-header attacks, CORS misconfiguration, clickjacking, unsafe uploads, unrestricted file access, information disclosure, debug endpoints, sensitive error messages, weak cryptography, hardcoded secrets, exposed credentials, insecure cookies, missing security headers, missing rate limiting, excessive API permissions, dependency vulnerabilities, and supply-chain risks.

For security-sensitive, internet-facing, production, enterprise, financial, healthcare, authentication-heavy, or sensitive-data applications, perform authorized penetration testing before production release. Never perform destructive testing against production unless explicitly authorized and safely planned.

## Data, Migration, Concurrency, and Idempotency Testing

When data persistence exists, test CRUD operations, constraints, transactions, rollbacks, isolation levels, locking, concurrent updates, pagination, sorting, filtering, search, index usage, query performance, migrations, rollback migrations, seed data, and referential integrity.

Check for N+1 queries, full-table scans, missing indexes, duplicate queries, excessive queries, Cartesian joins, incorrect fetch strategies, slow joins, and unbounded queries.

For schema or data migrations, verify clean-database success, existing-database success, data preservation, constraint validity, application compatibility, and rollback strategy where practical.

Test simultaneous activity, repeated requests, duplicate event processing, multi-tab edits, double clicks, and worker concurrency. Detect race conditions, lost updates, duplicates, deadlocks, incorrect locking, corruption, and inconsistent state.

For retryable or repeatable operations, verify duplicate execution does not unintentionally create duplicates, charge twice, send multiple notifications, corrupt state, or process the same event twice.

## Failure, Retry, and Resilience Testing

Intentionally force relevant failures such as database, cache, queue, third-party API, DNS, timeout, connection reset, invalid response, partial response, malformed response, rate limit, disk full, storage unavailable, and file corruption.

Verify the application avoids unnecessary crashes, handles errors gracefully, returns useful error responses, does not expose sensitive information, retries only retriable failures safely, and does not endlessly retry non-retriable failures.

Where retries, circuit breakers, timeouts, fallback logic, or bulkheads exist, verify retry count, backoff behavior, exception rules, circuit breaker opening/recovery, timeout behavior, and fallback behavior. Prevent retry storms.

## Performance, Load, Stress, Soak, and Resource Testing

Measure important performance characteristics using realistic workloads: response time, throughput, CPU, memory, database latency, cache behavior, file processing speed, queue processing speed, and large dataset behavior.

Use suitable tools such as k6, JMeter, Gatling, Locust, or project-specific equivalents where appropriate. Test normal and peak traffic, then stress beyond expected load when useful. For long-running systems, run soak/endurance checks to detect memory, connection, thread, file descriptor, temporary file, cache, disk, and other resource leaks.

Do not optimize blindly. Identify actual bottlenecks.

## Frontend, Responsive, Browser, Accessibility, and Localization Testing

For frontend work, test rendering, loading, success, empty, error, and disabled states; form validation; buttons; navigation; routing; search; filtering; pagination; sorting; modals; dialogs; dropdowns; forms; keyboard interaction; and API failure behavior. The UI must not silently fail.

Where applicable, test desktop, laptop, tablet, mobile, portrait, landscape, and supported browsers such as Chrome, Edge, Firefox, and Safari.

Check accessibility requirements: keyboard navigation, focus order, visible focus, labels, ARIA usage, semantic HTML, screen-reader compatibility, form errors, color contrast, alternative text, accessible buttons, and accessible dialogs. Aim for applicable WCAG requirements.

When localization or internationalization matters, test multiple languages, Unicode, long translated text, right-to-left languages, date formats, number formats, currency formats, timezones, and character encoding.

Where time matters, test UTC, local timezone, timezone conversion, DST, date/month/year boundaries, leap years, expiration times, and scheduled tasks.

## Caches, Queues, Webhooks, External APIs, and Files

When caching exists, test hits, misses, expiration, invalidation, stale cache behavior, cache outage behavior, concurrent updates, and cache/database consistency.

When using queues or event systems, test publishing, consumption, duplicate events, out-of-order events, failed consumers, consumer retry, dead-letter queues, poison messages, queue unavailability, reconnection, and at-least-once delivery behavior. Verify idempotency.

When using webhooks, test valid signatures, invalid signatures, missing signatures, duplicate webhook, delayed webhook, out-of-order webhook, retry, replay attack, invalid payload, and unknown event type.

When using external APIs, test success, authentication failure, authorization failure, timeout, rate limiting, invalid response, partial response, schema changes, service unavailable, and network interruption.

For uploads/downloads, test valid files, invalid extensions, incorrect MIME type, empty files, large files, corrupted files, duplicate filenames, Unicode filenames, special characters, interrupted transfers, unauthorized downloads, and path traversal attempts.

## Logging, Observability, Configuration, Dependencies, Containers, and Infrastructure

Verify logs contain enough debugging information without exposing passwords, access tokens, refresh tokens, API secrets, private keys, full credit card details, or sensitive personal data. Use appropriate log levels.

Where observability exists, verify logs, metrics, traces, health checks, readiness checks, liveness checks, and alerting.

Verify configuration across local, development, testing, staging, and production as relevant. Check required environment variables, defaults, missing or invalid variables, secret handling, feature flags, URLs, ports, database configuration, and CORS configuration.

Check vulnerable, outdated, conflicting, unused, unsupported, or license-problematic dependencies. Do not upgrade dependencies blindly. After dependency updates, run regression testing.

Where tools are available, run SAST, secret scanning, dependency scanning, vulnerability scanning, and similar static security analysis.

When Docker or containers are used, verify image build, startup, required files, no baked secrets, correct exposed ports, health checks, non-root runtime where practical, base image vulnerabilities, and reasonable image size.

When infrastructure is part of the project, verify environment configuration, networking, firewall/security groups, IAM permissions, storage, database connectivity, DNS, SSL/TLS, load balancer, health checks, secrets, backup configuration, and least privilege.

## Deployment, Rollback, Backup, and Disaster Recovery

Before deployment, run the full build, relevant automated tests, configuration validation, migration validation, secrets checks, and deployment script checks.

After deployment, run smoke tests, check health, logs, and metrics, and test important endpoints and critical user flows.

Where possible, verify rollback behavior, database compatibility, previous-version startup, and data safety.

For systems with important persistent data, verify backups are created, readable, restorable, and produce valid restored data. A backup that has never been restored is not fully proven.

For critical systems, test disaster recovery scenarios such as server failure, database failure, region failure, storage failure, network failure, and accidental deletion.

## Business Logic, Data Integrity, Manual Testing, Coverage, Mutation, and Review

Technical correctness is not enough. Verify actual business rules, calculations, ownership rules, workflow transitions, limits, validation rules, permission behavior, and state transitions.

Verify no unintended duplicates, orphan records, invalid references, partial writes, inconsistent state, or silent data loss.

After automated testing, manually use the software as a real user. Try rapid clicking, double-clicking, refreshing during operations, opening multiple tabs, browser back/forward, losing and restoring internet, submitting incomplete forms, repeating requests, leaving pages during processing, and closing/reopening the application.

Measure coverage where supported, but do not treat coverage percentage as proof of quality. Focus coverage on critical logic, security logic, business rules, permissions, error paths, and important integrations. Avoid meaningless tests written only to increase coverage.

For critical business logic, consider mutation testing where practical to verify whether tests detect broken logic.

Review changed code for correctness, simplicity, maintainability, security, error handling, performance, naming, duplication, dead code, unnecessary complexity, resource handling, transaction behavior, and thread safety.

## Git Diff Review

Before declaring completion, inspect the complete Git diff. Verify only intended files changed; no accidental deletions, secrets, temporary debug code, commented-out production code, unnecessary formatting changes, generated files accidentally committed, or unrelated refactoring are present.

## Required Testing Level by Change Type

- Small code change: build, compile, lint, unit tests, and relevant regression tests.
- Backend feature: unit, integration, API, database, authorization, and regression tests.
- Frontend feature: unit/component, integration, E2E, responsive, accessibility, and regression tests.
- Authentication/security feature: unit, integration, authentication, authorization, security, penetration testing where appropriate, E2E, and regression tests.
- Database change: integration, migration, transaction, data integrity, performance/query, and regression tests.
- Microservices: unit, integration, contract, API, event/queue, resilience, and E2E tests.
- Production release: full regression, E2E, security, penetration testing where required, performance, load, smoke, and deployment verification.

## AI-Generated Code Rules

When code is generated or modified using AI:

- Assume it may contain subtle mistakes.
- Verify important APIs, methods, configuration, library calls, and framework behavior against the actual dependency versions.
- Do not accept invented methods, classes, configuration keys, annotations, or CLI commands.
- Check imports, dependencies, error handling, thread safety, database behavior, authentication, authorization, performance implications, generated SQL, external API assumptions, project architecture, conventions, and unnecessary complexity.
- Do not rewrite working modules unnecessarily.
- Run tests after every meaningful AI-generated change.

## Checkpoint Rule

Before each meaningful Git checkpoint or commit, the build, relevant tests, regression tests, and lint/static checks must pass where configured; the Git diff must be reviewed; no secrets or temporary debug code may remain. Do not recommend committing broken code unless explicitly creating a temporary work-in-progress commit.

## Definition of Done

A task is complete only when all relevant conditions are satisfied: requirements are implemented, the application builds, no known compile errors exist, relevant tests pass, critical flows pass E2E testing where applicable, authentication and authorization work correctly, security checks pass to an acceptable level, database behavior is correct, edge cases and failure scenarios are handled, performance is acceptable for expected usage, existing functionality has not regressed, sensitive information is not exposed, the Git diff has been reviewed, no known critical bug is hidden, and remaining risks are documented.

## Final Test Report

After testing, provide this structured report. Mark each testing category as `PASS`, `FAIL`, `PARTIAL`, `NOT APPLICABLE`, or `NOT TESTED`.

```markdown
# Testing Summary

## Build Status
- Status:
- Commands executed:
- Errors:
- Warnings:

## Testing Performed
- Unit Testing:
- Integration Testing:
- API Testing:
- Contract Testing:
- E2E Testing:
- Regression Testing:
- Security Testing:
- Penetration Testing:
- Database Testing:
- Performance Testing:
- Load Testing:
- Concurrency Testing:
- Smoke Testing:
- Manual Testing:

## Tests Added
List new automated tests.

## Tests Executed
List executed test suites and important scenarios.

## Passed
List successful checks.

## Failed
List failed tests and exact reasons.

## Bugs Found
For each bug include:
- Problem
- Root cause
- Severity
- Fix
- Test added

## Security Findings
For each finding include:
- Vulnerability
- Severity
- Impact
- Fix
- Verification status

## Performance Findings
For each finding include:
- Scenario
- Result
- Bottleneck
- Recommendation

## Regression Status
State whether existing functionality remains working.

## Untested Areas
Clearly list anything that could not be tested.

## Remaining Risks
List known risks.

## Production Readiness
Give one final status:

READY

READY WITH MINOR RISKS

NOT READY

BLOCKED

Explain the reason.
```

Do not finish with only "Tests passed." Provide evidence. A successful build, unit testing alone, manual testing alone, E2E testing alone, or security scanning alone is not enough. Always test actual behavior, protect existing functionality, verify security boundaries, test failure scenarios, and clearly report what was and was not validated.
