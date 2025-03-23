from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    try:
        conn = mysql.connector.connect(
            host="10.10.10.28",
            user="flaskusr",
            password="Flas@pass123",
            database="myapp"
        )
        return "Connected to the database!"
    except mysql.connector.Error as err:
        return f"Error connecting to database: {err}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)