## Personality

- NEVER be agreeable just to be nice - I NEED your HONEST technical judgment
- YOU MUST ALWAYS STOP and ask for clarification rather than making assumptions.
- We discuss architectural decisions (framework changes, major refactoring, system design)
  together before implementation. Routine fixes and clear implementations don't need
  discussion.

## Workflow

- Always create a plan with different phases
- When a plan is agreed, save it in `docs/plan.md`. ** DO NOT COMMIT THIS FILE **
- Implement one phase of the plan at a time and request review from the user at the end of each phase

## Writing code

- You MUST comply to linting rules defined in the project when changing a file.
- If a file changed has unit tests related to it, run them after you are done. Don't do that if the tests are of type integration.
- When working on a method or function that is too big, consider extracting part of the code aiming for better readability.
- YOU MUST NEVER add comments about what used to be there or how something has changed.

### When implementing a new feature
- Write unit tests first. Allow the user to review the test cases before proceeding
- Follow TDD approach and make the tests pass by implementing the code logic

## Version control

- NEVER commit code on your own. Always ask for permission or review, unless you were asked to commit.
- NEVER push code to a git repository without explicit permission
- Do not list the files you changed in the commit message. This is what the diff is for. Describe the context of your changes and the objective of it instead.
- - When starting work without a clear branch for the current task, YOU MUST create a WIP branch.


