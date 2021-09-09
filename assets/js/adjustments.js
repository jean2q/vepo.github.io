$(document).ready(() => {
    $("p > img").each((index, elm) => {
        if (elm.parentElement.children.length == 1) {
            $(elm.parentElement).addClass("img-block");
        }
    });
    $('p > a > img').each((index, elm) => {
        if($(elm).text().length == 0) {
            $(elm.parentElement.parentElement).addClass("img-block");
        }
    });
    
    $("article > table, article > .gist").each((index, elm) => {
        var tableContainer = document.createElement('div');
        tableContainer.classList.add('table-container');
        elm.parentNode.insertBefore(tableContainer, elm);
        tableContainer.appendChild(elm);
    });
});