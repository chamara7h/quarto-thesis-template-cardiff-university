
# Cardiff University Quarto Thesis Template

A professional Quarto thesis template for Cardiff University, designed for writing research degree theses in a modular, reproducible, and PDF-first workflow.

This template uses **Quarto** for authoring and **LuaLaTeX** for PDF rendering. It provides a structured starting point for thesis writing, with support for front matter, numbered chapters, references, appendices, and cross-referencing, while keeping content and formatting cleanly separated.

> [!IMPORTANT]
> This template is designed to support a Cardiff-style thesis workflow, but you should always check the latest Cardiff University and School-level guidance before final submission.

---

## Features

- Quarto book-based thesis structure
- PDF rendering with LuaLaTeX
- Cardiff-style title page and front matter
- Numbered chapters and sections
- References placed at the end of the thesis
- Support for appendices
- Cross-referencing for sections, figures, tables, and equations
- Custom LaTeX class for thesis formatting
- Separate front matter files for declaration, acknowledgements, abbreviations, symbols, and dedication
- Easy customisation through `_quarto.yml`, `MastersDoctoralThesis.cls`, and template partials

---

## Quick Start

### 1. Install the required software

You will need:

- [Quarto](https://quarto.org/)
- A TeX distribution with **LuaLaTeX** support, such as:
  - [TinyTeX](https://yihui.org/tinytex/)
  - [TeX Live](https://www.tug.org/texlive/)
- An editor such as:
  - RStudio
  - VS Code
  - Positron

### 2. Clone or download the template

Clone the repository or download it as a ZIP file, then open the project folder in your editor.

### 3. Update the thesis metadata

Edit `_quarto.yml` and replace the default metadata with your own:

- thesis title
- author name
- submission date
- degree name
- university
- front matter files
- chapter list
- appendix list
- bibliography file

### 4. Add your chapters

Write each chapter in its own `.qmd` file inside the `Chapters/` folder, then list those files under `book: chapters:` in `_quarto.yml`.

### 5. Add references

Store all references in `references.bib` and cite them in your text using standard Quarto / Pandoc citation syntax.

### 6. Render the thesis

From the project root, run:

```bash
quarto preview
```

for live preview during writing, or:

```bash
quarto render
```

to render the full thesis.

---

## Project Structure

```text
.
├── _quarto.yml
├── index.qmd
├── references.qmd
├── references.bib
├── _extentions/MastersDoctoralThesis.cls
├── Frontmatter/
│   ├── declaration.tex
│   ├── acknowledgements.tex
│   ├── abbreviations.tex
│   ├── symbols.tex
│   └── dedication.tex
├── Chapters/
│   ├── Chapter1.qmd
│   ├── Chapter2.qmd
│   └── ...
├── Appendices/
│   ├── AppendixA.qmd
│   └── ...
├── Figures/
└── _extentions/partials/
                ├── before-body.tex
                ├── in-header.tex
                ├── title.tex
                └── ...
```

---

## Core Files

### `_quarto.yml`

This is the main project configuration file. It controls:

* thesis metadata
* output format
* class options
* bibliography
* chapter order
* appendix order
* front matter file inclusion

### `index.qmd`

This is the opening file of the thesis and typically serves as the first chapter or introductory chapter.

### `MastersDoctoralThesis.cls`

This is the custom LaTeX class file used to control PDF formatting, including page layout, headings, spacing, and table of contents behaviour.

### `partials/before-body.tex`

This controls the title page and front matter that appear before the main body of the thesis.

### `partials/in-header.tex`

This loads additional LaTeX packages and PDF-specific settings.

### `references.bib`

This is the BibTeX bibliography database used by the thesis.

---

## Writing Workflow

The template is designed around a simple workflow:

1. Write one chapter at a time in its own `.qmd` file
2. Keep references in `references.bib`
3. Render the full project periodically
4. Review the PDF for structure, numbering, references, and layout

This approach is more modular than writing the thesis as one long file and makes the project easier to maintain over time.

---

## Adding Chapters

Create new chapter files inside the `Chapters/` folder and list them in `_quarto.yml` under:

```yaml
book:
  chapters:
    - index.qmd
    - Chapters/Chapter2.qmd
    - Chapters/Chapter3.qmd
```

Each chapter should begin with a top-level heading, for example:

```md
# Introduction
```

Use lower heading levels for sections and subsections:

```md
## Background
### Further discussion
```

Do not type section numbers manually. Quarto will generate them automatically.

---

## Citations and Bibliography

All references should be stored in `references.bib`.

Examples:

* In-text citation: `@Reference1`
* Parenthetical citation: `[@Reference1; @Reference2]`

The bibliography is typically placed through a dedicated `references.qmd` file near the end of the thesis.

---

## Cross-Referencing

This template supports Quarto cross-referencing for figures, tables, and equations.

### Figures

````qmd
```{r}
#| label: fig-example
#| fig-cap: Example figure caption.
plot(cars)
```
````

Refer to it in text using:

```md
@fig-example
```

### Tables

````qmd
```{r}
#| label: tbl-example
#| tbl-cap: Example table caption.
knitr::kable(head(mtcars))
```
````

Refer to it in text using:

```md
@tbl-example
```

### Equations

```md
$$
E = mc^2
$$ {#eq-einstein}
```

Refer to it in text using:

```md
@eq-einstein
```

---

## Front Matter

Front matter files are stored separately in the `Frontmatter/` folder and included through the `thesis:` settings in `_quarto.yml`.

This template supports:

* title page
* abstract
* declaration
* acknowledgements
* table of contents
* list of figures
* list of tables
* list of abbreviations
* list of symbols
* dedication

Some of these are optional and can be omitted if not needed.

If the thesis is **paper-based**, or includes **jointly authored papers**, an authorship or contribution statement may also be included where appropriate. If the thesis is **not** paper-based, this should usually be omitted.

---

## Appendices

Appendix files should be placed in the `Appendices/` folder and listed in `_quarto.yml` under:

```yaml
book:
  appendices:
    - Appendices/AppendixA.qmd
```

Quarto will then handle the appendix structure in the rendered thesis.

---

## Rendering

Render from the project root directory, not from an individual chapter file.

Use:

```bash
quarto preview
```

during writing, and:

```bash
quarto render
```

for a full PDF render.

Rendering the whole project ensures that:

* chapter numbering is correct
* front matter is included properly
* references appear in the right place
* appendices are handled correctly
* cross-references update consistently

---

## Customisation

Most structural formatting is controlled by:

* `MastersDoctoralThesis.cls`
* `partials/before-body.tex`
* `partials/in-header.tex`

These files can be edited if you need to adjust:

* title page layout
* front matter order
* table of contents behaviour
* page layout
* appendix formatting
* PDF styling

---

## Recommended Usage Notes

* Render early and often
* Keep chapters modular
* Store all references in `references.bib`
* Use Quarto labels consistently for figures, tables, and equations
* Check the compiled PDF regularly for formatting or structural issues
* Confirm Cardiff University submission requirements before final submission

---

## Acknowledgement

This template was adapted from the excellent `nmfs-opensci/quarto-thesis` project, which provided the underlying Quarto thesis workflow. It has since been customised for a Cardiff University thesis format, including title page layout, front matter structure, appendix handling, and PDF styling.

