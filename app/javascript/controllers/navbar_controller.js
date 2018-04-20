import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "link" ]

    connect() {
        this.linkTargets.forEach((el, i) => {
            el.classList.toggle("active", el.pathname === window.location.pathname ||
                (window.location.pathname === "/" && i === 0) ||
                (window.location.pathname === "/admin" && i === 0));
        })
    }

    toggle(event) {
        event.preventDefault()
        UIkit.offcanvas("#offcanvas-navbar").show()
    }
}