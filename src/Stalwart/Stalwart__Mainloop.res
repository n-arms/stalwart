open Belt
open Promise
open Webapi.Dom
open Stalwart__Node

let rec mainloop : 
    Element.t 
    => 'model 
    => ('msg => 'model => 'model) 
    => ('model => html<'msg>) 
    => () = (root, init, update, view) => {
    root -> Element.setInnerHTML("")
    view(init).eval(root)
        -> then(msg =>
            mainloop(root, update(msg, init), update, view)
            -> resolve)
        -> ignore
}
