import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "date", "day", "month", "year"]

    date() {
        if (this.dayTarget.value !== "" && this.monthTarget.value !== "" && this.yearTarget.value !== "") {
            this.dateTarget.value = `${this.dayTarget.value}/${this.monthTarget.value}/${this.yearTarget.value}`
        }
    }
}