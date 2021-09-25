// open Promise
open Webapi.Dom
open Stalwart__Node

/*
- the event listener should write to a channel, from which events are pulled until it is empty at the start of each mainloop
*/
let then = (p, callback) => Js.Promise.then_(callback, p)

let mainloop : 
    Element.t 
    => 'model 
    => ('msg => 'model => 'model) 
    => ('model => html<'msg>) 
    => () = (root, init, update, view) => {
        let reroute = () => Js.Promise.make((~resolve, ~reject as _) => {
            window -> Window.addEventListenerWithOptions("hashchange", _ => resolve(. Stalwart__Attribute.Reroute), {"once":true, "capture": false, "passive": false})
        })
        let rec loop = (root, init, update, view) => {
            root -> Element.setInnerHTML("")
            [view(init).eval(root), reroute ()] 
                -> Js.Promise.race
                -> then(msg => 
                    switch msg {
                        | Msg(msg) => 
                            loop(root, update(msg, init), update, view)
                        | Reroute => loop(root, init, update, view)
                    } -> Js.Promise.resolve)
                -> ignore
            }
        loop(root, init, update, view)
    }

let hash : unit => string = () =>
    location -> Location.hash
