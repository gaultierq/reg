import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "id" ]

    connect() {
        this.idTarget.value = window.location.search.split("=").pop()
    }

    switch() {
        window.location.search = `tap_template_id=${this.idTarget.value}`
    }
}