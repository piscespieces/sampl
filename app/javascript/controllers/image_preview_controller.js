import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  connect() {
    console.log('co')
  }

  previewFile() {
    const preview = document.querySelector("#image-preview-container")
    console.log(preview, 'p')
    const file = document.querySelector("#image-preview-file").files[0]
    console.log(file, 'file')
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
