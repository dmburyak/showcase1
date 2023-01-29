import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        let radios = document.getElementsByTagName('input');
        for (let i = 0; i < radios.length; i++) {
            radios[i].onclick = function (e) {
                if (e.ctrlKey) {
                    this.checked = false;
                }
            }
        }
    }

}
