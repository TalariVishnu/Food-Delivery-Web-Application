<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(to bottom, #2563eb, #1d4ed8);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .container {
            width: 100%;
            max-width: 28rem;
        }

        .signup-box {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .header h2 {
            color: #1f2937;
            font-size: 1.875rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .signup-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .input-group {
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 0.75rem 0.75rem 0.75rem 2.5rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.2s;
        }

        .input-group input:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .signup-button {
            background-color: #2563eb;
            color: white;
            padding: 0.75rem;
            border: none;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .signup-button:hover {
            background-color: #1d4ed8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="signup-box">
            <div class="header">
                <h2>Create Account</h2>
                <p>Sign up to get started</p>
            </div>

            <form class="signup-form" action="NewUser">
                <div class="input-group">
                    <input type="text" name="name" placeholder="Full Name" required>
                </div>
                
                <div class="input-group">
                    <input type="text" name="username" placeholder="Username" required>
                </div>

				 <div class="input-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
				
                <div class="input-group">
                    <input type="email" name="email" placeholder="Email address" required>
                </div>

                <div class="input-group">
                    <input type="tel" name="phone" placeholder="Phone Number" required>
                </div>
                <button type="submit" class="signup-button">Register</button>
            </form>
        </div>
    </div>
</body>
</html>
