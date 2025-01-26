$(document).ready(function () {
    const toastElement = document.querySelector('.toast');
    console.log('Toast element:', toastElement); // Ensure this is not null or undefined
    if (toastElement) {
        const toast = new bootstrap.Toast(toastElement);
        toast.show();
    } else {
        console.error('Toast element not found!');
    }


})