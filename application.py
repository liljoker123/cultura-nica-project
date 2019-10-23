#db_uri: postgres://ddhaqtrukcarut:f17b57426ec1dff756bda6043d800e84ed5336facf76d28272d556da8daf25c8@ec2-54-243-238-226.compute-1.amazonaws.com:5432/d96kmas6a0dtna

import os
import requests

from flask import Flask, session, render_template, request, jsonify, redirect, url_for
from flask_session import Session
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask(__name__)


# Configure session to use filesystem
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
app.config["DEBUG"] = True
Session(app)

# Set up database
engine = create_engine("postgres://ddhaqtrukcarut:f17b57426ec1dff756bda6043d800e84ed5336facf76d28272d556da8daf25c8@ec2-54-243-238-226.compute-1.amazonaws.com:5432/d96kmas6a0dtna")
db = scoped_session(sessionmaker(bind=engine))

@app.route("/")
def index():
    persona = db.execute("SELECT * FROM persona;")
    return render_template("index.html", persona = persona)






if __name__ == "__main__":
    app.run(debug=True)