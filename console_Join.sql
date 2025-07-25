--Get Posts with Author Info
SELECT posts.post_id,
       posts.content,
       posts.media_url,
       posts.post_type,
       users.username,
       users.profile_picture
FROM posts
         JOIN users ON posts.user_id = users.user_id;

--  Get Comments with Commenter Info
SELECT comments.comment_id,
       comments.comment_text,
       users.username AS commenter,
       posts.content  AS post_content
FROM comments
         JOIN users ON comments.user_id = users.user_id
         JOIN posts ON comments.post_id = posts.post_id;


--Followers and Who They Follow
SELECT f.follower_id,
       u1.username AS follower,
       f.following_id,
       u2.username AS following
FROM followers f
         JOIN users u1 ON f.follower_id = u1.user_id
         JOIN users u2 ON f.following_id = u2.user_id;

--Posts with Hashtags
SELECT p.post_id,
       p.content,
       h.tag
FROM posts p
         JOIN post_hashtags ph ON p.post_id = ph.post_id
         JOIN hashtags h ON ph.hashtag_id = h.hashtag_id;

--Messages with sender and receiver
SELECT m.message_text,
       sender.username   AS sender,
       receiver.username AS receiver
FROM messages m
         JOIN users sender ON m.sender_id = sender.user_id
         JOIN users receiver ON m.receiver_id = receiver.user_id;



/*UPDATE*/

--Update all 'text' post_types by user to 'article'
UPDATE posts
SET post_type = 'article'
WHERE user_id = (SELECT user_id
                 FROM users
                 WHERE username = 'seyhakoko');


--Update user bio by email
UPDATE users
SET bio = 'I am a full-stack developer'
WHERE email = 'seyha12@gmail.com';

--Add “(Edited)” tag to all comments made by user_id = 2
UPDATE comments
SET comment_text = comment_text || ' (Edited)'
WHERE user_id = 2;


/*DELETE*/

--Delete all comments from a specific post
DELETE
FROM comments
WHERE post_id = (SELECT post_id
                 FROM posts
                 WHERE content = 'Just climbed a mountain!');

--Delete all likes from user "endyKoko"
DELETE
FROM likes
WHERE user_id = (SELECT user_id
                 FROM users
                 WHERE username = 'endyKoko');


--Delete all posts by user "Seyhakoko"
DELETE
FROM posts
WHERE user_id = (SELECT user_id
                 FROM users
                 WHERE username = 'seyhakoko');

--Delete specific follower relationship
DELETE
FROM followers
WHERE follower_id = 3
  AND following_id = 1;

-- Delete all messages sent to user_id = 1
DELETE
FROM messages
WHERE receiver_id = 1;