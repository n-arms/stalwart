open Belt
open Webapi.Dom
open Stalwart__Attribute


type html<'msg> = {
    eval: Element.t => Promise.t<msg<'msg>>
}

let node : 
    string 
    => array<attribute<'msg>> 
    => array<html<'msg>> 
    => html<'msg> = (nodeType, attrs, elems) => {
        eval: root => {
            let node = document -> Document.createElement(nodeType)
            root -> Element.appendChild(node)
            elems
                -> Array.map(elem =>
                    elem.eval(node))
                -> Js.Array.concat(
                    attrs
                        -> Array.map(attr => attr.eval(node)))
                -> Promise.race
        }
    }

let p : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("p", attrs, elems)
let h1 : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("h1", attrs, elems)
let h2 : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("h2", attrs, elems)
let h3 : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("h3", attrs, elems)
let h4 : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("h4", attrs, elems)
let h5 : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("h5", attrs, elems)
let h6 : 
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("h6", attrs, elems)

let div :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("div", attrs, elems)

let button :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("button", attrs, elems)

let a :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("a", attrs, elems)
        
let ol :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("ol", attrs, elems)

let ul :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("ul", attrs, elems)

let li :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("li", attrs, elems)
let table :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("table", attrs, elems)
let th :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("th", attrs, elems)
let tr :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("tr", attrs, elems)
let td :
    array<attribute<'msg>>
    => array<html<'msg>>
    => html<'msg> = (attrs, elems) =>
        node("td", attrs, elems)

let img :
    array<attribute<'msg>>
    => html<'msg> = attrs =>
        node("img", attrs, [])

let text :
    string
    => html<'msg> = str => {
        eval: root => {
            let node = document -> Document.createTextNode(str)
            root -> Element.appendChild(node)
            Promise.make((_, _) => ())
        }
    }

let literal :
    string
    => html<'msg> = str => {
        eval: root => {
            let node = document -> Document.createElement("div")
            root -> Element.appendChild(node)
            node -> Element.setInnerHTML(str)
            Promise.make((_, _) => ())
        }
    }


