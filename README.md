# Cardiff University Quarto Thesis Template

A PDF-first Quarto template for writing Cardiff University doctoral theses and
master's dissertations. It provides a Cardiff-style title page, degree-specific
wording, front matter, chapters, appendices, citations, cross-references, and a
workflow for including paper manuscripts maintained in other folders.

> Always compare the generated document with the current Cardiff University
> and School-level submission guidance before submitting.

## Requirements

- [Quarto](https://quarto.org/)
- LuaLaTeX through TinyTeX, TeX Live, or MiKTeX
- An editor such as VS Code, Positron, or RStudio
- R only if your `.qmd` files contain R code chunks

Check the installation:

```bash
quarto check
```

## Downloading the template

### Option 1: Using Git

Open Terminal on macOS or Git Bash / PowerShell on Windows.

Choose the folder where you want to save the thesis project.

#### macOS

```bash
cd ~/Documents
git clone https://github.com/chamara7h/quarto-thesis-template-cardiff-university.git my-thesis
cd my-thesis
```

#### Windows

```bash
cd "C:/Users/YOUR-USERNAME/Documents"
git clone https://github.com/chamara7h/quarto-thesis-template-cardiff-university.git my-thesis
cd my-thesis
```

Replace `YOUR-USERNAME` with your Windows username.

### Option 2: Download as ZIP

If you do not want to use Git:

1. Click the green **Code** button on the GitHub repository page.
2. Select **Download ZIP**.
3. Unzip the folder.
4. Rename the folder, for example, `my-thesis`.
5. Open the folder in RStudio, Positron, VS Code, or your preferred editor.

## Creating your own thesis project

After downloading the template, you may want to remove the connection to the original GitHub repository and start your own Git history.

### macOS

```bash
rm -rf .git
git init
git add .
git commit -m "Initial thesis template"
```

### Windows PowerShell

```powershell
Remove-Item -Recurse -Force .git
git init
git add .
git commit -m "Initial thesis template"
```

This creates a clean local version of the template for your own thesis.

## Use the template directly

The repository root is a complete runnable example.

1. Clone or download the repository.
2. Edit `_quarto.yml`.
3. Replace the example content in `Chapters/`.
4. Put references in `references.bib`.
5. Add or remove front matter paths under `thesis:`.
6. Render from the repository root:

```bash
quarto preview
quarto render
```

The normal chapter pattern is:

```yaml
book:
  chapters:
    - index.qmd
    - Chapters/Chapter2.qmd
    - references.qmd
  appendices:
    - Appendices/AppendixA.qmd
```

Each chapter starts with `#`, sections with `##`, and subsections with `###`.
Do not type section numbers manually.

## Doctoral thesis configuration

The default `_quarto.yml` is configured for a PhD:

```yaml
book:
  title: "Your Thesis Title"
  author: "Your Full Name"
  date: "September 2026"

thesis:
  degree-name: "Doctor of Philosophy"
  university: "Cardiff University"
  group: "Your School or Research Group"
  acknowledgements: "Frontmatter/acknowledgements.tex"
  declaration: "Frontmatter/declaration.tex"
  authorship: "Frontmatter/authorship.tex"
  abbreviations: "Frontmatter/abbreviations.tex"
  symbols: "Frontmatter/symbols.tex"
  dedication: "Frontmatter/dedication.tex"
```

Leave `thesis.masters` absent or set it to `false`. The doctoral title page then
uses “A thesis submitted for the degree of …”.

`authorship` is optional and is mainly useful for a paper-based thesis. Remove
the line or set it to `false` when it is not needed.

## Master's dissertation configuration

The `_quarto-masters.yml` profile contains the master's settings. Edit its
placeholders, then render with:

```bash
quarto preview --profile masters
quarto render --profile masters
```

The important fields are:

```yaml
thesis:
  masters: true
  degree-name: "Master of Science"
  university: "Cardiff University"
  candidate-id: "C12345678"
  candidate-title: "Mr"
  candidate-surname: "YOUR SURNAME"
  candidate-first-names: "YOUR FIRST NAMES"
  declaration: "Frontmatter/declaration-masters.tex"
```

With `masters: true`, the title page automatically prints:

```text
This dissertation is submitted to Cardiff University
in partial fulfilment of the requirements for the degree of

MASTER OF SCIENCE
```

Change `degree-name` for another award, such as `Master of Arts`, `Master of
Business Administration`, or the exact award title required by your programme.
The separate `Frontmatter/declaration-masters.tex` file uses the candidate and
degree metadata above to create the master's declaration statements.

## Include manuscripts from another folder

For a paper-based thesis, the thesis chapter can contain its own preface and
then include manuscript sections maintained elsewhere:

```qmd
# Paper title {#sec-paper-title}

This preface explains the paper's status and contribution to the thesis.

::: {.shift-headings}
{{< include ../../paper-project/manuscript/01-introduction.qmd >}}

{{< include ../../paper-project/manuscript/02-methods.qmd >}}

{{< include ../../paper-project/manuscript/03-results.qmd >}}
:::
```

The included manuscript may use `# Introduction`, `# Methods`, and similar
level-1 headings when rendered on its own. The `.shift-headings` wrapper moves
every included heading down one level, so those headings become sections inside
the thesis chapter. Nested headings, lists, block quotes, and divs are handled
by `_extensions/quarto-thesis/shift-headings.lua`.

The wrapper chapter itself—not each external manuscript file—should be listed
under `book.chapters`. See `examples/external-manuscripts/` for a small working
layout. Adjust relative include paths and image/data paths for your repository.

## Front matter

Front matter is controlled under `thesis:`:

- `acknowledgements`
- `declaration`
- `authorship`
- `abbreviations`
- `constants`
- `symbols`
- `dedication`

Remove an item or set it to `false` to omit it. The abstract is entered directly
in YAML:

```yaml
abstract: >
  Write the abstract here.
```

The title page and front-matter order are defined in
`_extensions/quarto-thesis/partials/before-body.tex`.

## Citations, figures, tables, and equations

Store references in `references.bib`:

```qmd
Narrative citation: @Reference1

Parenthetical citation: [@Reference1; @Reference2]
```

Use Quarto labels and references:

```qmd
![Caption](Figures/example.pdf){#fig-example}

See @fig-example.

$$
E = mc^2
$$ {#eq-einstein}
```

The bibliography is placed by `references.qmd`. Appendices belong under
`book.appendices` in `_quarto.yml`.

## Project structure

```text
.
|-- _quarto.yml
|-- _quarto-masters.yml
|-- index.qmd
|-- references.qmd
|-- references.bib
|-- Chapters/
|-- Appendices/
|-- Frontmatter/
|   |-- declaration.tex
|   `-- declaration-masters.tex
|-- Figures/
|-- examples/
`-- _extensions/
    `-- quarto-thesis/
        |-- _extension.yml
        |-- shift-headings.lua
        |-- MastersDoctoralThesis.cls
        `-- partials/
```

## Main customization files

- `_quarto.yml`: doctoral metadata, chapter order, bibliography, and format.
- `_quarto-masters.yml`: master's profile and candidate details.
- `Frontmatter/*.tex`: editable front-matter content.
- `partials/before-body.tex`: title page and front-matter sequence.
- `MastersDoctoralThesis.cls`: page layout and heading styles.
- `shift-headings.lua`: safe heading-level adjustment for included manuscripts.

Render the whole project from its root rather than rendering an individual
chapter. This keeps chapter numbering, references, appendices, and
cross-references consistent.

## Acknowledgement

This template was adapted from `nmfs-opensci/quarto-thesis` and customized for a
Cardiff University thesis workflow.
