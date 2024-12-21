import sqlite3
from faker import Faker
import random

def create_fake_data(db_path):
    faker = Faker()


    conn = sqlite3.connect('script.db')
    cursor = conn.cursor()


    users = [(faker.name(), faker.unique.email()) for _ in range(10)]
    cursor.executemany("INSERT INTO users (fullname, email) VALUES (?, ?)", users)


    statuses = [('new',), ('in progress',), ('completed',)]
    cursor.executemany("INSERT INTO status (name) VALUES (?)", statuses)


    cursor.execute("SELECT id FROM users")
    user_ids = [row[0] for row in cursor.fetchall()]

    cursor.execute("SELECT id FROM status")
    status_ids = [row[0] for row in cursor.fetchall()]

    tasks = [
        (
            faker.sentence(nb_words=4),
            faker.text(max_nb_chars=200),
            random.choice(status_ids),
            random.choice(user_ids),
        )
        for _ in range(20)
    ]
    cursor.executemany(
        "INSERT INTO tasks (title, description, status_id, user_id) VALUES (?, ?, ?, ?)",
        tasks,
    )


    conn.commit()
    conn.close()


if __name__ == "__main__":

    create_fake_data("script.db")
