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

    console.log( await response.text() );
}