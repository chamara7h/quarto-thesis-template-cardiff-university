# Cardiff University Quarto Thesis Template

A Quarto-based thesis template for Cardiff University, adapted from the `quarto-thesis` workflow and customised for a Cardiff-style research degree thesis.

This template is intended for students who want to write their thesis in **Quarto** and render it to **PDF** using **LuaLaTeX**. It provides a structured workflow for thesis writing, including title page, abstract, acknowledgements, table of contents, front matter, chapters, references, and appendices.

## Features

- Quarto book-based thesis structure
- PDF rendering with LuaLaTeX
- Cardiff-style title page and front matter
- Numbered chapters and sections
- References placed at the end of the thesis
- Support for appendices
- Cross-referencing for chapters, sections, figures, tables, and equations
- Custom class file for thesis formatting
- Separate front matter files for acknowledgements, abbreviations, symbols, and dedication

## Folder Structure

```text
.
├── index.qmd
├── references.qmd
├── references.bib
├── MastersDoctoralThesis.cls
├── _quarto.yml
├── Frontmatter/
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
└── tex/
    ├── before-body.tex
    ├── in-header.tex
    └── ...
```

## Main Files

### `index.qmd`

This is the entry file for the thesis. It contains the main YAML metadata and defines the overall book structure.

### `_quarto.yml` or YAML in `index.qmd`

This controls thesis metadata such as:

* title
* author
* date
* degree name
* university
* chapter order
* bibliography
* PDF options

### `MastersDoctoralThesis.cls`

This is the LaTeX class file that controls the overall formatting of the PDF output, including headings, page numbers, spacing, and front matter layout.

### `tex/before-body.tex`

This file controls the structure of the title page and front matter before the main body begins.

### `tex/in-header.tex`

This file loads additional LaTeX packages and sets PDF-specific preamble options such as fonts.

### `references.bib`

This is your BibTeX bibliography database. All references cited in the thesis should be included here.

## Getting Started

### 1. Install software

You need:

* [Quarto](https://quarto.org/)
* A TeX distribution with LuaLaTeX support, such as TinyTeX or TeX Live
* RStudio, VS Code, or another editor of your choice

### 2. Edit the thesis metadata

Update the YAML in `index.qmd` with your details:

* thesis title
* your full name
* submission date
* degree title
* university
* front matter files
* chapter list
* bibliography file

### 3. Add your chapters

Write each thesis chapter in its own `.qmd` file inside the `Chapters/` folder.

Use:

```md
# Chapter Title

## Section Title

### Subsection Title
```

Do not manually type section numbers. Quarto will number them automatically.

### 4. Add references

Add all references to `references.bib`.

In the text, cite using keys such as:

* `@Reference1`
* `[@Reference1; @Reference2]`

### 5. Add appendices

Appendix files can go in the `Appendices/` folder.


# Additional Results

### 6. Render the thesis

From the project folder, run:

```bash
quarto preview
```

or:

```bash
quarto render
```

This will render the full thesis as a PDF.

## Writing Conventions

### Headings

Use normal Quarto markdown headings. For example:

```md
# Introduction
## Research background
### Further discussion
```

### Figures

For figures generated in code chunks:

````qmd
```{r}
#| label: fig-example
#| fig-cap: Example figure caption.
plot(cars)
````

Then reference it in text using `@fig-example`.

### Tables
For tables:

````qmd
```{r}
#| label: tbl-example
#| tbl-cap: Example table caption.
knitr::kable(head(mtcars))
````

Then reference it in text using `@tbl-example`.

### Equations
For equations:

```md
$$
E = mc^2
$$ {#eq-einstein}
```

Then reference it using `@eq-einstein`.

## Notes on Front Matter

This template supports:

* title page
* abstract
* acknowledgements
* table of contents
* list of figures
* list of tables
* list of abbreviations
* list of symbols
* dedication

Some of these are optional and can be removed if not needed.

## Notes on Cardiff Formatting

This template has been adapted toward a Cardiff-style thesis workflow, but students should always check the latest Cardiff University guidance before submission.

In particular, you should review:

* title page requirements
* abstract/summary requirements
* font and spacing requirements
* pagination rules
* final submission rules

## Customising the Template

You can customise:

* the title page
* heading styles
* page numbering
* margins
* appendices
* bibliography style
* front matter content

Most structural formatting is controlled by:

* `MastersDoctoralThesis.cls`
* `tex/before-body.tex`
* `tex/in-header.tex`

## Repository Use

If you are sharing this template publicly, you may want to update:

* repository name
* README
* site URL
* repo URL
* issue links

If you are only using it privately for your own thesis, these are optional.

## Acknowledgement of Source Template

This template is adapted from the Quarto thesis workflow and the original `MastersDoctoralThesis` LaTeX structure, with substantial revision for Cardiff-style thesis use in Quarto.
