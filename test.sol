// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.20;

contract HelloWorld {
    string strVar = "hello, world";
    // Info[] infos;
    mapping(uint256 => Info) infoMapping;

    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    function sayHello(uint256 _id) public view returns(string memory) {
        // for(uint256 index = 0; index < infos.length; index++) {
        //     if(infos[index].id == _id) {
        //         return addInfo(infos[index].phrase);
        //     }
        // }
        if(infoMapping[_id].addr == address(0x0)) {
            return addInfo(strVar);
        } else {
            return addInfo(infoMapping[_id].phrase);
        }
    }

    function setHelloWorld(string memory newString, uint256 _id) public {
        Info memory info = Info(newString, _id, msg.sender);
        // infos.push(info);
        infoMapping[_id] = info;
    }

    function addInfo(string memory strVal) internal pure returns(string memory) {
        return string.concat(strVal, " from Franklin constract");
    }
}