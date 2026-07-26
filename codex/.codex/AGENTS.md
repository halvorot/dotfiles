# Agent instructions

In all interactions and commit messages, be extremely concise and sacrifice grammar for the sake for concision.

Ask me any questions you need clarification to instead of making guesses or assumtions.

## Plans

- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.

## Coding standards and convensions

- Use industry best practices and prioritize clarity, readability, maintainability, and testability.
- Make sure the system builds, and linting and tests pass before stating that a feature or refactor is complete.
- Always make sure that the implementation adheres to security best practices.

### Testing

- Use the "Arrange, Act, Assert" pattern for unit tests. Make sure to separate the different sections with a comment.
- All tests should be deterministic and independent of each other. Avoid relying on shared state, shared mocks etc.
- Test behavior, not specific implementations.

## Workflow

- Your primary method for interacting with GitHub should be the GitHub CLI.
- Use sub-agents for research and exploratory work to avoid context bloating.
- Always use context7 when I need code generation, setup or configuration steps, or library/API documentation to get up-to-date, version-specific documentation and code examples. This means you should automatically use the Context7 MCP tools to resolve library id and get library docs without me having to explicitly ask.
- I use Fibery as my Life OS, knowledge base, and main note taking system. Use the Fibery MCP to interact with it.

<!-- context7 -->
Use Context7 MCP to fetch current documentation whenever the user asks about a library, framework, SDK, API, CLI tool, or cloud service — even well-known ones like React, Next.js, Prisma, Express, Tailwind, Django, or Spring Boot. This includes API syntax, configuration, version migration, library-specific debugging, setup instructions, and CLI tool usage. Use even when you think you know the answer — your training data may not reflect recent changes. Prefer this over web search for library docs.

Do not use for: refactoring, writing scripts from scratch, debugging business logic, code review, or general programming concepts.

## Steps

1. Always start with `resolve-library-id` using the library name and what to look up in the library's documentation.
2. Pick the best match (ID format: `/org/project`) by: exact name match, description relevance, code snippet count, source reputation (High/Medium preferred), and benchmark score (higher is better). If results don't look right, try alternate names or queries (e.g., "next.js" not "nextjs", or rephrase the question). Use version-specific IDs when the user mentions a version
3. `query-docs` with the selected library ID and what to look up in the library's documentation (not single words), scoped to a single concept. If the question spans multiple distinct concepts (e.g. routing and auth and caching), make a separate `query-docs` call per concept with the same library ID. Combined queries dilute ranking and return shallow results for each topic
4. Answer using the fetched docs
<!-- context7 -->
