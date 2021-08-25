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

let text :
    string
    => html<'msg> = str => {
        eval: root => {
            let node = document -> Document.createTextNode(str)
            root -> Element.appendChild(node)
            Promise.make((_, _) => ())
        }
    }
