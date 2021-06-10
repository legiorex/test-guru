document.addEventListener('turbolinks:load', () => {
    const control = document.querySelector('.sort-by-title')
    if(control) {

        control.addEventListener('click', sortRowsByTitle)
    }
})
const sortRowsByTitle = () => {
    const table = document.querySelector('tbody')
    const rows = table.querySelectorAll('tr')

    const arr = [...rows]
    arr.splice(0,1)

    if(table.querySelector('.bi-arrow-up-short').classList.contains('hide')) {

        arr.sort(compareRowsAsc)
        table.querySelector('.bi-arrow-up-short').classList.remove('hide')
        table.querySelector('.bi-arrow-down-short').classList.add('hide')

    } else {
        arr.sort(compareRowsDesc)
        table.querySelector('.bi-arrow-up-short').classList.add('hide')
        table.querySelector('.bi-arrow-down-short').classList.remove('hide')

    }

    const sortedRows = [rows[0], ...arr]

    const sortedTable = document.createElement('tbody')

    sortedRows.forEach((row) => sortedTable.appendChild(row))

    table.parentNode.replaceChild(sortedTable, table)
}

const compareRowsAsc = (a, b) => {

    const testTitleA = a.querySelector('td').textContent
    const testTitleB = b.querySelector('td').textContent
    if(testTitleA < testTitleB) return -1
    if(testTitleA > testTitleB) return 1
    return 0
}
const compareRowsDesc = (a, b) => {

    const testTitleA = a.querySelector('td').textContent
    const testTitleB = b.querySelector('td').textContent
    if(testTitleA < testTitleB) return 1
    if(testTitleA > testTitleB) return -1
    return 0
}
