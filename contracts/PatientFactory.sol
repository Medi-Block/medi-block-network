pragma solidity >=0.4.22 <0.6.0;

contract PatientFactory{

    mapping(string=>string[]) public records;
    struct pdetails{
        string name;
        string phone;
        uint age;
        string p_id;
        bytes32 encoded_pw;
        string d_id_request;
        bool accepted;
        }
        
    mapping(string=>string[]) public patient_records;
        
    pdetails[] public patients;
        
    function createPatient(string memory name, string memory phone, uint age, string memory p_id, string memory pw) public returns(string memory fname) {
            bytes32 encoded_pw = keccak256(abi.encodePacked(pw));
            pdetails memory temp;
            temp.name = name;
            temp.phone = phone;
            temp.age = age;
            temp.p_id = p_id;
            temp.encoded_pw = encoded_pw;
            patients.push(temp);
            return patients[patients.length-1].name;
        }
        
        function checkPatient(string memory id,string memory pw) public view returns(string memory name, string memory phone, uint age, string memory p_id){
            bytes32 encoded_pw = keccak256(abi.encodePacked(pw));
            for(uint i=0;i<patients.length;i++)
            {
                if(keccak256(abi.encodePacked((id)))==keccak256(abi.encodePacked((patients[i].p_id))) && patients[i].encoded_pw == encoded_pw)
                {
                    return (patients[i].name,patients[i].phone,patients[i].age,patients[i].p_id);
                }
            }
        } 
        
        function addNewRequest(string memory p_id,string memory d_id) public{
            for(uint i=0;i<patients.length;i++)
            {
                if(keccak256(abi.encodePacked((p_id)))==keccak256(abi.encodePacked((patients[i].p_id))))
                {
                    patients[i].d_id_request = d_id;
                    // patients[i].accepted = true;
                }
            }
        }
        
        function approveRequest(string memory p_id) public{
            for(uint i=0;i<patients.length;i++)
            {
                if(keccak256(abi.encodePacked((p_id)))==keccak256(abi.encodePacked((patients[i].p_id))))
                {
                    // patients[i].d_id_request = d_id;
                    patients[i].accepted = true;
                    
                }
            }
        }
        
        function returnPatientDetails(string memory p_id, string memory d_id) public view returns(bool){
            for(uint i=0;i<patients.length;i++)
            {
                if(keccak256(abi.encodePacked((p_id)))==keccak256(abi.encodePacked((patients[i].p_id))) && keccak256(abi.encodePacked((d_id)))==keccak256(abi.encodePacked((patients[i].d_id_request))) && patients[i].accepted==true)
                {
                    return true;
                }
            }
        }
        
        function addNewRecord(string memory record,string memory p_id,string memory d_id) public{
            for(uint i=0;i<patients.length;i++)
            {
                if(keccak256(abi.encodePacked((p_id)))==keccak256(abi.encodePacked((patients[i].p_id))))
                {
                    patient_records[p_id].push(d_id);
                    records[d_id].push(record);
                }
            }
        }
}
