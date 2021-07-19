USE adlister_db;
INSERT INTO users (username, email, password)
VALUES ('bob-o', 'bobby@email.com', 'password'),
       ('sally-smith', 'sally@email.com', 'password');

INSERT INTO ads (user_id, title, description, category)
VALUES  (2, 'Husky ready to find a forever home',
         'Meet James our husky that looks exactly like a corgi! He is a lovable fluffball full of energy, and would be a perfect fit for a bachelor looking to get some exercise in!', 'Dogs'),
       (1, 'Tabby ready to find a forever home',
        'Meet Greg our tabby that looks exactly like a corgi! He is short, thicc and orange, just like a corgi. Bring him home today!', 'Cats'),
       (2, 'Pitbull ready to find a forever home',
        'Meet Vanessa our pitbull that looks exactly like a corgi! Vanessa is a sweet velvet hippo that desires only to get belly pats!', 'Dogs'),
       (1, 'CrabCake ready to find a home',
        'Meet Crabcake our ragdoll that looks exactly like a corgi! No words can describe our local furry crustation. So I refuse to offer any. Come adopt her before she adopts you...', 'Cats')
# INSERT INTO categories (ad_id, name)
# VALUES (1, 'DOG'), (1, 'CAT');