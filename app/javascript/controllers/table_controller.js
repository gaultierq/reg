import { Controller } from "stimulus"
import { DataTables } from "datatables.net"
import $ from "jquery"

export default class extends Controller {
    static targets = [ "search" ]

    get id() {
        return this.data.get("id")
    }

    get url() {
        return this.data.get("url")
    }

    get data_src() {
        return this.data.get("data-src")
    }

    get columns() {
        const columns = JSON.parse(this.data.get("columns"))
        return _.map(columns, function(column) { return { data: column } })
    }

    initialize() {
        this.load()
    }

    disconnect() {
        this.destroy()
    }

    load() {
        this.table = $(this.id).DataTable({
            dom: "lrtip",
            paging: false,
            info: false,
            searching: true,
            bFilter: false,
            ajax: {
                url: this.url,
                dataSrc: this.data_src
            },
            columns: this.columns
        })
    }

    destroy() {
        this.table.destroy()
    }

    search() {
        this.table.search(this.searchTarget.value).draw()
    }
}