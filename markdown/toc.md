---
plugins: # this is where you import plugins.
  toc: # Imports a plugin with the same name as key in this case toc
    header: "value of some setting of toc" # Plugin setting
---

# TOC Table of Contents

  - [something](#1)

[link](#usage)

## usage

`[toc]`

Will render a table of contents in it's place.

## example

[toc]

# h1 Heading

## h2 Heading
### h3 Heading
## h2 Heading
## h2 Heading

### h3 Heading
#### h4 Heading
### h3 Heading

#### h4 Heading
##### h5 Heading
#### h4 Heading

##### h5 Heading
###### h6 Heading
##### h5 Heading

###### h6 Heading
###### h6 Heading