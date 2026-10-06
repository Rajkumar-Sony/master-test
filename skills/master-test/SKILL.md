---
name: master-test
description: Use for comprehensive software testing and QA validation before considering a software change, release, bug fix, refactor, migration, API change, UI change, dependency update, or deployment complete.
---

# UNIVERSAL SOFTWARE TESTING AND QUALITY ASSURANCE PROMPT

You are responsible for validating the quality, correctness, reliability, security, performance, maintainability, and production readiness of the current software project.

This prompt must be applied to ANY project regardless of programming language, framework, architecture, database, deployment platform, or project size.

Do not assume code is correct just because:
- It compiles.
- It builds successfully.
- The UI looks correct.
- One happy-path scenario works.
- AI generated the code.
- Existing tests pass.
- The developer says the feature works.

You must verify actual behavior.

==================================================
PRIMARY OBJECTIVE
==================================================

Before considering any feature, bug fix, refactor, migration, API change, database change, configuration change, infrastructure change, frontend change, backend change, or dependency update complete, perform all relevant testing and quality checks.

The goal is to detect:

- Functional bugs
- Logic errors
- Regression issues
- Integration failures
- Security vulnerabilities
- Authorization problems
- Data corruption risks
- Race conditions
- Performance problems
- Resource leaks
- Invalid assumptions
- Broken edge cases
- Incorrect API behavior
- UI/UX failures
- Accessibility problems
- Deployment issues
- Configuration problems
- Dependency vulnerabilities
- Compatibility problems
- Production readiness risks

Never mark a task complete without testing it.

==================================================
NON-NEGOTIABLE RULES
==================================================

1. Never trust AI-generated code without verification.

2. Never remove, disable, skip, weaken, or modify a valid test only to make the build pass.

3. Never ignore a failing test.

4. Never hide errors, warnings, security issues, or failing checks.

5. Never hardcode values only to satisfy tests.

6. Never change correct production behavior only to make an incorrect test pass.

7. Never claim something was tested if it was not actually tested.

8. Never claim 100% security, correctness, reliability, or coverage unless objectively proven.

9. Never invent test results.

10. Never silently ignore an area that could not be tested.

11. Always report untested areas and remaining risks.

12. Preserve existing working behavior unless the requirement explicitly changes it.

13. Check the Git diff before completion.

14. Do not introduce unrelated changes.

15. Do not expose credentials, secrets, tokens, private keys, personal data, or sensitive configuration in:
- source code
- logs
- test output
- screenshots
- documentation
- commits

==================================================
STEP 1: UNDERSTAND THE PROJECT FIRST
==================================================

Before testing, analyze the project and identify:

- Programming languages
- Frameworks
- Frontend technology
- Backend technology
- Databases
- Caches
- Queues
- External APIs
- Authentication mechanism
- Authorization model
- File storage
- Cloud services
- Background jobs
- Webhooks
- Event-driven components
- Microservices
- Third-party dependencies
- Deployment environment
- Build system
- Existing test framework
- Existing CI/CD pipeline
- Existing linting/static-analysis tools
- Existing security tools

Do not force tools that are incompatible with the current project.

Use the most appropriate testing tools already available in the repository whenever possible.

==================================================
STEP 2: BUILD, COMPILE, LINT, AND STATIC CHECKS
==================================================

Run all applicable project checks.

Examples include:

- Compilation
- Build
- Type checking
- Linting
- Formatting verification
- Static code analysis
- Dependency validation
- Configuration validation

Verify:

- No compilation errors
- No type errors
- No unresolved imports
- No missing dependencies
- No broken configuration
- No unexpected warnings
- No dead code introduced
- No duplicate code unnecessarily introduced

If warnings exist, inspect them instead of ignoring them.

==================================================
STEP 3: UNIT TESTING
==================================================

Write and run unit tests for isolated logic.

Unit testing must cover relevant:

- Business logic
- Services
- Utility classes
- Validators
- Calculations
- Parsers
- Formatters
- Converters
- Mappers
- Domain logic
- Error handling
- Boundary conditions
- State transitions

Test:

- Normal input
- Empty input
- Null input where applicable
- Minimum values
- Maximum values
- Invalid input
- Duplicate input
- Unexpected input
- Boundary values

Unit tests must be:

- Deterministic
- Independent
- Repeatable
- Fast
- Readable
- Focused

Do not over-mock important behavior.

==================================================
STEP 4: INTEGRATION TESTING
==================================================

Test how components work together.

Examples:

Frontend
→ API
→ Backend
→ Database

Controller
→ Service
→ Repository
→ Database

Service A
→ Message Queue
→ Worker
→ Database

Application
→ External API

Application
→ Cache
→ Database

Application
→ Object Storage

Verify:

- Data flows correctly
- Transactions behave correctly
- Configuration works
- Serialization/deserialization works
- Error propagation works
- Dependencies interact correctly
- Real database behavior matches expectations

When practical, use the same database engine used in production instead of relying only on simplified in-memory substitutes.

==================================================
STEP 5: API TESTING
==================================================

Test every relevant API endpoint.

Test HTTP methods such as:

- GET
- POST
- PUT
- PATCH
- DELETE

Verify appropriate status codes including:

- 200
- 201
- 202
- 204
- 400
- 401
- 403
- 404
- 405
- 409
- 415
- 422
- 429
- 500
- 502
- 503
- 504

where relevant.

Verify:

- Request validation
- Response structure
- Response schema
- Required fields
- Optional fields
- Null values
- Empty values
- Wrong types
- Invalid IDs
- Nonexistent resources
- Duplicate requests
- Pagination
- Filtering
- Sorting
- Search
- Headers
- Content types
- Error responses

Do not only test successful responses.

==================================================
STEP 6: CONTRACT TESTING
==================================================

When multiple services or clients depend on an API, test contracts.

Verify:

- Request schema compatibility
- Response schema compatibility
- Required field compatibility
- Optional field compatibility
- Enum compatibility
- Version compatibility
- Backward compatibility

Prevent one service from silently breaking another service.

==================================================
STEP 7: END-TO-END TESTING
==================================================

Test complete real user workflows.

Examples:

Register
→ Verify account
→ Login
→ Perform action
→ Logout

Login
→ Search
→ Open item
→ Update item
→ Save
→ Verify persisted data

Upload
→ Process
→ Store
→ Download

Payment
→ Confirmation
→ Database update
→ Notification

E2E tests should validate actual user behavior across all important system layers.

Use appropriate tools such as:

- Playwright
- Cypress
- Selenium
- Appium
- project-specific equivalents

Do not rely only on mocked backend responses for critical E2E flows.

==================================================
STEP 8: REGRESSION TESTING
==================================================

Every new change must be checked against existing functionality.

Whenever a bug is found:

1. Reproduce the bug.
2. Write a failing regression test.
3. Fix the bug.
4. Verify the test passes.
5. Keep the regression test permanently.

Do not allow the same bug to silently return later.

Run existing relevant tests after every meaningful change.

==================================================
STEP 9: SMOKE TESTING
==================================================

Perform a fast health check after:

- Build
- Deployment
- Major configuration change
- Database migration
- Infrastructure update

Verify critical functionality such as:

- Application starts
- Login works
- Main page loads
- Health endpoint works
- Database connection works
- Core API responds
- Important external integrations are reachable

==================================================
STEP 10: SANITY TESTING
==================================================

After a focused change or bug fix, verify:

- The changed feature works.
- Closely related features still work.
- No obvious side effects were introduced.

==================================================
STEP 11: NEGATIVE TESTING
==================================================

Deliberately test invalid behavior.

Examples:

- Invalid request
- Invalid JSON
- Missing fields
- Wrong field types
- Invalid ID
- Unsupported operation
- Invalid token
- Malformed token
- Missing permissions
- Invalid file
- Oversized file
- Duplicate submission
- Unsupported content type

The system must fail safely and predictably.

==================================================
STEP 12: EDGE-CASE TESTING
==================================================

Test important edge cases.

Examples:

- null
- empty string
- whitespace
- zero
- negative number
- very large number
- extremely long text
- Unicode
- emoji
- special characters
- duplicate records
- missing references
- expired data
- timezone boundaries
- daylight-saving transitions
- leap years
- empty collections
- huge collections
- unusual file names
- duplicate filenames

Only apply relevant cases to the project.

==================================================
STEP 13: AUTHENTICATION TESTING
==================================================

Test authentication thoroughly.

Verify:

- Valid login
- Invalid credentials
- Logout
- Session expiration
- Token expiration
- Token refresh
- Revoked token
- Invalid token
- Missing token
- Reused token
- Password reset
- Account lockout if applicable
- MFA if applicable

Ensure secure session handling.

==================================================
STEP 14: AUTHORIZATION TESTING
==================================================

Authentication does NOT automatically mean authorization is correct.

Test:

- Role-based access
- Permission-based access
- Resource ownership
- Tenant isolation
- Organization isolation
- Admin restrictions
- User restrictions

Critical example:

User A must not be able to access, modify, or delete User B's resources unless explicitly authorized.

Test horizontal and vertical privilege escalation.

==================================================
STEP 15: SECURITY TESTING
==================================================

Perform security testing appropriate to the application.

Check for:

- SQL injection
- NoSQL injection
- Command injection
- Code injection
- XSS
- CSRF
- SSRF
- XXE
- Path traversal
- Directory traversal
- IDOR
- Broken access control
- Authentication bypass
- Session fixation
- Insecure deserialization
- Open redirect
- Header injection
- Host-header attacks
- CORS misconfiguration
- Clickjacking
- Unsafe file uploads
- Unrestricted file access
- Information disclosure
- Debug endpoints
- Sensitive error messages
- Weak cryptography
- Hardcoded secrets
- Exposed credentials
- Insecure cookies
- Missing security headers
- Missing rate limiting
- Excessive API permissions
- Dependency vulnerabilities
- Supply-chain risks

Follow OWASP guidance where applicable.

==================================================
STEP 16: PENETRATION TESTING
==================================================

For security-sensitive, internet-facing, production, enterprise, financial, healthcare, authentication-heavy, or sensitive-data applications, perform penetration testing before production release.

Penetration testing should verify realistic attack paths including:

- Authentication bypass
- Authorization bypass
- Privilege escalation
- IDOR
- Injection
- Session abuse
- Token abuse
- File upload abuse
- API abuse
- Data exposure
- Rate-limit bypass
- Misconfiguration
- Business-logic abuse

Penetration testing must be authorized and performed only against systems where testing permission exists.

Do not perform destructive testing against production unless explicitly authorized and safely planned.

==================================================
STEP 17: DATABASE TESTING
==================================================

Test:

- CRUD operations
- Constraints
- Foreign keys
- Unique constraints
- Null constraints
- Transactions
- Rollbacks
- Isolation levels where relevant
- Locking
- Concurrent updates
- Pagination
- Sorting
- Filtering
- Search
- Index usage
- Query performance
- Data migrations
- Schema migrations
- Rollback migrations
- Seed data
- Referential integrity

Check for:

- N+1 queries
- Full-table scans
- Missing indexes
- Duplicate queries
- Excessive queries
- Cartesian joins
- Incorrect fetch strategies
- Slow joins
- Unbounded queries

==================================================
STEP 18: MIGRATION TESTING
==================================================

For schema or data migrations verify:

- Migration succeeds on clean database.
- Migration succeeds on existing database.
- Existing data remains valid.
- No data is unintentionally deleted.
- Constraints remain valid.
- Application remains compatible.
- Rollback strategy exists where practical.

==================================================
STEP 19: CONCURRENCY TESTING
==================================================

Test simultaneous activity.

Examples:

- Two users modify the same item.
- Duplicate API requests arrive simultaneously.
- Two workers process the same event.
- Multiple browser tabs modify the same data.
- User double-clicks an action.
- Two background jobs run simultaneously.

Detect:

- Race conditions
- Lost updates
- Duplicate records
- Deadlocks
- Incorrect locking
- Data corruption
- Inconsistent state

==================================================
STEP 20: IDEMPOTENCY TESTING
==================================================

For operations that may be repeated, verify duplicate execution does not cause unintended effects.

Especially test:

- Payment APIs
- Webhooks
- Queue consumers
- Retryable APIs
- Background jobs
- File processing
- Notifications
- Create operations

Verify repeated requests do not accidentally:

- create duplicates
- charge twice
- send multiple notifications
- corrupt state
- process the same event twice

==================================================
STEP 21: ERROR-HANDLING TESTING
==================================================

Intentionally force failures.

Examples:

- Database unavailable
- Cache unavailable
- Queue unavailable
- Third-party API unavailable
- DNS failure
- Timeout
- Connection reset
- Invalid response
- Partial response
- Malformed response
- Rate-limit response
- Disk full
- Storage unavailable
- File corruption

Verify:

- Application does not crash unnecessarily.
- Errors are handled gracefully.
- Useful error responses are returned.
- Sensitive information is not exposed.
- Retriable failures are retried safely.
- Non-retriable failures are not endlessly retried.

==================================================
STEP 22: RETRY AND RESILIENCE TESTING
==================================================

If the application has:

- retries
- circuit breakers
- timeouts
- fallback logic
- bulkheads

test each behavior.

Verify:

- Retry count
- Backoff behavior
- Retryable exception rules
- Non-retryable exception rules
- Circuit breaker opening
- Circuit breaker recovery
- Timeout behavior
- Fallback behavior

Prevent retry storms.

==================================================
STEP 23: PERFORMANCE TESTING
==================================================

Measure important performance characteristics.

Test:

- Response time
- Throughput
- CPU usage
- Memory usage
- Database latency
- Cache behavior
- File processing speed
- Queue processing speed
- Large dataset behavior

Measure realistic workloads.

Do not optimize blindly.

Identify actual bottlenecks.

==================================================
STEP 24: LOAD TESTING
==================================================

Test expected traffic levels.

Examples:

- Normal traffic
- Peak traffic
- Multiple concurrent users
- Large request volume
- High API throughput

Measure:

- Response times
- Error rate
- Throughput
- CPU
- Memory
- Database connections
- Queue depth
- Thread usage

Use suitable tools such as:

- k6
- JMeter
- Gatling
- Locust
- project-specific equivalents

==================================================
STEP 25: STRESS TESTING
==================================================

Push beyond normal expected load.

Determine:

- Breaking point
- Failure behavior
- Recovery behavior
- Whether failures are graceful
- Whether data remains consistent

==================================================
STEP 26: SOAK / ENDURANCE TESTING
==================================================

For long-running systems, test sustained workloads.

Detect:

- Memory leaks
- Connection leaks
- Thread leaks
- Resource exhaustion
- Slow degradation
- Queue buildup
- Cache growth problems

==================================================
STEP 27: MEMORY AND RESOURCE TESTING
==================================================

Check:

- Memory leaks
- File descriptor leaks
- Connection pool leaks
- Thread leaks
- Unclosed streams
- Unclosed database connections
- Temporary file cleanup
- Cache growth
- Disk usage

==================================================
STEP 28: FILE UPLOAD/DOWNLOAD TESTING
==================================================

Where relevant test:

- Valid file
- Invalid extension
- Incorrect MIME type
- Empty file
- Large file
- Very large file
- Corrupted file
- Duplicate filename
- Unicode filename
- Special characters
- Interrupted upload
- Interrupted download
- Unauthorized download
- Path traversal attempts

==================================================
STEP 29: FRONTEND TESTING
==================================================

Test:

- Rendering
- Loading state
- Success state
- Empty state
- Error state
- Disabled state
- Form validation
- Buttons
- Navigation
- Routing
- Search
- Filtering
- Pagination
- Sorting
- Modals
- Dialogs
- Dropdowns
- Forms
- Keyboard interaction

Test API failure behavior.

The UI must not silently fail.

==================================================
STEP 30: RESPONSIVE TESTING
==================================================

Where applicable test:

- Desktop
- Laptop
- Tablet
- Mobile
- Different viewport sizes
- Portrait
- Landscape

Verify layouts do not break.

==================================================
STEP 31: CROSS-BROWSER TESTING
==================================================

Where relevant test supported browsers such as:

- Chrome
- Edge
- Firefox
- Safari

Focus on browsers supported by project requirements.

==================================================
STEP 32: ACCESSIBILITY TESTING
==================================================

Test relevant accessibility requirements.

Check:

- Keyboard navigation
- Focus order
- Visible focus
- Labels
- ARIA usage
- Semantic HTML
- Screen-reader compatibility
- Form errors
- Color contrast
- Alternative text
- Accessible buttons
- Accessible dialogs

Aim for applicable WCAG requirements.

==================================================
STEP 33: LOCALIZATION AND INTERNATIONALIZATION TESTING
==================================================

When applicable test:

- Multiple languages
- Unicode
- Long translated text
- Right-to-left languages
- Date formats
- Number formats
- Currency formats
- Timezones
- Character encoding

==================================================
STEP 34: TIME AND TIMEZONE TESTING
==================================================

Where time matters, test:

- UTC
- Local timezone
- Timezone conversion
- DST
- Date boundaries
- Month boundaries
- Year boundaries
- Leap year
- Expiration times
- Scheduled tasks

==================================================
STEP 35: CACHE TESTING
==================================================

When caching exists test:

- Cache hit
- Cache miss
- Cache expiration
- Cache invalidation
- Stale cache
- Cache unavailable
- Concurrent updates
- Cache/database consistency

==================================================
STEP 36: MESSAGE QUEUE / EVENT TESTING
==================================================

When using queues or event systems test:

- Successful publishing
- Successful consumption
- Duplicate event
- Out-of-order event
- Failed consumer
- Consumer retry
- Dead-letter queue
- Poison message
- Queue unavailable
- Reconnection
- At-least-once delivery behavior

Verify idempotency.

==================================================
STEP 37: WEBHOOK TESTING
==================================================

When using webhooks test:

- Valid webhook
- Invalid signature
- Missing signature
- Duplicate webhook
- Delayed webhook
- Out-of-order webhook
- Retry
- Replay attack
- Invalid payload
- Unknown event type

==================================================
STEP 38: EXTERNAL API TESTING
==================================================

Test external integrations for:

- Success
- Authentication failure
- Authorization failure
- Timeout
- Rate limiting
- Invalid response
- Partial response
- Schema changes
- Service unavailable
- Network interruption

Do not allow external failures to crash the application.

==================================================
STEP 39: LOGGING TESTING
==================================================

Verify logs contain enough information for debugging without exposing sensitive data.

Never log:

- passwords
- access tokens
- refresh tokens
- API secrets
- private keys
- full credit card details
- sensitive personal data

Use appropriate log levels.

==================================================
STEP 40: OBSERVABILITY TESTING
==================================================

Where observability exists verify:

- Logs
- Metrics
- Traces
- Health checks
- Readiness checks
- Liveness checks
- Alerting

Ensure important failures can be detected.

==================================================
STEP 41: CONFIGURATION TESTING
==================================================

Verify configuration across environments:

- local
- development
- testing
- staging
- production

Check:

- required environment variables
- defaults
- missing variables
- invalid variables
- secret handling
- feature flags
- URLs
- ports
- database configuration
- CORS configuration

==================================================
STEP 42: DEPENDENCY TESTING
==================================================

Check:

- Vulnerable dependencies
- Outdated dependencies
- Dependency conflicts
- Unused dependencies
- Unsupported libraries
- License concerns where relevant

Do not upgrade dependencies blindly.

After dependency updates, run regression testing.

==================================================
STEP 43: STATIC SECURITY ANALYSIS
==================================================

Where tools are available perform:

- SAST
- secret scanning
- dependency scanning
- vulnerability scanning

Examples may include:

- GitHub Dependabot
- CodeQL
- SonarQube
- Semgrep
- Snyk
- Trivy
- OWASP Dependency-Check

Use the tools suitable for the project.

==================================================
STEP 44: CONTAINER TESTING
==================================================

When using Docker or containers verify:

- Image builds successfully.
- Application starts.
- Required files are included.
- Secrets are not baked into the image.
- Correct ports are exposed.
- Health checks work.
- Containers run as non-root when practical.
- Base image vulnerabilities are reviewed.
- Image size is reasonable.

==================================================
STEP 45: INFRASTRUCTURE TESTING
==================================================

When infrastructure is part of the project verify:

- Environment configuration
- Networking
- Firewall/security groups
- IAM permissions
- Storage
- Database connectivity
- DNS
- SSL/TLS
- Load balancer
- Health checks
- Secrets
- Backup configuration

Follow least privilege.

==================================================
STEP 46: DEPLOYMENT TESTING
==================================================

Before deployment:

- Run full build.
- Run relevant automated tests.
- Validate configuration.
- Validate migrations.
- Check secrets.
- Verify deployment scripts.

After deployment:

- Run smoke tests.
- Check health.
- Check logs.
- Check metrics.
- Test important endpoints.
- Test critical user flows.

==================================================
STEP 47: ROLLBACK TESTING
==================================================

Where possible verify:

- Application can roll back.
- Database compatibility is considered.
- Previous version can start.
- Rollback does not corrupt data.

==================================================
STEP 48: BACKUP AND RESTORE TESTING
==================================================

For systems with important persistent data:

- Verify backups are created.
- Verify backups are readable.
- Test restore process.
- Verify restored data.
- Check recovery time expectations.

A backup that has never been restored is not fully proven.

==================================================
STEP 49: DISASTER RECOVERY TESTING
==================================================

For critical systems, test recovery scenarios such as:

- Server failure
- Database failure
- Region failure
- Storage failure
- Network failure
- Accidental deletion

==================================================
STEP 50: BUSINESS-LOGIC TESTING
==================================================

Technical correctness is not enough.

Verify actual business rules.

Examples:

- Correct calculations
- Correct ownership rules
- Correct workflow transitions
- Correct limits
- Correct validation rules
- Correct permission behavior
- Correct state transitions

==================================================
STEP 51: DATA INTEGRITY TESTING
==================================================

Verify:

- No unintended duplicate data
- No orphan records
- No invalid references
- No partial writes
- No inconsistent state
- No silent data loss

==================================================
STEP 52: MANUAL EXPLORATORY TESTING
==================================================

After automated testing, manually use the software as a real user.

Try unusual behavior such as:

- Rapid clicking
- Double clicking
- Refreshing during operations
- Opening multiple tabs
- Browser back/forward
- Losing internet
- Reconnecting internet
- Submitting incomplete forms
- Repeating requests
- Leaving pages during processing
- Closing/reopening the application

Look for issues automated tests may miss.

==================================================
STEP 53: TEST COVERAGE
==================================================

Measure test coverage where supported.

Do not treat coverage percentage as proof of quality.

Focus coverage on:

- Critical logic
- Security logic
- Business rules
- Permissions
- Error paths
- Important integrations

Avoid meaningless tests written only to increase coverage numbers.

==================================================
STEP 54: MUTATION TESTING
==================================================

For critical business logic, consider mutation testing where practical.

The purpose is to verify whether tests can actually detect broken logic.

==================================================
STEP 55: CODE REVIEW
==================================================

Review changed code for:

- Correctness
- Simplicity
- Maintainability
- Security
- Error handling
- Performance
- Naming
- Duplication
- Dead code
- Unnecessary complexity
- Resource handling
- Transaction behavior
- Thread safety

==================================================
STEP 56: GIT DIFF REVIEW
==================================================

Before declaring completion, inspect the complete Git diff.

Verify:

- Only intended files changed.
- No accidental deletions.
- No secrets committed.
- No temporary debugging code.
- No commented-out production code.
- No unnecessary formatting changes.
- No generated files accidentally committed.
- No unrelated refactoring.

==================================================
REQUIRED TESTING LEVEL BY CHANGE TYPE
==================================================

For a small code change:

- Build
- Compile
- Lint
- Unit tests
- Relevant regression tests

For a backend feature:

- Unit tests
- Integration tests
- API tests
- Database tests
- Authorization tests
- Regression tests

For a frontend feature:

- Unit/component tests
- Integration tests
- E2E tests
- Responsive tests
- Accessibility checks
- Regression tests

For an authentication/security feature:

- Unit tests
- Integration tests
- Authentication tests
- Authorization tests
- Security tests
- Penetration testing where appropriate
- E2E tests
- Regression tests

For a database change:

- Integration tests
- Migration tests
- Transaction tests
- Data integrity tests
- Performance/query testing
- Regression tests

For microservices:

- Unit tests
- Integration tests
- Contract tests
- API tests
- Event/queue tests
- Resilience tests
- E2E tests

For production release:

- Full regression testing
- E2E testing
- Security testing
- Penetration testing where required
- Performance testing
- Load testing
- Smoke testing
- Deployment verification

==================================================
MANDATORY TESTING CATEGORIES
==================================================

At minimum, evaluate whether the project requires:

- Unit Testing
- Integration Testing
- API Testing
- Contract Testing
- End-to-End Testing
- Regression Testing
- Smoke Testing
- Sanity Testing
- Negative Testing
- Edge Case Testing
- Authentication Testing
- Authorization Testing
- Security Testing
- Penetration Testing
- Database Testing
- Migration Testing
- Concurrency Testing
- Idempotency Testing
- Error Handling Testing
- Resilience Testing
- Performance Testing
- Load Testing
- Stress Testing
- Soak Testing
- Resource Testing
- Frontend Testing
- Responsive Testing
- Cross-Browser Testing
- Accessibility Testing
- Localization Testing
- Cache Testing
- Queue/Event Testing
- Webhook Testing
- External API Testing
- Configuration Testing
- Dependency Testing
- Container Testing
- Deployment Testing
- Rollback Testing
- Backup/Restore Testing
- Business Logic Testing
- Data Integrity Testing
- Manual Exploratory Testing

Do not blindly run irrelevant tests.

Determine which categories are applicable to the current project and explain why.

==================================================
RECOMMENDED EXECUTION ORDER
==================================================

Use this flow where applicable:

Requirements
↓
Code Review
↓
Compile / Build
↓
Lint / Static Analysis
↓
Unit Tests
↓
Integration Tests
↓
Database Tests
↓
API Tests
↓
Authentication / Authorization Tests
↓
Security Tests
↓
Regression Tests
↓
Frontend / Component Tests
↓
E2E Tests
↓
Performance / Concurrency Tests
↓
Manual Exploratory Testing
↓
Git Diff Review
↓
Deployment
↓
Smoke Testing
↓
Final Validation

==================================================
BUG-FIX RULE
==================================================

For every reproducible bug:

Bug reported
↓
Reproduce bug
↓
Understand root cause
↓
Create failing regression test
↓
Fix root cause
↓
Run test
↓
Run related test suite
↓
Verify no regression
↓
Keep regression test permanently

Avoid temporary patches that hide the actual problem.

==================================================
AI / VIBE CODING SPECIFIC RULES
==================================================

When code is generated or modified using AI:

1. Assume it may contain subtle mistakes.

2. Verify every important API, method, configuration, library call, and framework behavior.

3. Check that generated code uses APIs supported by the project's actual dependency versions.

4. Do not accept invented methods, classes, configuration keys, annotations, or CLI commands.

5. Check imports and dependencies.

6. Check error handling.

7. Check thread safety.

8. Check database behavior.

9. Check authentication and authorization.

10. Check performance implications.

11. Check generated SQL when relevant.

12. Check external API assumptions.

13. Check generated code against project architecture and conventions.

14. Do not accept unnecessary complexity.

15. Do not rewrite working modules unnecessarily.

16. Run tests after every meaningful AI-generated change.

==================================================
CHECKPOINT RULE
==================================================

Before each meaningful Git checkpoint or commit:

- Build must pass.
- Relevant tests must pass.
- Regression tests must pass.
- Lint/static checks must pass where configured.
- Git diff must be reviewed.
- No secrets must be present.
- No temporary debug code must remain.

Do not recommend committing broken code unless explicitly creating a temporary work-in-progress commit.

==================================================
DEFINITION OF DONE
==================================================

A task is complete only when all relevant conditions are satisfied:

- Requirements are implemented.
- Application builds successfully.
- No known compile errors exist.
- Relevant unit tests pass.
- Relevant integration tests pass.
- Relevant API tests pass.
- Relevant regression tests pass.
- Important user flows pass E2E testing.
- Authentication works correctly.
- Authorization works correctly.
- Security checks pass to an acceptable level.
- Database behavior is correct.
- Edge cases are handled.
- Failure scenarios are handled.
- Performance is acceptable for expected usage.
- Existing functionality has not regressed.
- No sensitive information is exposed.
- Git diff has been reviewed.
- No known critical bug is being hidden.
- Remaining risks are documented.

==================================================
FINAL TEST REPORT
==================================================

After testing, provide a structured final report.

Use this format:

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

Mark each as:

- PASS
- FAIL
- PARTIAL
- NOT APPLICABLE
- NOT TESTED

## Tests Added
List new automated tests.

## Tests Executed
List executed test suites and important scenarios.

## Passed
List successful checks.

## Failed
List failed tests and exact reasons.

## Bugs Found
For each bug provide:
- Problem
- Root cause
- Severity
- Fix
- Test added

## Security Findings
Include:
- Vulnerability
- Severity
- Impact
- Fix
- Verification status

## Performance Findings
Include:
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

==================================================
FINAL RULE
==================================================

Do not finish with only:

"Tests passed."

Provide evidence.

A successful build is not enough.

Unit testing alone is not enough.

Manual testing alone is not enough.

E2E testing alone is not enough.

Security scanning alone is not enough.

A production-ready application requires multiple layers of verification.

Always test the actual behavior, protect existing functionality, verify security boundaries, test failure scenarios, and clearly report what was and was not validated.