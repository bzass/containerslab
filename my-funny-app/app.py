from flask import Flask, render_template
import random
import platform

app = Flask(__name__)

# list of cat images
images = [
    "https://brunocapuano.files.wordpress.com/2016/06/swarmnado.gif",
    "https://i.giphy.com/OP7kIfBat5sGY.gif",
    "https://camo.githubusercontent.com/3ebbd5d2989aef90e30562ac37cad8656f4a1881/687474703a2f2f692e67697068792e636f6d2f3441433131476d517a46564b672e676966",
    "https://cdn-images-1.medium.com/max/1600/1*3eOlQ1Ea6y7tZKJlzI2q5w.gif",
    "https://mir-s3-cdn-cf.behance.net/project_modules/disp/cbc69a17085171.562b572169e35.gif",
    "http://bestanimations.com/Humans/Eyes/eyes-animated-gif-11.gif",
    "https://cdn-images-1.medium.com/max/1600/1*g9ee7RUD831R9n6Km5Jizg.gif",
    "https://m.popkey.co/770e6b/4Mm5x.gif",
    "http://bestanimations.com/Cartoons/Simpsons/the-simpsons-animated-gif-4.gif",
    "http://www.fubiz.net/wp-content/uploads/2016/07/totorofitness2.gif",
    "https://media.giphy.com/media/pt0EKLDJmVvlS/giphy.gif"
]

@app.route('/')
def index():
    url = random.choice(images)
    hostname = platform.node()
    return render_template('index.html', url=url, hostname=hostname)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
