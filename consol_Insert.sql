-- Insert Users
INSERT INTO users (username, email, password_hash, bio, profile_picture)
VALUES
('seyhakoko', 'seyha12@gmail.com', 'seyha@#@1234', 'I\m a developer', 'seyha.jpg'),
('endykoko', 'charlie@example.com', 'hashedpassword3', 'I like coding', 'endy.jpg'),
('yanuthkoko', 'yanuth111@gmail.com', 'yanuth@#$1122', 'I like Java programming', 'yanuth.jpg');


-- Insert Posts
INSERT INTO posts (user_id, content, media_url, post_type)
VALUES
(1, 'Just climbed a mountain! Sharing the view with you all.', 'mountain.jpg', 'image'),
(2, 'Check out my latest blog post on web development tips!', NULL, 'text'),
(3, 'My new travel vlog is live on YouTube! Watch it now.', 'vlog.mp4', 'video');


-- Insert Likes
INSERT INTO likes (user_id, post_id)
VALUES
(2, 1),  -- Endy likes Seyha's post
(3, 1),  -- Yanuth likes Seyha's post
(1, 2);  -- Seyha likes Endy's post


-- Insert Comments
INSERT INTO comments (post_id, user_id, comment_text)
VALUES
(1, 2, 'Amazing view! Thanks for sharing.'),
(1, 3, 'Looks great! Wish I was there.'),
(2, 1, 'Nice post, Endy! Looking forward to more.');


-- Insert Followers
INSERT INTO followers (follower_id, following_id)
VALUES
(2, 1),  -- Endy follows Seyha
(3, 1),  -- Yanuth follows Seyha
(1, 3);  -- Seyha follows Yanuth


-- Insert Messages
INSERT INTO messages (sender_id, receiver_id, message_text)
VALUES
(1, 2, 'Hey Endy, how are you?'),
(2, 1, 'I’m good, Seyha! What’s up?'),
(3, 1, 'Love your photo, Seyha!');


-- Insert Notifications
INSERT INTO notifications (user_id, type, related_user_id)
VALUES
(1, 'like', 2),     -- Seyha gets notified Endy liked their post
(1, 'comment', 3),  -- Seyha gets notified Yanuth commented
(2, 'follow', 1);   -- Endy gets notified that Seyha followed them


-- Insert Hashtags
INSERT INTO hashtags (tag)
VALUES
('loveCode'),
('WebDevlop'),
('NewPost');


-- Tag Posts with Hashtags
INSERT INTO post_hashtags (post_id, hashtag_id)
VALUES
(1, 2),  -- Post 1 tagged with #WebDevlop
(3, 1),  -- Post 3 tagged with #loveCode
(3, 3);  -- Post 3 tagged with #NewPost


-- Insert OAuth Accounts
INSERT INTO oauth_accounts (user_id, provider, provider_user_id)
VALUES
(1, 'google', 'google_12345'),   -- Seyha's Google account
(2, 'facebook', 'fb_54321');     -- Endy's Facebook account
