// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MetaCircle {

    // Struct to represent a User
    struct User {
        //  ASSIGNMENT #1
        YOUR_CODE_GOES_HERE userAddress;
        string username;
        string bio;
    }
    
    // Struct to represent a Post
    struct Post {
        uint postId;
        address author;
        string content;
        //  ASSIGNMENT #2
        YOUR_CODE_GOES_HERE likes;
        mapping(address => bool) likedBy; // Mapping to track which users have liked the post
        uint[] commentIds;  // Array to store comment IDs associated with the post
    }

    // Struct to represent a Comment
    struct Comment {
        uint commentId;
        string authorUsername; // Store the username of the commenter
        uint postId;
        //  ASSIGNMENT #3
        YOUR_CODE_GOES_HERE content;
    }

    // Mappings to store users, posts, and comments
    mapping(address => User) public users;
    //  ASSIGNMENT #4
    mapping(uint => YOUR_CODE_GOES_HERE) public posts;
    mapping(uint => Comment) public comments;

    // Counters for posts and comments
    uint public postCount;
    //  ASSIGNMENT #5
    uint YOUR_CODE_GOES_HERE commentCount;

}
