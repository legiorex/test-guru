document.addEventListener('turbolinks:load', () => {
    const progress = document.querySelector('.progress')

    if(progress){
        startProgress()
    }
})

const startProgress = () => {
    const progress = document.querySelector('.progress')
    const progressBar = progress.querySelector('.progress-bar')

    const {totalCount, currentCount} = progress.dataset

    const currentPercent = (currentCount * 100) / totalCount
    progressBar.style.width = `${currentPercent}%`
    progressBar.ariaValueNow = currentPercent
}
