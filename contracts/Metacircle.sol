// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Metacircle {

    // Struct to represent a User
    struct User {
        address userAddress; // ASSIGNMENT #1
        string username;
        string bio;
    }
    
    // Struct to represent a Post
    struct Post {
        uint postId;
        address author;
        string content;
        uint likes; // ASSIGNMENT #2
        mapping(address => bool) likedBy; // Mapping to track which users have liked the post
        uint[] commentIds;  // Array to store comment IDs associated with the post
    }

    // Struct to represent a Comment
    struct Comment {
        uint commentId;
        string authorUsername; // Store the username of the commenter
        uint postId;
        string content; // ASSIGNMENT #3
    }

    // Mappings to store users, posts, and comments
    mapping(address => User) public users;
    mapping(uint => Post) public posts; // ASSIGNMENT #4
    mapping(uint => Comment) public comments;

    // Counters for posts and comments
    uint public postCount;
    uint public commentCount; // ASSIGNMENT #5

    // Event to log the creation of a post
    event PostCreated(uint postId, address author, string content);

    // Event to log the creation of a comment
    event CommentCreated(uint commentId, uint postId, string authorUsername, string content);

    // Function to create a user profile
    function createUser(string memory _username, string memory _bio) public {
        users[msg.sender] = User({
            userAddress: msg.sender,
            username: _username,
            bio: _bio
        });
    }

    // Function to create a post
    function createPost(string memory _content) public {
        require(bytes(users[msg.sender].username).length > 0, "User does not exist");

        postCount++;
        Post storage newPost = posts[postCount];
        newPost.postId = postCount;
        newPost.author = msg.sender;
        newPost.content = _content;

        emit PostCreated(postCount, msg.sender, _content);
    }

    // Function to like a post
    function likePost(uint _postId) public {
        require(_postId > 0 && _postId <= postCount, "Invalid post ID");
        Post storage post = posts[_postId];

        require(!post.likedBy[msg.sender], "Already liked this post");

        post.likes++;
        post.likedBy[msg.sender] = true;
    }

    // Function to add a comment to a post
    function addComment(uint _postId, string memory _content) public {
        require(_postId > 0 && _postId <= postCount, "Invalid post ID");

        commentCount++;
        comments[commentCount] = Comment({
            commentId: commentCount,
            authorUsername: users[msg.sender].username,
            postId: _postId,
            content: _content
        });

        posts[_postId].commentIds.push(commentCount);

        emit CommentCreated(commentCount, _postId, users[msg.sender].username, _content);
    }
}
