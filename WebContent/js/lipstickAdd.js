function check() {
            var lipstickId = document.form1.lipstickId.value;
            var lipstickType = document.form1.lipstickType.value;
            var lipstickName = document.form1.lipstickName.value;
            var commodityPlace = document.form1.commodityPlace.value;
            var filePath = document.form1.filePath.value;
            var Inventory = document.form1.Inventory.value;
            var introduction = document.form1.introduction.value;

            var pat = /^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/;
            var moblie = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;

            if (lipstickId == "") {
                document.getElementById("tips_box").innerHTML = "请填写唇膏id!";
                document.form1.aid.focus();
                return false;
            }
 
            if (lipstickType == "") {
                document.getElementById("tips_box").innerHTML = "请输入唇膏类型!";
                document.form1.lipstickType.focus();
                return false;
            }
            
            if (lipstickName == "") {
                document.getElementById("tips_box").innerHTML = "请输入唇膏名称!";
                document.form1.lipstickName.focus();
                return false;
            }
          
            if (commodityPlace == "") {
                document.getElementById("tips_box").innerHTML = "请输入唇膏产地!";
                document.form1.commodityPlace.focus();
                return false;
            }
            if (filePath == "") {
                document.getElementById("tips_box").innerHTML = "请输入文件地址!";
                document.form1.filePath.focus();
                return false;
            }
            if (Inventory == "") {
                document.getElementById("tips_box").innerHTML = "请输入唇膏库存!";
                document.form1.Inventory.focus();
                return false;
            }
           
            if (introduction == "") {
                document.getElementById("tips_box").innerHTML = "请输入唇膏简介!";
                document.form1.mail.focus();
                return false;
            }
        }