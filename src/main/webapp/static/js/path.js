function getRealPath(){
//获取当前网址，如： http://localhost:8083/myproj/view/ahha.jsp
    var curWwwPath=window.document.location.href;
//获取主机地址之后的目录，如： myproj/view/ahha.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
//获取主机地址，如： http://localhost:8080
    var localhostPaht=curWwwPath.substring(0,pos);
//获取带"/"的项目名，如：/ahha
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

//得到了 服务器名称和项目名称
    var realPath=localhostPaht+projectName;
    return realPath;
}

var url = "http://localhost:8080/sshLearner_war_exploded";