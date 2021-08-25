open Belt
open Webapi.Dom

type html<'msg> = {
    eval: Element.t => Promise.t<'msg>
}

type attribute<'msg> = {
    eval: Element.t => Promise.t<'msg>
}
