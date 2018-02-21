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

    get dom() {
        return this.data.get("dom")
    }

    get paging() {
        if (this.data.get("paging") === 'false')
            return false
        else
            return true
    }

    get info() {
        if (this.data.get("info") === 'false')
            return false
        else
            return true
    }

    get searching() {
        if (this.data.get("searching") === 'false')
            return false
        else
            return true
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
            dom: this.dom,
            paging: this.paging,
            info: this.info,
            searching: this.searching,
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