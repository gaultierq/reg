import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "link" ]

    connect() {
        this.linkTargets.forEach((el, i) => {
            el.classList.toggle("active", el.pathname === "/" + window.location.pathname.split("/")[2] ||
                (window.location.pathname === "/" && i === 0))
        })
    }

    toggle(event) {
        event.preventDefault()
        UIkit.offcanvas("#offcanvas-navbar").show()
    }
}