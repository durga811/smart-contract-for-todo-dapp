//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
//1.create  2.update  3.delete  
contract ToDoContract{

    struct todo {
        string title;
        string description;
        uint256 CreatedTimestamp;
        address createdBy;
    }

    todo[] public tasks; //array to store todo object.
    function Create(string memory _title,string memory _description)public{
        todo memory todoObj =todo(_title,_description,block.timestamp,msg.sender);
        tasks.push(todoObj);
    }

    function Update(uint256 _indexNoToUpdate,string memory updateTitle,string memory updateDescription)public{
        tasks[_indexNoToUpdate]=todo(updateTitle,updateDescription,block.timestamp,msg.sender);
    }

    function Delete(uint256 _indexToDelete)public{
         for(uint256 i=_indexToDelete; i < tasks.length-1; i++){
             tasks[i]=tasks[i+1];
         }
         tasks.pop();
    }
    function displayToDoList()public view returns(todo[] memory){
        return tasks;
    }
    
}