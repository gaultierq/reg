import { Controller } from "stimulus"
import { DataTables } from "datatables.net"
import $ from "jquery"

export default class extends Controller {
    static targets = [ "column" ]

    initialize() {
        $("#" + this.context.scope.element.id).DataTable({
            paging: false,
            info: false,
            searching: false,
            ajax: {
                url: this.data.get("url"),
                dataSrc: ''
            },
            columns: [
                { data: "name" }
            ]
        })
    }

    disconnect() {
        console.log("toto");
        $("#" + this.context.scope.element.id).DataTable().destroy()
    }
}