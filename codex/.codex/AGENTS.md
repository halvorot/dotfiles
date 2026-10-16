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
- I use Fibery as my Life OS, knowledge base, and main note taking system. Use the Fibery MCP to interact with it.
  - I am on the Fibery Standard plan, not the Pro, so only make use of the features included in Standard. e.g. keep custom apps in the Personal/private tab.
