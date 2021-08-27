// open Stalwart.Stalwart__Attribute
open Stalwart.Attribute
//open Stalwart.Stalwart__Node
open Stalwart.Node
//open Stalwart.Stalwart__Mainloop
open Stalwart.Mainloop
open Belt
open Webapi.Dom

let init = true
let update = (_, model) => !model
let view = model =>
    button(
        [
            onClick(()),
            styles([
                ("background-color", if model {"green"} else {"red"}),
                ("height", "10em"),
                ("width", "10em")
            ])
        ],
        [
            p(
                [
                    styles([
                        ("font-size", "3em")
                    ])
                ],
                [
                    text(if model {"on"} else {"off"})
                ]
            )
        ]
    )

let body = document -> Document.getElementsByTagName("body") -> HtmlCollection.toArray -> Array.getExn(0)
Js.log("hello from rescript")
mainloop(body, init, update, view)
