import * as Stalwart from "./Stalwart.bs.js"
import * as S__Mainloop from "./Stalwart/Stalwart__Mainloop.bs.js"
import * as S__Node from "./Stalwart/Stalwart__Node.bs.js"
import * as S__Attribute from "./Stalwart/Stalwart__Attribute.bs.js" 


const webpage = S__Node.p(
    [
        S__Attribute.styles([
            ["color", "coral"],
            ["background-color", "yellow"],
            ["margin", "50px"],
            ["padding", "50px"],
            ["font-size", "25px"]
        ])
    ], 
    [
        S__Node.text("hello, world")
    ])

const body = document.getElementsByTagName("body")[0]
S__Mainloop.mainloop(body, true, (a, b) => true, _ => webpage)
