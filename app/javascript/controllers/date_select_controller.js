import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "date", "day", "month", "year"]

    date() {
        let today = new Date();
        if (this.dayTarget.value !== "" && this.monthTarget.value !== "") {
            if (this.yearTarget.value !== "") {
                this.dateTarget.value = `${this.dayTarget.value}/${this.monthTarget.value}/${this.yearTarget.value}`
            } else {
                this.dateTarget.value = `${this.dayTarget.value}/${this.monthTarget.value}/${today.getFullYear()}`
            }
        }
    }
}