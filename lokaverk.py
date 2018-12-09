import pymysql
from bottle import *
globaluser = ''
@get("/")
def index():
    b = request.forms.get('blog')
    u = request.forms.get('user')
    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword', db='3004012790_lokaverk_vef')

    cur = conn.cursor()
    cur.execute("SELECT blog FROM 3004012790_lokaverk_vef.blogs")
    result = cur.fetchall()
    print(result)
    output = template('index', rows=result)
    return output

@route("/login")
def login():
    return template("loginform.tpl")

@route('/donyskra', method='POST')
def nyr():
    u = request.forms.get('user')
    p = request.forms.get('pass')
    n = request.forms.get('nafn')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword', db='3004012790_lokaverk_vef')

    cur = conn.cursor()
    cur.execute("SELECT count(*) FROM 3004012790_lokaverk_vef.users where user=%s", (u))
    result = cur.fetchone()


    if result[0] == 0:
        cur.execute("INSERT INTO 3004012790_lokaverk_vef.users values(%s,%s,%s)", (u,p,n))
        conn.commit()
        cur.close()
        conn.close()
        return u, " hefur verið skráður <br><a href='/'>Heim</a>"
    else:
        return u, " er frátekið notandanafn, reyndu aftur <br><a href='/#ny'>Nýskrá</a>"

@route('/doinnskra', method='POST')
def innskra():
    u = request.forms.get('user')
    p = request.forms.get('pass')
    global globaluser
    globaluser = u
    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword', db='3004012790_vef2_v7')
    cur = conn.cursor()

    cur.execute("SELECT count(*) FROM 3004012790_lokaverk_vef.users where user=%s and pass=%s",(u,p))
    result = cur.fetchone()
    print(result)
    if result[0] == 1:

        cur.close()
        conn.close()
        return template('profile', u=u)
    else:
        return template('wrong')

@route('/nyblog', method='POST')
def nyblog():
    i = request.forms.get('id')
    b = request.forms.get('blog')
    u = request.forms.get('user')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword', db='3004012790_lokaverk_vef')

    cur = conn.cursor()
    cur.execute("SELECT count(user) FROM 3004012790_lokaverk_vef.users where user=%s", (u))
    result = cur.fetchone()
    print(result)
    if result[0] == 1:
        cur.execute("INSERT INTO 3004012790_lokaverk_vef.blogs(blog,user) values(%s,%s)", (b,u))
        conn.commit()
        cur.close()
        conn.close()
        return redirect('/')
    else:
        return template('wrong')

@route('/blogs')
def blogs():
    u = request.forms.get('user')
    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword', db='3004012790_lokaverk_vef')
    c = conn.cursor()
    print("SELECT * FROM 3004012790_lokaverk_vef.blogs where user = "+ globaluser)
    c.execute("SELECT * FROM 3004012790_lokaverk_vef.blogs where user = '"+ globaluser+"'")
    result = c.fetchall()
    c.close()
    output=template('blogs',rows=result)
    print(result)
    return output

@route('/change/<bid>')
def breyta(bid):
    id = bid[1:-1]
    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword', db='3004012790_lokaverk_vef')
    c = conn.cursor()
    c.execute("SELECT * FROM 3004012790_lokaverk_vef.blogs where id ="+id)
    result = c.fetchall()
    c.close()
    return template('change',rows=result, bid=bid)

@route("/update", method='POST')
def update():
    i = request.forms.get('id')
    b = request.forms.get('blog')
    u = request.forms.get('user')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword',
                           db='3004012790_lokaverk_vef')

    cur = conn.cursor()

    cur.execute("UPDATE 3004012790_lokaverk_vef.blogs set blog = '"+ b +"' where ID = " + str(i))
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/')

@route('/del/<bid>')
def delete(bid):
    id = bid[1:-1]
    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='3004012790', passwd='mypassword',
                           db='3004012790_lokaverk_vef')

    cur = conn.cursor()
    cur.execute("delete from 3004012790_lokaverk_vef.blogs where ID = " + id)
    conn.commit()
    cur.close()
    conn.close()
    return redirect('/')


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

