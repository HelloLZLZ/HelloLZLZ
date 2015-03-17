// JavaScript Document

//检验字符串是否只包括字母数字和下划线
function isNumberOr_Letter(str) {
	var regu = "^[0-9a-zA-Z\_]+$";
	var re = new RegExp(regu);
	return re.test(str);
}

//检验字符串是否为空
function isNull(str) {
	if(str == "" || str == undefined) {
		return true;
	}else {
		return false;
	}
}

//检验字符串是否为手机号
function isMobile(str) {
	var regu = "^1(([358][0-9])|(47))[0-9]{8,8}$";
	var re = new RegExp(regu);
	return re.test(str);
}

//检验字符串是否是大于0小于100的数字
function isCareerYear(str) {
	var regu = "^([1-9]|[1-9][0-9]|100)$";
	var re = new RegExp(regu);
	return re.test(str);
}

//检验两个字符串是否相同
function isSameString(str1,str2){
	return (str1 == str2);
}

//检验字符串是否是域名url
function IsURL(str){
	if(str == "" || str == undefined) {
		return true;
	}
	var regu="^((https|http|ftp|rtsp|mms)?://)"  
    + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" // ftp的user@  
    + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184  
    + "|" // 允许IP和DOMAIN（域名）  
    + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.  
    + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名  
    + "[a-z]{2,6})" // first level domain- .com or .museum  
    + "(:[0-9]{1,4})?" // 端口- :80  
    + "((/?)|" // a slash isn't required if there is no file name  
    + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$"; 
    var re=new RegExp(regu); 
    return re.test(str); 
}

