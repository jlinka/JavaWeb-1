function check() {
            var uname = document.form1.aid.value;
            var pwd = document.form1.pwd.value;
            var pwdC = document.form1.pwdC.value;
            var gender = document.form1.gender.value;
            var address = document.form1.address.value;
            var tel = document.form1.tel.value;
            var email = document.form1.email.value;

            var pat = /^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/;
            var moblie = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;

            if (uname == "") {
                document.getElementById("tips_box").innerHTML = "请填写您的用户名!";
                document.form1.aid.focus();
                return false;
            }
            if (uname.length < 5 || uname.length > 11) {
                document.getElementById("tips_box").innerHTML = "请输入用户名长度应为6~10个字符!";
                document.form1.aid.focus();
                return false;
            }
            if (pwd == "") {
                document.getElementById("tips_box").innerHTML = "请输入密码!";
                document.form1.pwd.focus();
                return false;
            }
            if (pwd.length < 5 || pwd.length > 20) {
                document.getElementById("tips_box").innerHTML = "请输入密码长度应为5~20个字符!";
                document.form1.pwd.focus();
                return false;
            }
            if (pwdC == "") {
                document.getElementById("tips_box").innerHTML = "请输入确认密码!";
                document.form1.pwdC.focus();
                return false;
            }
            if (pwd != pwdC) {
                document.getElementById("tips_box").innerHTML = "两次填写的密码不一致!";
                document.form1.pwdC.focus();
                return false;
            }
            if (gender == "") {
                document.getElementById("tips_box").innerHTML = "请输入性别!";
                document.form1.gender.focus();
                return false;
            }
            if (address == "") {
                document.getElementById("tips_box").innerHTML = "请输入地址!";
                document.form1.address.focus();
                return false;
            }
            if (tel == "") {
                document.getElementById("tips_box").innerHTML = "请输入手机号码!";
                document.form1.tel.focus();
                return false;
            }
            if (!moblie.test(tel)) {
                document.getElementById("tips_box").innerHTML = "请填写正确的手机号!";
                document.form1.tel.focus();
                return false;
            }
            if (email == "") {
                document.getElementById("tips_box").innerHTML = "请输入电子邮箱!";
                document.form1.mail.focus();
                return false;
            }
        }