function check() {
            var tel = document.form1.tel.value;
            var address = document.form1.address.value;
            if (address == "") {
                document.getElementById("tips").innerHTML = "提示:请填写您的收货地址!";
                document.form1.cid.focus();
                return false;
            }
            else if (tel == "") {
                document.getElementById("tips").innerHTML = "提示:请填写您的联系电话!";
                document.form1.pwd.focus();
                return false;
            }
        }