import pymysql
from bottle import *

@get("/")
def index():
    return template("index.tpl")


@route("/static/<skra>")
def static_skrar(skra):
    return static_file(skra, root='./static')

######################################################
@error(404)
def villa(error):
    return "<h2 style='color:red'>Þessi síða finnst ekki</h2>"

try:
    run(host='0.0.0.0', port=os.environ.get('PORT'))
except:
    run(host='localhost', port=8080, reloader=True, debug=True)

