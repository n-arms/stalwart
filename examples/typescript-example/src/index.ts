import * as S__Mainloop from "./Stalwart/Stalwart__Mainloop.bs.js"
import * as S__Node from "./Stalwart/Stalwart__Node.bs.js"
import * as S__Attribute from "./Stalwart/Stalwart__Attribute.bs.js" 

const init : boolean = true
const update : (_:unknown, model:boolean) => boolean = (_, model) => !model
const view : (model:boolean) => any = model =>
    S__Node.button(
        [
            S__Attribute.onClick(null),
            S__Attribute.styles([
                ["background-color", model ? "green" : "red"],
                ["height", "10em"],
                ["width", "10em"],
            ])
        ],
        [
            S__Node.p(
                [
                    S__Attribute.styles([
                        ["font-size", "3em"]
                    ])
                ],
                [
                    S__Node.text(model ? "on" : "off")
                ]
            )
        ]
    )

const body = document.getElementsByTagName("body")[0]
S__Mainloop.mainloop(body, init, update, view)
