# Global Guidelines

## Language & Runtime

- Python is the primary language. Default to Python 3.12+ unless the project specifies otherwise.
- Use `uv` for all package management. Never use `pip install` directly.
  - `uv sync` to install dependencies
  - `uv add <package>` to add a dependency
  - `uv run <command>` to run things in the project venv
  - `uv run pytest` to run tests, not `pytest` directly

## Code Style

- Use type hints on all function signatures. Prefer `X | None` over `Optional[X]`.
- Prefer dataclasses by default and Pydantic models when validation is needed over plain dicts for structured data.
- Keep functions short and focused. If a function needs a comment explaining a section, that section probably wants to be its own function.
- Use `pathlib.Path` over `os.path`.
- Use stdlib logging (or any already existing logger instance), not print() or third-party loggers.
- Don't add docstrings unless the function's purpose is genuinely non-obvious from its name and signature.
- Write minimal code. Don't anticipate edge cases that aren't required yet.

## Testing

- Use `pytest`. Run with `uv run pytest`.
- Put tests in a `tests/` directory mirroring the source structure.
- Prefer plain assertions over unittest-style methods.
- Name test files `<module>_test.py` and test functions `test_<behavior>`.

## Project Layout

- Projects live under `~/workspace/` in separate repositories.
- Expect a standard layout: `src/<package_name>/` or `package_name/`, `tests/`, `pyproject.toml`.
- Configuration (linting, typing, etc.) goes in `pyproject.toml` — not separate config files.

## Git

- Write short, imperative commit messages (e.g. "Add retry logic to API client").
- Don't commit without asking me first.

## General

- When unsure about a project-specific convention, check the existing code before guessing.
- If a project has its own CLAUDE.md, follow those instructions over these global ones.
- Don't over-engineer. Prefer simple, readable solutions.
