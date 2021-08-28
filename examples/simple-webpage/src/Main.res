open Stalwart.Node
open Stalwart.Attribute
open Stalwart.Mainloop
open Belt
open Webapi.Dom

type page = Page1 | Page2

let init = Page1
let update = (msg, _) => msg
let tableStyle = 
    styles([
        ("border", "1px solid black"),
        ("border-collapse", "collapse")
    ])
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
            ]),
            literal("<p>here is a literal p tag</p>"),
            text("here is a table of primary colors"),
            table([tableStyle], [
                tr([tableStyle], [
                    th([tableStyle], [
                        text("color 1")
                    ]),
                    th([tableStyle], [
                        text("color 2")
                    ]),
                    th([tableStyle], [
                        text("color 3")
                    ]),
                ]),
                tr([tableStyle], [
                    td([tableStyle], [
                        text("red")
                    ]),
                    td([tableStyle], [
                        text("blue")
                    ]),
                    td([tableStyle], [
                        text("yellow")
                    ]),
                ]),
            ])
        ])

        | Page2 => div([], [
            p([], [
                text("page 2: its kinda boring really, "),
            ]),
            a(
                [
                    props([
                        ("href", "https://github.com/n-arms/stalwart")
                    ])
                ],
                [
                    text("but you can fnd the stalwart source code here")
                ]
            ),
            p([], [
                text("oh and here are some titles"),
                h1([], [text("h1")]),
                h2([], [text("h2")]),
                h3([], [text("h3")]),
                h4([], [text("h4")]),
                h5([], [text("h5")]),
                h6([], [text("h6")]),
            ]),
        ])
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
