open Belt
open Webapi.Dom
open Stalwart__Attribute

type html<'msg> = {
    eval: Element.t => Promise.t<'msg>
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

let text :
    string
    => html<'msg> = str => {
        eval: root => {
            let node = document -> Document.createTextNode(str)
            root -> Element.appendChild(node)
            Promise.make((_, _) => ())
        }
    }
