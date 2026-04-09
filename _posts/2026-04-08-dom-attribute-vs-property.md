---
layout: post
date: 2026-04-08 20:36:00 -0800
title: DOM Attribute vs Property
categories: home
---

I know the DOM attribute and property are 2 different concepts when I first start web development, but it's very hard to remember the differences. In the Angular world, the attribute and property binds are different. Here list the differences to make it easy to check it again. Actually this is not hard requirement because the AI is so smart to explain it clearly and easily. But this doc could save AI tokens for you.

### Basic Explanation

Attributes belong to the HTML (the source code), while Properties belong to the DOM (the live object in memory).

#### Attributes (The Initial State)

Attributes are defined in your HTML markup. Their job is to initialize the DOM properties. Once the browser parses the HTML, the attribute's job is mostly done.

Syntax: `<input type="text" value="Hello">`

Static: Attributes generally do not change after the page loads.

Type: They are always strings.

#### Properties (The Live State)

Properties are part of the DOM object (Document Object Model). When you use JavaScript or Angular to change something, you are usually interacting with properties.

Syntax: `myInput.value = 'New Value'`;

Dynamic: Properties change as the user interacts with the page (e.g., typing into a box).

Type: They can be any type (boolean, number, object, etc.).

#### The Relationship: A One-Way Street (Mostly)

When the browser loads your page, it creates DOM nodes from your HTML.

The value="Hello" attribute creates a value property initialized to "Hello".

If the user types "World" into the box. The property becomes "World". The attribute remains "Hello".

If you ask the attribute for its value (`input.getAttribute('value')`), it will still say "Hello". If you ask the property (`input.value`), it will say "World". NOTE the attribute and property access are different.

To remember the differences, you can think the property is the term used for the Javascript object, but attribute is only used for the XML/XHTML for the elements.

### More Differences

- Most attributes and properties have the same name, for example the `value`, `id`, `title`, etc. The same name doesn't mean the same value, for example `href` of `a` element.

| Access Method             | Result                            |  Explanation
| -------------             | -------------                     | -------------
| elem.getAttribute('href') | "contact"                         |  The Attribute returns exactly what was typed in the HTML.
| elem.href                 |"https://example.com/blog/contact" | "The Property returns the fully qualified, clickable URL."

- But some have different names, for example:

| HTML Attribute | DOM Property  | Note
| -------------  | ------------- | -------------
|class           | className     | class is a reserved keyword in JavaScript.
|for             | htmlFor       | for is a reserved keyword in JavaScript.
|readonly        | readOnly      | DOM properties use camelCase like the Javascript name convensions.
|maxlength       | maxLength     | Another camelCase transition.
|colspan         | colSpan       | Another camelCase transition.

- Some HTML attributes don't have corresponding properties, for example aria-label, data-* attributes, or SVG-specific attributes.

### Angular vs React

React hides the complexity between attributes and properties by only supporting property. Once you set the property, it automatically to set the right attribute if necessary.

For example, the below React jsx has a non-controlled input.

```
<input />
```

If you enter some text like `hello`, in the chrome console selects the input, run `$0.getAttribute('value')` and `$0.value`, you can see the outputs are `null` and `hello`. The reason is the non-controlled component is a DOM not managed by the React, so it follows the DOM standard attribute and property rules, attribute is the initial value and property is the dynamic data loaded into the browser.

Another example for the controlled input in React jsx like below:

```
// JS, useState.
const [name, setName] = useState();

// JSX, controlled input.
<input value={name} onChange={(e) => setName(e.target.value)} />
```

Once you enter `hello`, run the same commands like below, you can see the attribute and property both return `hello`. This is because the input is managed by React, the DOM property is binded to the input value, `hello`, at the same time the attribute `value` is also changed by React. In React, __Property__ is the __ONLY__ thing you need to care and you should only use the property. If you need the attribute for some reason, which should not happen, it still has the same value like property. The attribute is only used to integrate third party non-react component is React world.

In the Angular world, it follows the DOM specification. So in the below Angular component, if you enter `hello`, you always see the `$0.getAttribute('value')` and `$0.value` are `null` and `hello`.

```
@Component({
  template: `
    <input [value]="name" />
  `
})
export class MyInput {
  name: string = '';
}
```

It seems other web frameworks follow the same pattern like React to make it easier. If I really need to find a reason for Angular is the Google likes HTML/DOM specification and promote all kinds of W3 standards, like the web components, see another open source project Lit from Google, https://lit.dev/.
