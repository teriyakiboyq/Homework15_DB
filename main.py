from flask import Flask, jsonify
import sqlite3
import query_param

app = Flask(__name__)
DATA_PATH = 'animal.db'


def serialize_rows(row: sqlite3.Row):
    return {key: row[key] for key in row.keys()}


@app.route('/<animal_id>')
def search_by_animal(animal_id):
    conn: sqlite3.Connection = app.config['db']
    cursor = conn.cursor()

    cursor.execute(query_param.GET_ANIMAL_ID_QUERY, (animal_id,))
    row = cursor.fetchone()

    cursor.close()

    return jsonify(serialize_rows(row))


if __name__ == '__main__':
    connection = sqlite3.connect(DATA_PATH, check_same_thread=False)
    connection.row_factory = sqlite3.Row
    app.config['db'] = connection
    try:
        app.run(debug=True)
    except KeyboardInterrupt:
        connection.close()
