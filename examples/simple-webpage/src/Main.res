open Stalwart.Node
open Stalwart.Attribute
open Stalwart.Mainloop
open Belt
open Webapi.Dom

type page = Page1 | Page2

let init = Page1
let update = (msg, _) => msg
let mainInfo = page =>
    switch page {
        | Page1 => p([], [
            text("some important things"),
            ol([], [
                li([], [text("the sky is blue")]),
                li([], [text("Stalwart is a great web framework")])
            ]),
            text("other important things (in no specific order)"),
            ul([], [
                li([], [text("cats")]),
                li([], [text("dogs")]),
                li([], [text("fish")]),
            ])
        ])

        | Page2 => p([], [text("page 2: its kinda boring really")])
    }

let view = model => 
    div(
        [
            styles([
                ("background-color", "yellow"),
                ("padding", "5em")
            ])
        ],
        [
            h1([],
                [
                    text("important title!!!")
                ]
            ),
            div(
                [
                    styles([
                        ("background-color", "white"),
                        ("padding", "5em")
                    ])
                ],
                [
                    mainInfo(model)
                ]
            ),
            div(
                [
                    styles([
                        ("padding-top", "2em")
                    ])
                ],
                [
                    button(
                        [
                            onClick(Page1)
                        ],
                        [
                            text("page 1")
                        ]
                    ),
                    button(
                        [
                            onClick(Page2)
                        ],
                        [
                            text("page 2")
                        ]
                    )
                ]
            )
        ]
    )

let body = document -> Document.getElementsByTagName("body") -> HtmlCollection.toArray -> Array.getExn(0)
Js.log("hello from a simple webpage")
mainloop(body, init, update, view)
