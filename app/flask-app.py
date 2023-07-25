from flask import Flask, render_template, request

app = Flask(__name__)

books = []


# Rota principal
@app.route('/')
def home():
    return "Bem vindo ao meu aplicativo Flask!!!!"


@app.route('/library', methods=['GET', 'POST'])
def library():
    if request.method == 'POST':

        action = request.form.get('action')

        if action == 'add':

            title = request.form['title']
            author = request.form['author']
            rating = int(request.form['rating'])

            star_icon = f"img/{rating}_star_rating.png"

            new_book = {
                'title': title,
                'author': author,
                'rating': rating,
                'star_icon': star_icon
            }
            books.append(new_book)

        elif action == 'delete':

            title = request.form['title']

            for book in books:
                if book['title'] == title:
                    books.remove(book)
                    break

    return render_template('library.html', books=books)


if __name__ == '__main__':
    app.run(debug=True)
