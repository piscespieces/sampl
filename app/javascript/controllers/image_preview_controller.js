import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  connect() {}

  previewFile() {
    console.log('ran')
    const preview = document.querySelector("#image-preview-container")
    const file = document.querySelector("#image-preview-file").files[0]
    const reader = new FileReader()

    reader.addEventListener(
      "load",
      () => {
        // convert image file to base64 string
        preview.src = reader.result;
      },
      false
    );

    if (file) {
      reader.readAsDataURL(file);
    }
  }
}
