document.addEventListener('turbolinks:load', () => {
    const controls = document.querySelectorAll('.form-inline-link')

    if(controls.length){
        controls.forEach(item => item.addEventListener('click', formInlineLinkHandler))
    }

    const errors = document.querySelector('.resource-errors')
    if(errors) {
        const resourceId = errors.dataset.resourceId
        onEdit(resourceId)
    }
})

const formInlineLinkHandler = (e) => {
    e.preventDefault()
    const testId = e.target.dataset.testId
    onEdit(testId)
}

const onEdit = (testId) => {

    const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
    const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
    const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

    if(formInline.classList.contains('hide')){
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        link.textContent = 'Cancel'
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        link.textContent = 'Edit'
    }





}
