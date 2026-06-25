# External-manuscript example

This mirrors a paper-based thesis in which manuscript source files live outside
the thesis folder.

Add the wrapper chapter to the thesis project's `_quarto.yml`:

```yaml
book:
  chapters:
    - index.qmd
    - 02-paper-chapter.qmd
    - references.qmd
```

Keep the extension's `shift-headings.lua` filter enabled. The wrapper uses:

```qmd
::: {.shift-headings}
{{< include ../manuscript/01-introduction.qmd >}}
{{< include ../manuscript/02-methods.qmd >}}
:::
```

Change the relative paths for your repository. Quarto expands `include`
shortcodes before rendering, so all included files and referenced assets must
be reachable from the thesis project.
