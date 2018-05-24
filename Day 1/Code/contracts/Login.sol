pragma solidity ^ 0.4 .4;

contract userContract {


    struct User {
        string username;
        string password;
    }


    User[] userList;


    function userContract() {
        // constructor
    }



    function validUser(string uname, string pwd) returns(bool) {
        for (uint i = 0; i < userList.length; i++) {
            if (stringsEqual(userList[i].username, uname) && stringsEqual(userList[i].password, pwd)) {
                return true;
            }

        }
        return false;
    }

    function stringsEqual(string storage _a, string memory _b) internal returns(bool) {
        bytes storage a = bytes(_a);
        bytes memory b = bytes(_b);
        if (a.length != b.length)
            return false;

        for (uint i = 0; i < a.length; i++)
            if (a[i] != b[i])
                return false;
        return true;
    }

    function addUser(string uname, string pwd) returns(bool success) {
        User memory newUser = User({
            username: uname,
            password: pwd
        });

        if ( validUser(uname, pwd) == false)
            userList.push(newUser);
        
        return true;
    }
}