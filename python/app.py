from flask import Flask, render_template, request, jsonify
from unittest import result
from urllib import request
import requests
from bs4 import BeautifulSoup
from itertools import zip_longest
import pymysql
app=Flask(__name__)
@app.get("/python/scrapping")

def home():
    products=[]
    prices=[]
    url="https://www.wiki.tn/c/electromenager-cuisine--504.html"
    result=requests.get("https://www.wiki.tn/c/electromenager-cuisine--504.html")
    src=result.content
    soup=BeautifulSoup(src,"lxml")
    product=soup.find_all("a",{"class":"product-name"})
    price=soup.find_all("span",{"class":"price product-price"})
    for i in range(len(product)):
        products.append(product[i].text.replace("à","a").replace("è","e").replace("é","e").replace("É","E").replace("À","A"))
    print(products)
    for i in range(len(price)):
        prices.append(price[i].text.replace(",",".").replace("DT",""))
    print(prices)
    connection = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             database='bkfin'
                            )
    with connection:
        with connection.cursor() as cursor:
        # Create a new record
            for i in range(len(products)-1):
                sql1 = "SELECT `partner` FROM `partner` WHERE `url_partner`=%s"
                cursor.execute(sql1, (url))
                result = cursor.fetchone()
                print(result)
                sql = "INSERT INTO `product` (`name_product`, `value_product`,`partner_product_partner`) VALUES (%s, %s,%s)"
                cursor.execute(sql, (products[i], prices[i],result))

    return jsonify()

if __name__=="__main__":
    app.run()
