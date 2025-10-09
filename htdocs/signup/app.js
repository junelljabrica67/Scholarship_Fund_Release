document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("signup");

    form.addEventListener("submit", e => signupHandler(e));
});

/**
 * 
 * @param {Event} e 
 */
async function signupHandler(e){
    e.preventDefault();
    const formData = new FormData( e.target );

    const response = await fetch("/api/register_user.php", {
        method: "POST",
        body: formData
    });

    console.log(response.ok);

    if (response.ok) {
        alert("successful, now you can login");
        window.location.href = '/login';
    } else if (response.status === 400){
        alert("An error occurred");
    } else {
        alert("Try again");
    }

    console.log( await response.text() );
}