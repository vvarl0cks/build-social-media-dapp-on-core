// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SocialMediaV1 {

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
        mapping(address => bool) likedBy;
        uint[] commentIds;
    }

    // Struct to represent a Comment
    struct Comment {
        uint commentId;
        string authorUsername;
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
