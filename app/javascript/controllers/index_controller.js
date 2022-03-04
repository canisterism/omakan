import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {
    this.form = this.element;
  }

  update(event) {
    const domain = event.target.value;
    console.log({ domain });
    this.form.action = `/search/${domain}`;
  }
}
