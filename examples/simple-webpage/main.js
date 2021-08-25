import * as Stalwart from "./Stalwart.bs.js"
import * as Stalwart__Mainloop from "./Stalwart/Stalwart__Mainloop.bs.js"
import * as Stalwart__Node from "./Stalwart/Stalwart__Node.bs.js"


const p =_ => Stalwart__Node.p([], 
    [
        Stalwart__Node.text("hello, world")
    ])
const body = document.getElementsByTagName("body")[0]
Stalwart__Mainloop.mainloop(body, true, (a, b) => true, p)
