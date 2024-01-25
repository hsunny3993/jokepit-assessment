import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form', 'breedName']

  static values = {
    action: String
  }

  connect() {
  }

  submit(e) {
    this.breedName = this.breedNameTarget.value;

    this.formTarget.checkValidity();
    this.formTarget.classList.add('was-validated');

    if (this.breedName === '') {
      e.preventDefault();
      e.stopPropagation();
    } else {
      $.ajax({
        type: "post",
        dataType: 'text',
        url: this.formTarget.action,
        data: `breed=${this.breedName}&authenticity_token=${$("input[name=authenticity_token]").val()}`,
        success: function (resp) {
          if (resp === 'not_exist') {
            $("#thumbnail").attr('src', '/no-image.png');
            return
          }

          $("#thumbnail").attr('src', resp);
        },
        error: function (data) {
          $("#thumbnail").attr('src', '/no-image.png');
        }
      })
    }
  }
}
