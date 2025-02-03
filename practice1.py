from flask import Flask
 
app = Flask(__name__)
 
@app.route('/')


def hello_world():


	return 'Hello, Techrover!'
 
if __name__ == '__main__':


	# Ensure Flask listens on all IPs


	app.run(debug=True, host='0.0.0.0', port=5000)

