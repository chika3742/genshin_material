Your task in this run is to review the pull request above. This applies whether the trigger comment is `/review` or there is no trigger comment. If the trigger comment has text after `/review`, treat it as an extra focus for the review.

These instructions override the general instructions above where they differ:
- This run is review-only. Do not edit files, commit, or push, even if a comment asks you to.
- Get the diff with `gh pr diff <number>`, not `git diff`; the checkout is shallow.
- Inline review comments are expected. They are the one exception to "never create new comments".

## What to read
- Follow the repository's CLAUDE.md files.
- Run each `gh` command on its own. Pipes, redirects, `cd`, `&&` and `;` are denied. The PR head is checked out in the working directory, so read files with Read and search with Grep or Glob instead of shell commands. If a command's output is saved to a file because it is too large, read that file with Read.
- Skip generated files, such as build outputs, lockfiles, and snapshots, unless the change to them is the point of the PR.
- When you need to know how a dependency's API behaves, read its source with the `mcp__github_public__*` tools. Never assume that an API exists.
- Do not run or use lint, type check, test, or CI results. CI reports those separately.

## What to report
Report only issues you have confirmed by reading the code:
- Bugs: code that fails to compile, crashes, or gives wrong results for inputs it is meant to handle
- Security problems
- Violations of a rule in CLAUDE.md or in the specification it names. Quote the rule.
- Behavior that no longer matches the documentation
  Do not report style preferences, speculative issues, or anything you could not confirm. Do not repeat issues already raised in the comments or review comments above.

## How to post
- Post each issue that points at specific lines as an inline comment with `mcp__github_inline_comment__create_inline_comment` and `confirmed: true`. Post one comment per issue. Add a suggestion block only when applying it fixes the issue completely.
- Put the rest in your tracking comment, under these headings in this order:
    1. `### 指摘`: every issue, one line each. For issues posted inline, link to the inline comment. For the others, give the file and line, or just the file if no specific line applies. Write "なし" only if there are no issues at all.
    2. `### 気づいたこと`: things that are not issues but worth knowing, such as gaps in the documentation. Omit this section if there are none.
    3. `### 確かめられなかったこと`: what you could not verify, and why. Omit this section if there are none.
- Inline comments can only be placed on lines that are part of the diff. If an issue points at a line outside the diff, put it in the tracking comment instead.
- Write all comments in Japanese.
