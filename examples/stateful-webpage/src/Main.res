open Stalwart.Attribute
open Stalwart.Node
open Stalwart.Mainloop
open Belt
open Webapi.Dom

let init = ()
let update = (_, _) => ()
let view = _ =>
    div([], [
        text(if hash () == "" {
            "this is the main page"
        } else if hash () == "#1" {
            "this is a sub page"
        } else {
            `404: the page ${hash ()} does not exist`
        }),
        div([], [
            a([
                props([
                    ("href", "http://localhost:8000#")
                ])
            ], 
            [
                text("main page")
            ]),
            a([
                props([
                    ("href", "http://localhost:8000#1")
                ])
            ], 
            [
                text("sub page")
            ])
        ])
    ])

let body = document -> Document.getElementsByTagName("body") -> HtmlCollection.toArray -> Array.getExn(0)
Js.log("hello from rescript")
mainloop(body, init, update, view)
