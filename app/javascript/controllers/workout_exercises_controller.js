import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="workout-exercises"
export default class extends Controller {
  static targets = [ "template", "test" ]

  initialize() {
    this.index = Math.round(this.testTarget.childNodes.length / 6);
  }

  connect() {
    console.log("Stimulus controller connected!");
  }

  addExercise() {
    this.index++;

    const exercise_form = this.templateTarget.cloneNode(true);

    const nodes = exercise_form.querySelectorAll('*');

    nodes.forEach(node => {
      this.updateNodeAttributes(node);
    });

    this.testTarget.appendChild(exercise_form);
  }

  updateNodeAttributes(node) {
    if (node.name) {
      node.value = "";
      const newName = node.name.replace(/\[\d+\]/, `[${this.index}]`);
      node.setAttribute('name', newName);
    }

    if (node.id) {
      node.value = "";
      const newId = node.id.replace(/\_\d+/, `_${this.index}`);
      node.setAttribute('id', newId);
    }

    if (node.tagName.toLowerCase() === 'label' && node.getAttribute('for')) {
      node.value = "";
      const newFor = node.getAttribute('for').replace(/\_\d+/, `_${this.index}`);
      node.setAttribute('for', newFor);
    }
  }
}