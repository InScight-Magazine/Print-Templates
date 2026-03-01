# INSCIGHT Typst Templates

This repository contains the official **Typst templates** used to produce *InScight*, the science magazine of IISER Kolkata.

It provides a complete, modular layout system for building full magazine issues — including articles, interviews, comics, digests, games, covers, and more — with consistent styling and typography.

---

## 📁 Repository Structure

```
authFaces/         Author profile images
covers/            Cover images
dataFiles/         YAML data (issue metadata, references)
fonts/             Local font files used in the magazine
images/            Article images
subfiles/          Example content files
template-files/    Core layout + helper templates
typst-binaries/    Bundled Typst executables
example_full.typ   Complete working example issue
example_full.pdf   Compiled example output
```

---

## 🚀 Quick Start

### 1️⃣ Compile the example issue

If you have Typst installed:

```bash
typst compile example_full.typ
```

Or use the bundled binary:

```bash
./typst-binaries/typst compile example_full.typ
```

This generates a complete magazine example using the provided templates.

---

## 🧱 Template Architecture

The system is modular and divided into:

### `template-files/`

Core layout logic:

* `constants.typ` — global styling variables (fonts, colours, margins)
* `helpers.typ` — utility functions (images, links, math helpers, etc.)
* `layouts.typ` — structural page layouts
* `outline.typ` — table of contents layouts
* `inscight-template.typ` — master import file

You should **never modify `inscight-template.typ`** unless you are changing core template logic.

---

## ✍️ Creating an Article

To write an article:

1. Import the template:

   ```typst
   #import "/template-files/inscight-template.typ": *
   ```

2. Define metadata:

   ```typst
   #let title = "Your Title"
   #let authors = "Author Name"
   #let affiliations = "Institute"
   #let abstract = "Short summary."
   #let coverImage = "/covers/yourcover.jpg"
   #let authorImage = "/authFaces/yourphoto.jpg"
   #let received = (month: 1, day: 1, year: 2026)
   ```

3. Call the article layout:

   ```typst
   #show: article.with(
     issueDetails: yaml("/dataFiles/issueData.yml"),
     title: title,
     authors: authors,
     authorAffiliations: affiliations,
     abstract: abstract,
     coverImage: coverImage,
     authorImage: authorImage,
     received: received,
   )
   ```

4. Write content below using standard Typst syntax.

The first paragraph must use:

```typst
#dcap("First paragraph...")
```

to insert the drop cap.

---

## 🖼 Images

Use the custom `#img` helper:

```typst
#img(
  path: "/images/example.jpg",
  caption: "Caption text.",
  position: top,
  width: 100%,
  portrait: true
)
```

The helper automatically manages:

* Column spanning
* Caption placement
* Figure numbering
* Background styling

---

## 📚 References

References are stored in YAML files under:

```
dataFiles/refs.yml
```

Each reference must be:

```yaml
- "Reference 1"
- "Reference 2"
```

Pass the file path using:

```typst
#let refsFile = "/dataFiles/refs.yml"
```

---

## 📰 Supported Content Types

The template system includes layouts for:

* `article`
* `interview`
* `foreword`
* `comic`
* `insightDigest`
* `quiz`
* `crossword`
* `linkedlist`
* `whoami`
* `backCover`

Each has its own layout function defined in `template-files/`.

---

## 🎨 Styling & Fonts

Default fonts:

* Main text: **Merriweather**
* Math: **Noto Sans Math**
* Headings: **Neuton**
* Outline: **Barlow**
* Captions: **Bitter**

Global styling (colors, margins, spacing, typography) is defined in:

```
template-files/constants.typ
```

Modify that file to change magazine-wide appearance.

---

## 🧩 Issue Metadata

Issue-level data (number, month, etc.) is stored in:

```
dataFiles/issueData.yml
```

Example:

```yaml
number: "7"
time: "FEB 2026"
```

---

## 🌐 About INSCIGHT

InScight is the science magazine of IISER Kolkata.

Website: [https://scicomm.iiserkol.ac.in/](https://scicomm.iiserkol.ac.in/)
