pragma solidity >=0.4.22 <0.6.0;
import "./Doctorfactory.sol";
import "./PatientFactory.sol";

contract admin{
    
        
        string[] public doctor_ids;
        string[] public patient_ids;
        address public doctorfactory;
        address public patientfactory;
        
        
        function setDoctorFactory(address _doctorfactory) public{
            doctorfactory = address(_doctorfactory);
        }
        
        function setPatientFactory(address _patientfactory) public{
            patientfactory = address(_patientfactory);
        }
        
        function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
        
        function registerDoctor(string memory name, string memory phone, string memory pw) public returns(string memory fname){
            uint d_num = doctor_ids.length + 1 + 10000000;
            string memory d_id = uint2str(d_num);
            doctor_ids.push(d_id);
            Doctorfactory newdoctor = Doctorfactory(doctorfactory);
            return newdoctor.createDoctor(name,phone,d_id,pw);
        }
        
        function registerPatient(string memory name, string memory phone, uint age, string memory pw) public returns(string memory fname){
            uint p_num = patient_ids.length + 1 + 10000000;
            string memory p_id = uint2str(p_num);
            patient_ids.push(p_id);
            PatientFactory newpatient = PatientFactory(patientfactory);
            return newpatient.createPatient(name,phone,age,p_id,pw);
        }
        
        function getpatientdetail(string memory p_id, string memory d_id) public{
            PatientFactory newpatient = PatientFactory(patientfactory);
            newpatient.addNewRequest(p_id,d_id);
        }
        
        function addRecord(string memory record, string memory d_id, string memory p_id) public{
            PatientFactory newpatient = PatientFactory(patientfactory);
            return newpatient.addNewRecord(record,p_id,d_id);
        }

}
