open Belt
open Webapi.Dom

type attribute<'msg> = {
    eval: Element.t => Promise.t<'msg>
}

let props :
    array<(string, string)>
    => attribute<'msg> = attrs => {
        eval: root =>
            Promise.make((_, _) =>
                attrs
                    -> Array.forEach(((key, value)) =>
                        root -> Element.setAttribute(key, value)))
    }

let styles :
    array<(string, string)>
    => attribute<'msg> = styles => {
        eval: root =>
            Promise.make((_, _) =>
                styles
                    -> Array.map(((key, value)) =>
                        key ++ ":" ++ value ++ ";")
                    -> Array.reduce("", (acc, x) => acc ++ x)
                    -> styles =>
                        root -> Element.setAttribute("style", styles))
    }

let onClick :
    'msg
    => attribute<'msg> = msg => {
        eval: root =>
            Promise.make((resolve, _) =>
                root -> Element.addEventListener("click", _ => resolve(. msg)))

    }
