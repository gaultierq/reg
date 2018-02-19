import { Controller } from "stimulus"
import { DataTables } from "datatables.net"
import $ from "jquery"

export default class extends Controller {
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

    connect() {
        this.load()
    }

    disconnect() {
        this.destroy()
    }

    load() {
        $(this.id).DataTable({
            paging: false,
            info: false,
            searching: false,
            ajax: {
                url: this.url,
                dataSrc: this.data_src
            },
            columns: this.columns
        })
    }

    destroy() {
        $(this.id).DataTable().destroy()
    }
}