<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>

    <link rel="stylesheet" href="./styles.css">
    <script type="module" src="./app.js"></script>
</head>
<body>
    <form id="signup">
        <label>
            Username: <br>
            <input type="text" name="username" placeholder="ex. John Cena❤️" required >
        </label>

        <label>
            Password: <br>
            <input type="password" name="password" required >
        </label>

        <select name="role" required>
            <option value="student">Student</option>
            <option value="admin">Admin</option>
        </select>
        
        <button type="submit"> Register </button>
    </form>
</body>
</html>