# Clause instructions

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

## Workflow

- Your primary method for interacting with GitHub should be the GitHub CLI.
- Use sub-agents for research and exploratory work to avoid context bloating.
- Always use context7 when I need code generation, setup or configuration steps, or library/API documentation to get up-to-date, version-specific documentation and code examples. This means you should automatically use the Context7 MCP tools to resolve library id and get library docs without me having to explicitly ask.
