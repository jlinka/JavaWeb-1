function check() {
            var passwd = document.form1.pwd.value;
            var name = document.form1.cid.value;
            if (name == "") {
                document.getElementById("tips").innerHTML = "提示:请填写您的用户名!";
                document.form1.cid.focus();
                return false;
            }
            else if (passwd == "") {
                document.getElementById("tips").innerHTML = "提示:请填写您的密码!";
                document.form1.pwd.focus();
                return false;
            }
        }