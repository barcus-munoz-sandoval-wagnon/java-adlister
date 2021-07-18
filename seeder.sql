USE adlister_db;
INSERT INTO users (username, email, password)
VALUES ('bob-o', 'bobby@email.com', 'password'),
       ('sally-smith', 'sally@email.com', 'password');

INSERT INTO ads (user_id, title, description, category)
VALUES (1, 'Doberman up for adoption',
        'Meet Zeus our 75lb doberman who now official ready for his forever home! He is currently up to date on his shots and is in fact neutered. Inquire for more info.','Dogs'),
       (1, 'Maine Coon up for adoption',
        'Meet Hades our 30lb maine coon who now official ready for her forever home! She is currently up to date on her shots and is in fact neutered. Inquire for more info.','Cats')

# INSERT INTO categories (ad_id, name)
# VALUES (1, 'DOG'), (1, 'CAT');