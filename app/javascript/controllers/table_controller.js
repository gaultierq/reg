import { Controller } from "stimulus"
import "datatables.net"
import "datatables.net-responsive"
import $ from "jquery"

export default class extends Controller {
    static targets = [ "search" ]

    get id() {
        return this.data.get("id")
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

    get ordering() {
        if (this.data.get("ordering") === 'false')
            return false
        else
            return true
    }

    get order() {
        if (this.data.get("order") !== '')
            return JSON.parse(this.data.get("order")) || [0, "desc"]
        else
            return [0, "desc"]
    }

    connect() {
        Turbolinks.clearCache()
        this.load()
    }

    load() {
        var table = $(this.id).DataTable({
            // responsive: true,
            dom: this.dom,
            paging: this.paging,
            info: this.info,
            searching: this.searching,
            ordering: this.ordering,
            order: this.order,
            columnDefs: [
                { className: "dt-center", targets: "_all" }
            ]
        })
        this.table = table;

        $("tr[data-link]").click(function() {
            console.debug('hey1');
            window.location = $(this).data("link")
        });

        $(this.id).on('click', 'tr', function () {

            let row = table.row( this );
            let nodes = row && row.nodes();
            var node = nodes && nodes[0];
            var link = node && $(node).attr("data-link");
            console.debug('hey', {link, node});
            if (link) {
                window.location = link
            }
        } );
    }

    search() {
        this.table.search(this.searchTarget.value).draw()
    }
}