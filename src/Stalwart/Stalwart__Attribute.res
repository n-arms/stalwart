open Belt
open Webapi.Dom

type msg<'msg> = 
    | Msg('msg)
    | Reroute

type attribute<'msg> = {
    eval: Element.t => Js.Promise.t<msg<'msg>>
}

let props :
    array<(string, string)>
    => attribute<'msg> = attrs => {
        eval: root =>
            Js.Promise.make((~resolve as _, ~reject as _) =>
                attrs
                    -> Array.forEach(((key, value)) =>
                        root -> Element.setAttribute(key, value)))
    }

let styles :
    array<(string, string)>
    => attribute<'msg> = styles => {
        eval: root =>
            Js.Promise.make((~resolve as _, ~reject as _) =>
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
            Js.Promise.make((~resolve, ~reject as _) =>
                root -> Element.addEventListener("click", _ => resolve(. Msg(msg))))

    }

let onMouseOver : 
    'msg
    => attribute<'msg> = msg => {
        eval: root =>
            Js.Promise.make((~resolve, ~reject as _) =>
                root -> Element.addEventListener("mouseover", _ => resolve(. Msg(msg))))
    }

let onMouseOut : 
    'msg
    => attribute<'msg> = msg => {
        eval: root =>
            Js.Promise.make((~resolve, ~reject as _) =>
                root -> Element.addEventListener("mouseout", _ => resolve(. Msg(msg))))
    }
