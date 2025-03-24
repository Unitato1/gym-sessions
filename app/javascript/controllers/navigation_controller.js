import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "navigation", "hamburgerMenu", "hamburgerMenuNavigation" ]
    connect() {
        document.addEventListener("click", this.closeMenuIfClickedOutside);
    }
    show() {
        this.hamburgerMenuNavigationTarget.classList.toggle("hidden");
    }  
    closeMenuIfClickedOutside = (event) => {
        if (!this.element.contains(event.target)) {
            this.hamburgerMenuNavigationTarget.classList.add("hidden");
        }
    }
}