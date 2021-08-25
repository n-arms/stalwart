import * as S__Mainloop from "./Stalwart/Stalwart__Mainloop.bs.js"
import * as S__Node from "./Stalwart/Stalwart__Node.bs.js"
import * as S__Attribute from "./Stalwart/Stalwart__Attribute.bs.js" 

const webpage = model =>
    S__Node.div(
        [
            S__Attribute.styles([
                ["background-color", "#c1f2f5"],
                ["padding", "50px"]
            ])
        ],
        [
            S__Node.h1(
                [
                    S__Attribute.styles([
                        ["padding-left", "50px"]
                    ])
                ],
                [
                    S__Node.text("cats are great!")
                ]
            ),
            S__Node.div(
                [
                    S__Attribute.styles([
                        ["background-color", "white"],
                        ["padding", "50px"]
                    ])
                ],
                [
                    S__Node.p([],
                        [
                            S__Node.text("here are some things that I like about cats")
                        ]
                    ),
                    S__Node.button(
                        [
                            S__Attribute.onClick(!model)
                        ],
                        [
                            S__Node.text(model ? "next page" : "previous page")
                        ]
                    )
                ]
            )
        ]
    )

const body = document.getElementsByTagName("body")[0]
S__Mainloop.mainloop(body, true, (a, b) => a, webpage)
