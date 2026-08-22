# INSCIGHT Typst Templates

This repository contains the official **Typst templates** used to produce *InScight*, the science magazine of IISER Kolkata.

It provides a complete, modular layout system for building full magazine issues — including articles, interviews, comics, digests, games, covers, and more — with consistent styling and typography.

## InScight

**InScight** is a science magazine publishing and typesetting system built with [Typst](https://typst.app/). It contains the source for assembling magazine issues, reusable layout and typography templates, article/interview/game components, editorial content, structured metadata, images, author photographs, fonts, and the tooling required to generate the final magazine PDF.

The repository is designed so that individual pieces of magazine content can be maintained as separate Typst files while sharing a common visual and structural template. A central `main.typ` file assembles the selected content into a complete issue.

The project currently contains material for **InScight Issue 9.5 — August 2026**.

---

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Technology](#technology)
* [Repository Structure](#repository-structure)
* [How the Build System Works](#how-the-build-system-works)
* [Getting Started](#getting-started)

  * [Prerequisites](#prerequisites)
  * [Clone the Repository](#clone-the-repository)
  * [Using the Bundled Typst Binary](#using-the-bundled-typst-binary)
  * [Build the Magazine](#build-the-magazine)
  * [Watch for Changes](#watch-for-changes)
* [Project Architecture](#project-architecture)

  * [Main Document](#main-document)
  * [Content Modules](#content-modules)
  * [Templates](#templates)
  * [Data Files](#data-files)
  * [Assets](#assets)
* [Creating an Article](#creating-an-article)
* [Creating Other Content Types](#creating-other-content-types)
* [Managing Issue Metadata](#managing-issue-metadata)
* [Adding Images](#adding-images)
* [Adding Author Information](#adding-author-information)
* [References and Citations](#references-and-citations)
* [Tables, Mathematics, and Crosswords](#tables-mathematics-and-crosswords)
* [Compiling a Custom Issue](#compiling-a-custom-issue)
* [HTML-Aware Content](#html-aware-content)
* [Development Workflow](#development-workflow)
* [Troubleshooting](#troubleshooting)
* [Design System](#design-system)
* [Contributing](#contributing)
* [License and Third-Party Assets](#license-and-third-party-assets)

---

## Overview

InScight is structured as a collection of reusable publication components rather than as a single large Typst document.

The basic workflow is:

```text
Content + Metadata + Images
            │
            ▼
      Individual .typ files
            │
            ▼
   Reusable InScight template
            │
            ▼
        main.typ
            │
            ▼
          Typst
            │
            ▼
       Complete PDF
```

Individual articles and sections contain their own content and metadata. Shared functionality—such as page layouts, headers, footers, figures, author profiles, references, tables, crosswords, and magazine-specific styling—is implemented in the `template-files/` directory.

This separation makes it possible to modify an individual article without having to duplicate the magazine's layout code.

---

## Features

The repository provides infrastructure for:

* Multi-page magazine issue generation
* Reusable article templates
* Interviews
* Forewords and editorial sections
* Research summaries
* Science news digests
* Quizzes
* Crosswords
* Linked-list/word games
* Comics
* Author profiles
* Cover pages
* Table-of-contents generation
* Page linking
* References
* Captions and figures
* Multi-column layouts
* Mathematical typesetting
* Tables loaded from CSV files
* Structured metadata using YAML and TOML
* Custom typography
* Local font loading
* Custom colors and magazine branding
* Automatic permalink generation
* Optional HTML-oriented rendering behavior
* Automated recompilation using `typst watch`

---

# Technology

The project primarily uses:

| Technology            | Purpose                                                                         |
| --------------------- | ------------------------------------------------------------------------------- |
| **Typst**             | Document generation and typesetting                                             |
| **YAML**              | Issue metadata, author metadata, references, quizzes, and other structured data |
| **TOML**              | Crossword and game configuration                                                |
| **CSV**               | Tabular data imported into Typst                                                |
| **LaTeX**             | Source material for selected mathematical/scientific content                    |
| **DOCX**              | Source/reference material for articles                                          |
| **SVG/PNG/JPEG/WebP** | Magazine artwork and illustrations                                              |

The repository also contains local Typst binaries under `typst-binaries/`, allowing the project to be built without necessarily installing Typst globally.

---

# Repository Structure

A simplified view of the repository is:

```text
.
├── README.md
├── main.typ
├── run.sh
├── run.bat
│
├── subfiles/
│   ├── front.typ
│   ├── foreword.typ
│   ├── editor.typ
│   ├── outline.typ
│   ├── article.typ
│   ├── interview.typ
│   ├── trends.typ
│   ├── ...
│   └── solutions.typ
│
├── template-files/
│   ├── constants.typ
│   ├── helpers.typ
│   ├── layouts.typ
│   ├── outline.typ
│   └── inscight-template.typ
│
├── dataFiles/
│   ├── issueData.yml
│   ├── team.yml
│   ├── refs.yml
│   ├── quiz.yml
│   ├── crossword.toml
│   ├── *.yml
│   ├── *.toml
│   ├── *.tex
│   └── source documents
│
├── images/
│   └── magazine images and illustrations
│
├── covers/
│   └── article/section cover artwork
│
├── authFaces/
│   └── author/interviewee photographs
│
├── fonts/
│   ├── lato/
│   ├── merriweather/
│   ├── barlow/
│   ├── kreon/
│   ├── lora/
│   ├── bitter/
│   ├── neuton/
│   ├── sansation/
│   └── Noto_Sans_Math/
│
├── typst-binaries/
│   ├── typst
│   └── typst.exe
│
└── main.pdf
```

---

# How the Build System Works

The entry point for generating an issue is:

```text
main.typ
```

The file imports the common InScight template and then includes the individual content modules.

For example:

```typst
#import "template-files/inscight-template.typ": *

#show: default.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
)

#include "/subfiles/foreword.typ"
#include "/subfiles/outline.typ"
#include "/subfiles/trends.typ"
#include "/subfiles/nobelChem.typ"
```

Each included `.typ` file contributes a section to the final document.

The files in `template-files/` provide the reusable functionality used by these content modules.

---

# Getting Started

## Prerequisites

You need:

* A recent Typst installation, or the Typst binary supplied with this repository
* A terminal/shell
* The complete repository, including the `fonts/`, `template-files/`, `subfiles/`, `images/`, and `dataFiles/` directories

The project expects the repository root to be used as the Typst project root.

---

## Clone the Repository

```bash
git clone <repository-url>
cd inscight
```

If you obtained the repository as an archive instead, extract it while preserving the directory structure.

---

## Using the Bundled Typst Binary

The repository includes platform-specific Typst binaries:

```text
typst-binaries/typst
typst-binaries/typst.exe
```

On Linux/macOS, the Unix binary can be used directly:

```bash
./typst-binaries/typst
```

On Windows:

```powershell
.\typst-binaries\typst.exe
```

If the binary is executable and compatible with your system, this removes the need to install Typst separately.

---

# Build the Magazine

The repository includes convenience scripts:

```text
run.sh
run.bat
```

The shell script runs:

```bash
typst watch --root . --font-path fonts main.typ
```

The Windows batch script provides the corresponding command for Windows environments.

If Typst is available on your `PATH`, you can therefore run:

```bash
./run.sh
```

The command watches the project for changes and recompiles `main.typ` automatically.

---

# Watch for Changes

For active development, `typst watch` is recommended:

```bash
typst watch --root . --font-path fonts main.typ
```

The important options are:

* `--root .` — makes the repository root available as the Typst project root.
* `--font-path fonts` — tells Typst where the bundled fonts are located.
* `main.typ` — the entry point of the magazine.

Whenever a relevant source file changes, Typst recompiles the document.

This is particularly useful while editing articles because you can keep the generated PDF open and see changes after recompilation.

---

# Project Architecture

## Main Document

`main.typ` is the assembly point for an issue.

It is intentionally relatively small. Rather than containing the magazine's entire content, it imports the common template and includes the desired sections.

For example:

```typst
#include "/subfiles/trends.typ"
#include "/subfiles/nobelChem.typ"
#include "/subfiles/sayan.typ"
#include "/subfiles/sobitri.typ"
```

To add an article or section to an issue, its `.typ` file generally needs to be included from `main.typ`.

To temporarily remove a section, its `#include` line can be commented out:

```typst
// #include "/subfiles/editor.typ"
```

This makes `main.typ` function as the issue's **contents manifest**.

---

# Content Modules

The `subfiles/` directory contains individual publication components.

Examples include:

```text
article.typ
interview.typ
foreword.typ
editor.typ
quiz.typ
crossword.typ
linkedlist.typ
comic.typ
digest.typ
trends.typ
```

Most content files follow this general pattern:

```typst
#import "/template-files/inscight-template.typ": *

#let title = "Article title"
#let authors = "Author Name"
#let affiliations = "Institution"
#let abstract = "Article abstract"
#let coverImage = "/covers/example.svg"
#let authorImage = "/authFaces/example.jpg"

#show: article.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: title,
  authors: authors,
  authorAffiliations: affiliations,
  abstract: abstract,
  coverImage: coverImage,
  authorImage: authorImage,
  authorInfo: authorInfo,
)
```

The actual body of the article follows the template invocation.

---

# Templates

The reusable publication logic is concentrated in:

```text
template-files/
```

## `inscight-template.typ`

This is the primary public interface to the template system.

Content files import it with:

```typst
#import "/template-files/inscight-template.typ": *
```

It in turn imports the lower-level layout and helper functionality.

---

## `constants.typ`

This file defines the magazine's design system.

It contains:

* Font families
* Font sizes
* Heading sizes
* Page dimensions
* Margins
* Column spacing
* Colors
* Header/footer styling
* Figure styling
* Table-of-contents styling
* Category colors
* Link destinations
* Crossword cell sizes
* Other global constants

For example, the repository defines:

```typst
#let main-font = "Merriweather"
#let heading-font = "Sansation"
#let outline-font = "Barlow"
#let author-font = "Kreon"
#let caption-font = "Bitter"
#let header-font = "Lora"
#let math-font = "Noto Sans Math"
```

The page size is configured as:

```typst
#let page-shape = "a4"
```

This means visual changes that should apply across the entire magazine should generally be made in `constants.typ` rather than separately in every article.

---

## `layouts.typ`

Contains the higher-level page and section layouts used to structure the magazine.

This is where publication-level components such as article layouts, covers, headers, profiles, and other visual structures are assembled.

---

## `helpers.typ`

Contains reusable utility functions.

Some of the functionality implemented here includes:

* Image placement
* Captions
* Author profiles
* References
* Tables
* Page links
* Permalink generation
* Crosswords
* Mathematical helpers
* Drop capitals
* Important/highlighted blocks
* Content extraction
* Text truncation
* Outline generation
* Online-link generation

For example, the `img()` helper supports different image widths and placement modes:

```typst
#img(
  path: "/images/example.jpg",
  caption: "Example image",
  position: bottom,
  width: 100%,
  portrait: true,
)
```

---

# Creating an Article

The recommended way to create an article is to create a new file under:

```text
subfiles/
```

For example:

```text
subfiles/myArticle.typ
```

A typical article defines its metadata before invoking the article template:

```typst
#import "/template-files/inscight-template.typ": *

#let title = "My Article"
#let authors = "Author Name"
#let affiliations = "IISER Kolkata"

#let authorInfo = "A short author biography."

#let coverImage = "/covers/myArticle.svg"
#let authorImage = "/authFaces/author.jpg"

#let received = (month: 08, day: 22, year: 2026)

#let abstract = "A short summary of the article."

#show: article.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: title,
  authors: authors,
  authorAffiliations: affiliations,
  abstract: abstract,
  coverImage: coverImage,
  authorImage: authorImage,
  authorInfo: authorInfo,
  received: received,
)
```

The article body can then use normal Typst markup:

```typst
== Introduction

Your article begins here.

== A Section

More content goes here.

=== A Subsection

Additional discussion.
```

Finally, add it to `main.typ`:

```typst
#include "/subfiles/myArticle.typ"
```

---

# Article Metadata

The article template supports metadata such as:

* Title
* Author(s)
* Affiliations
* Author biography
* Abstract
* Cover image
* Author image
* Date received
* Reviewer
* References
* Outline prefix
* Other layout parameters

For example:

```typst
#let reviewedBy = "Reviewer Name"
```

can be passed to:

```typst
reviewedBy: reviewedBy,
```

Multiple authors can be represented using the structures expected by the relevant template.

Refer to existing files in `subfiles/` when creating a new article so that the metadata format remains consistent with the publication.

---

# Creating Other Content Types

The repository contains specialized templates for different kinds of magazine content.

## Foreword

A foreword can use:

```typst
#show: foreword.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "Tradition, Science, and the Search for Truth",
  author: [Author Name],
  affiliation: [Department],
)
```

A foreword can also include images and custom layout parameters.

---

## Editorial

The editorial component uses the same general publication infrastructure but can be distinguished from a titled foreword through the template's parameters.

The existing examples in `subfiles/` should be used as the canonical reference when creating or modifying an editorial section.

---

## Interviews

Interview content has its own reusable layout and supports:

* Interview metadata
* Interviewee information
* Interviewee photographs
* Cover images
* Structured interview dialogue

The repository contains `subfiles/interview.typ` as the template/example for this content type.

---

## Quizzes

The quiz section is driven by structured data.

The current wrapper is:

```typst
#quiz(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/quiz.yml",
)
```

The questions and associated information are therefore kept separate from the layout code.

---

## Crosswords

Crosswords are represented using TOML:

```text
dataFiles/crossword.toml
```

and rendered using:

```typst
#crossword(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/crossword.toml",
)
```

The template contains logic for generating both the puzzle and its solution.

---

## Science News Digest

The repository also supports a curated science-news digest.

The digest data is separated from the layout:

```text
dataFiles/digest.typ
```

and rendered through the magazine template.

---

# Managing Issue Metadata

Issue-level information is stored in:

```text
dataFiles/issueData.yml
```

The current file contains:

```yaml
number: "9.5"
time: "AUGUST 2026"
```

This information is consumed throughout the template.

For example:

```typst
#let issueDetails = yaml("/dataFiles/issueData.yml")
```

The issue number and publication period can then be used in headers, covers, permalinks, and other generated content.

When preparing a new issue, update `issueData.yml` rather than hard-coding the issue number throughout the project.

---

# Team Information

The editorial/team information is maintained in:

```text
dataFiles/team.yml
```

The structure currently separates roles into categories such as:

```yaml
Chief:
Advisors:
Editors:
Design:
SocialGames:
```

This allows the publication team information to be rendered dynamically in the contribution/team section.

---

# Adding Images

Images are distributed among several directories according to their purpose.

## General Images

```text
images/
```

Use this directory for article figures, illustrations, diagrams, photographs, and other article-level assets.

Example:

```typst
#img(
  path: "/images/Dopamine.jpg",
  caption: "Dopamine and synaptic transmission.",
  portrait: true,
  position: top,
)
```

---

## Covers

```text
covers/
```

Contains artwork intended for article or section covers.

---

## Author/Interviewee Photographs

```text
authFaces/
```

contains photographs used for author and interviewee profiles.

---

# Image Placement

The `img()` helper supports different layouts.

For example:

```typst
#img(
  path: "/images/example.jpg",
  width: 100%,
  portrait: true,
  position: bottom,
)
```

Important parameters include:

| Parameter  | Purpose                                                   |
| ---------- | --------------------------------------------------------- |
| `path`     | Image path                                                |
| `caption`  | Figure caption                                            |
| `position` | Placement such as `top`, `bottom`, or automatic placement |
| `width`    | Image width                                               |
| `float`    | Whether the image floats                                  |
| `portrait` | Controls portrait-style image/caption behavior            |

The helper also changes its layout behavior depending on the requested width.

As a rule of thumb:

* Small images can remain within a single column.
* Medium-width images can place the caption beside the image.
* Large images can span the full magazine width.

---

# Fonts

The repository bundles its own fonts under:

```text
fonts/
```

The current design uses several font families, including:

* Merriweather
* Sansation
* Barlow
* Kreon
* Bitter
* Lora
* Noto Sans Math

The Typst build explicitly supplies the font directory:

```bash
--font-path fonts
```

This is important because the document relies on these fonts for consistent rendering.

Do not remove or rename the font directories without also updating the build configuration and/or `template-files/constants.typ`.

---

# References and Citations

References can be maintained independently of the article body.

For example:

```text
dataFiles/trends.yml
```

contains references for the corresponding article.

An article can pass its reference file to the template:

```typst
refsFile: "/dataFiles/trends.yml",
```

The shared helper system then formats the references.

This approach keeps long bibliographic information out of the main article source and makes references easier to maintain.

---

# Tables

The template provides a helper for loading tables from CSV files.

The basic concept is:

```typst
#tables(
  file: "/path/to/table.csv",
  caption: "Table caption",
)
```

The helper:

1. Reads the CSV file.
2. Treats the first row as the table header.
3. Evaluates header markup.
4. Generates a Typst table.
5. Wraps the table in a figure.

This is useful when table data is easier to maintain as structured CSV rather than inline Typst.

---

# Mathematics

The project includes:

```text
fonts/Noto_Sans_Math/
```

and defines a dedicated mathematical font in `constants.typ`.

The helper layer also provides mathematical convenience functions, including:

```typst
#m(expr)
```

and:

```typst
#M(expr)
```

These are intended to simplify insertion and formatting of mathematical expressions.

---

# Crosswords

Crossword data is stored in TOML rather than being manually drawn.

The crossword helper:

1. Reads the crossword dimensions.
2. Reads blocked cells.
3. Reads across entries.
4. Reads down entries.
5. Determines clue/start positions.
6. Generates the crossword grid.
7. Generates a revealed solution.
8. Generates numbered clue lists.

This means the crossword layout can be changed by modifying the data file rather than rewriting the drawing logic.

---

# Permalinks and Website Integration

The template contains support for the InScight website:

```text
https://scicomm.iiserkol.ac.in/
```

The repository also defines a submission page and contact information.

Permalinks are generated using the issue number and a section-specific suffix:

```typst
createPermalink(
  issueNum: issueDetails.at("number"),
  permalinkSuffix: permalinkSuffix,
)
```

This produces URLs following the publication's issue structure.

The template can also generate short/long online links for content that is available on the InScight website.

---

# HTML-Aware Content

Some helper functions inspect Typst's system inputs to determine whether the document is being processed in an HTML-oriented mode.

For example, the drop-cap helper checks:

```typst
sys.inputs
```

for an `html` value.

This allows some publication features to behave differently depending on the output target.

When extending the template, preserve this behavior where appropriate rather than assuming that every helper is PDF-only.

---

# Development Workflow

A typical workflow for preparing an issue is:

### 1. Update issue metadata

Edit:

```text
dataFiles/issueData.yml
```

### 2. Add or update article metadata

Create/edit a file under:

```text
subfiles/
```

### 3. Add article assets

Place:

* Article images in `images/`
* Cover artwork in `covers/`
* Author photographs in `authFaces/`

### 4. Add structured data

Depending on the content, add or update:

```text
dataFiles/*.yml
dataFiles/*.toml
dataFiles/*.csv
```

### 5. Add the content to `main.typ`

For example:

```typst
#include "/subfiles/myArticle.typ"
```

### 6. Start Typst watch mode

```bash
typst watch --root . --font-path fonts main.typ
```

### 7. Inspect the generated PDF

Check:

* Page breaks
* Image placement
* Captions
* References
* Headers/footers
* Table of contents
* Author information
* Typography
* Crossword/quiz layouts

### 8. Repeat

Because `typst watch` automatically recompiles the document, the editing loop is:

```text
Edit → Save → Typst recompiles → Inspect PDF
```

---

# Troubleshooting

## `typst: command not found`

Install Typst or use the bundled binary in:

```text
typst-binaries/
```

Alternatively, ensure Typst is on your `PATH`.

---

## Fonts are missing or look different

Make sure the build command contains:

```bash
--font-path fonts
```

For example:

```bash
typst watch --root . --font-path fonts main.typ
```

Also verify that the `fonts/` directory has not been moved or renamed.

---

## Images cannot be found

Check that the path starts from the repository/project root where appropriate.

For example:

```typst
/images/example.jpg
```

rather than an incorrect relative path.

Also verify that the filename—including capitalization—matches the actual file.

This is particularly important on case-sensitive operating systems.

---

## A new article does not appear in the PDF

Creating a new file under `subfiles/` is not sufficient by itself.

Add it to `main.typ`:

```typst
#include "/subfiles/myArticle.typ"
```

---

## YAML/TOML data cannot be loaded

Check:

* File path
* File extension
* YAML/TOML syntax
* Indentation
* Quoting
* Whether the file is inside the project root

For example:

```typst
yaml("/dataFiles/issueData.yml")
```

expects the corresponding file to exist at the specified project-root path.

---

## Page links or anchors fail

The helper system performs assertions when generating certain internal links.

For example, `pageLink()` verifies that the requested anchor exists and is unique.

If a link fails, check:

* The target heading exists.
* The heading is outlined where required.
* The anchor text matches.
* There is only one matching heading.

---

# Design System

The visual identity of InScight is centrally defined in:

```text
template-files/constants.typ
```

The primary palette includes:

* A deep red header color
* Dark body text
* Light page backgrounds
* Warm author/profile colors
* Category-specific accent colors

The template uses different fonts for different semantic roles.

For example:

```text
Body text       → Merriweather
Headings        → Sansation
Outline         → Barlow
Author metadata → Kreon
Captions        → Bitter
Headers         → Lora
Mathematics     → Noto Sans Math
```

This separation is intentional and should be preserved when extending the publication.

---

# Adding a New Issue

To prepare a new issue, the recommended approach is:

```text
1. Update issueData.yml
2. Prepare/update content in subfiles/
3. Add article metadata
4. Add images and author photographs
5. Add/update references and structured data
6. Update main.typ
7. Run Typst watch
8. Review the generated PDF
9. Remove/debug any temporary content
10. Commit the source and generated artifacts as appropriate
```

For a larger editorial workflow, it may be useful to create a branch for each issue:

```bash
git checkout -b issue-10
```

and keep issue-specific changes isolated until publication.

---

# Generated Files

The repository currently includes:

```text
main.pdf
```

which is a generated magazine PDF.

Whether generated PDFs should be committed to version control depends on the project's publication workflow.

If source files are considered authoritative, an alternative workflow is to generate PDFs during releases/CI rather than committing every generated PDF.

---

# Source Material

The `dataFiles/` directory also contains source material in formats such as:

* DOCX
* TEX
* YAML
* TOML
* Typst

These files serve different purposes.

Some are structured inputs used directly during compilation, while others appear to be source/reference material associated with published content.

When adding a new article, keep the distinction between:

```text
source/reference material
```

and:

```text
files directly consumed by the Typst build
```

clear.

---

# Contributing

Contributions to the project should generally preserve the separation between:

```text
Content
   ↓
Content-specific .typ file
   ↓
Reusable template
   ↓
Issue assembly
```

When adding functionality that is useful across multiple articles, prefer extending the shared template/helper system instead of duplicating the implementation inside individual articles.

For example, if a new figure layout is required by several sections, it is preferable to add a reusable helper to:

```text
template-files/helpers.typ
```

rather than implementing the same layout separately in every `subfiles/*.typ`.

Similarly, global visual changes should generally be made in:

```text
template-files/constants.typ
```

rather than hard-coded into individual articles.

---

# Recommended File Naming

For new content, use descriptive names:

```text
subfiles/
├── climateChange.typ
├── quantumComputing.typ
├── interviewScientist.typ
└── researchDigest.typ
```

For assets:

```text
images/
├── climateChangeFigure1.svg
├── quantumCircuit.png
└── scientistPortrait.jpg
```

For structured metadata:

```text
dataFiles/
├── climateChange.yml
├── quantumComputing.yml
└── climateReferences.yml
```

Avoid spaces and unnecessarily ambiguous filenames where possible.

---

# Important Development Principle

The most important architectural principle in this repository is **separation of content from presentation**.

Article authors should primarily work in:

```text
subfiles/
```

and associated:

```text
dataFiles/
images/
covers/
authFaces/
```

while maintainers of the publication system should primarily work in:

```text
template-files/
```

This makes it possible to redesign the magazine without rewriting every article.

---

# License and Third-Party Assets

The repository includes several third-party font families.

Each font directory contains its own licensing information, including SIL Open Font License files for the corresponding fonts.

Examples include:

```text
fonts/lato/SIL Open Font License.txt
fonts/bitter/SIL Open Font License.txt
fonts/kreon/SIL Open Font License.txt
fonts/lora/SIL Open Font License.txt
fonts/merriweather/SIL Open Font License.txt
fonts/sansation/SIL Open Font License.txt
fonts/neuton/SIL Open Font License.txt
fonts/barlow/SIL Open Font License.txt
fonts/Noto_Sans_Math/OFL.txt
```

These licenses apply to the respective third-party font assets and should be retained when redistributing the repository.

Before publishing or redistributing the complete repository, verify the licensing status of all other bundled images, photographs, illustrations, source documents, and generated material.

If the project has a separate repository-level software/content license, it should be added here and in a root-level `LICENSE` file.

---

# Acknowledgements

InScight's publication system combines:

* Typst for document generation
* A collection of open/licensed typefaces
* Custom Typst layouts and helper functions
* Original editorial and scientific content
* Original and externally sourced visual assets

The magazine's team information is maintained in:

```text
dataFiles/team.yml
```

and can be rendered directly into the publication.

---

# Quick Reference

**Build**
```bash
typst compile --root . --font-path fonts main.typ
```

**Watch**

```bash
typst watch --root . --font-path fonts main.typ
```

**Entry point**

```text
main.typ
```

**Content**

```text
subfiles/
```

**Templates**

```text
template-files/
```

**Structured data**

```text
dataFiles/
```

**Article images**

```text
images/
```

**Covers**

```text
covers/
```

**Author/interviewee photographs**

```text
authFaces/
```

**Fonts**

```text
fonts/
```

**Bundled Typst binaries**

```text
typst-binaries/
```

**Generated magazine**

```text
main.pdf
```

---

## InScight

A modular Typst-based workflow for producing a polished, science-focused magazine—bringing together editorial content, scientific communication, visual design, interactive puzzles, and structured publication data in a reproducible document-generation pipeline.
