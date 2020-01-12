pragma solidity >=0.4.22 <0.6.0;

contract Doctorfactory{
    struct details{
            string name;
            string phone;
            string d_id;
            bytes32 encoded_pw;
        }
        
        details[] public doctor_details;
        
        function createDoctor(string memory name, string memory phone, string memory d_id, string memory pw) public returns(string memory fname) {
            bytes32 encoded_pw = keccak256(abi.encodePacked(pw));
            details memory temp;
            temp.name = name;
            temp.phone = phone;
            temp.d_id = d_id;
            temp.encoded_pw = encoded_pw;
            doctor_details.push(temp);
            return doctor_details[doctor_details.length-1].name;
        }
        
        function checkDoctor(string memory id,string memory pw) public view returns(string memory name, string memory phone, string memory d_id){
            bytes32 encoded_pw = keccak256(abi.encodePacked(pw));
            for(uint i=0;i<doctor_details.length;i++)
            {
                if(keccak256(abi.encodePacked((id)))==keccak256(abi.encodePacked((doctor_details[i].d_id))) && doctor_details[i].encoded_pw == encoded_pw)
                {
                    return (doctor_details[i].name,doctor_details[i].phone,doctor_details[i].d_id);
                }
            }
        } 
        
        
        
    
}
