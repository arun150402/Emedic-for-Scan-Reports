var f=0;
function isValidFile(){
    var file=event.target.files;
    var type=file[0].type;
    var size=file[0].size;
    if(type=="image/jpeg" || type=="image/png" || type=="image/jpg"){
        f=5;
    }
    else{
        f=1;
    }
    if(size > 100000000000){
        if(f==1){
            f=10;
        }
        else{
            f=2;
        }
    }
}
function check(){
    if(f==0){
        alert("No file choosen");
return false;
    }
   else if(f==1){
        alert("invalid format choosen");
return false;
    }
    else if(f==2){
        alert("File size is too large");
return false;
    }
    else if(f==10){
        alert ("Invalid format and larger size");
return false;
    }
    else {
	
        alert("uploaded successfully");
		return true;
    }
}