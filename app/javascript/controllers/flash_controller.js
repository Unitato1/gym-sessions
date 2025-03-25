import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = []
    connect() {
        setTimeout(() => {
            this.element.classList.add("opacity-0");
        }, 2500)
        console.log("Flash is here");
    }
}