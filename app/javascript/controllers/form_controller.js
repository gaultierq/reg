import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "input" ]

    connect() {
        this.errors = this.data.get("errors").split(',')

        this.inputTargets.forEach((el) => {
            el.classList.toggle("uk-form-danger", _.includes(this.errors, RegExp("\\[([a-z|_]*)\\]$").exec(el.name)[1]))
        })
    }
}