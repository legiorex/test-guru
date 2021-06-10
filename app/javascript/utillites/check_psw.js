document.addEventListener('turbolinks:load', () => {
    const confirmPasswordInput = document.querySelector('.confirm_password')
    const passwordInput = document.querySelector('.password')

    if(confirmPasswordInput && passwordInput) {

        confirmPasswordInput.addEventListener('input', (e) => onChangeConfirmPassword(e, passwordInput))
        passwordInput.addEventListener('input', (e) => onChangePassword(e, confirmPasswordInput))
    }


})

const onChangeConfirmPassword = (e, passwordInput) => {

    if(!e.target.value){
        e.target.classList.remove('is-valid')
        e.target.classList.remove('is-invalid')
    } else {

        if(passwordInput.value === e.target.value) {
            e.target.classList.add('is-valid')
            e.target.classList.remove('is-invalid')
        } else {
            e.target.classList.add('is-invalid')
            e.target.classList.remove('is-valid')
        }

    }


}
const onChangePassword = (e, confirmPasswordInput) => {

    if(!confirmPasswordInput.value){
        confirmPasswordInput.classList.remove('is-valid')
        confirmPasswordInput.classList.remove('is-invalid')
    } else {

        if(confirmPasswordInput.value === e.target.value) {
            confirmPasswordInput.classList.add('is-valid')
            confirmPasswordInput.classList.remove('is-invalid')
        } else {
            confirmPasswordInput.classList.add('is-invalid')
            confirmPasswordInput.classList.remove('is-valid')
        }
    }


}
