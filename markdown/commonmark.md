---
plugins: # this is where you import plugins.
  toc: # Imports a plugin with the same name as key in this case toc
    toc_setting: "value of some setting of toc" # Plugin setting
  some: # Imports the 'some' plugin
    some_setting: "value of some setting" # Plugin setting
  variables:
    random_variable1: "string in a variable" # will be available in markdown using: {{random_variable1}}
---

# h1 Heading

## h2 Heading

### h3 Heading

#### h4 Heading

##### h5 Heading

###### h6 Heading

## Horizontal Rules

___

---

***

## Emphasis

**This is bold text**

**This is bold text**

_This is italic text_

_This is italic text_



## Blockquotes

> Blockquotes can also be nested...
>
> > ...by using additional greater-than signs right next to each other...
> >
> > > ...or with spaces between arrows.

## Lists

Unordered

- Create a list by starting a line with `+`, `-`, or `*`
- Sub-lists are made by indenting 2 spaces:
  
  - Ac tristique libero volutpat at
  * Facilisis in pretium nisl aliquet
  - Nulla volutpat aliquam velit
- Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa

4. You can use sequential numbers...
5. ...or keep all the numbers as `1.`

Start numbering with offset:

57. foo
1. bar

## Code

Inline `code`

Block code "fences"

```
Sample text here...
```

## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg "The Dojocat"

