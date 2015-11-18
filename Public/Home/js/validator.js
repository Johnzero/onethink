function tip(obj) {
	if (obj) {
		$(".form-group").removeClass("has-error");
		obj.focus();
		$(obj).parents(".form-group").addClass("has-error");
		alert(obj.getAttribute('tip'));
	}

	return false;
}
function validator(o) {

	var formElements = o.elements;
	var errorMsg_name = o.name.getAttribute('tip');
	if (o.name.value.trim()) {
		if (!RegExps.isChinese.test(o.name.value.trim())) {
			return tip(o.name);
		}
	}else {
		return tip(o.name);
	}

	if (o.tel.value.trim()) {
		if (!RegExps.isTelphone.test(o.tel.value.trim())) {
			return tip(o.tel);
		}
	}else {
		return tip(o.tel);
	}

	if (o.sfz.value.trim()) {
		if (!RegExps.isIdCard.test(o.sfz.value.trim())) {
			return tip(o.sfz);
		}
	}else {
		return tip(o.sfz);
	}

	if (!o.address.value.trim()) {
		return tip(o.address);
	}

	if (!o.title.value.trim()) {
		return tip(o.title);
	}

	if (!o.content.value.trim()) {
		return tip(o.content);
	}

	if (!o.yzm.value.trim()) {
		return tip(o.yzm);
	}

	return true;
}

String.prototype.trim = function() {
	return this.replace(/^\s*|\s*$/g, "");
};

var RegExps = function() {
};

RegExps.isTelphone = /^[-\+]?\d+(\.\d+)?$/;
RegExps.isNumber = /^[-\+]?\d+(\.\d+)?$/;
RegExps.isEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
RegExps.isPhone = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/;
RegExps.isMobile = /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/;
RegExps.isIdCard = /(^\d{15}$)|(^\d{17}[0-9Xx]$)/;
RegExps.isMoney = /^\d+(\.\d+)?$/;
RegExps.isZip = /^[1-9]\d{5}$/;
RegExps.isQQ = /^[1-9]\d{4,10}$/;
RegExps.isInt = /^[-\+]?\d+$/;
RegExps.isEnglish = /^[A-Za-z]+$/;
RegExps.isChinese = /^[\u0391-\uFFE5]+$/;
RegExps.isUrl = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
RegExps.isDate = /^\d{4}-\d{1,2}-\d{1,2}$/;
RegExps.isTime = /^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}$/;

$(document).ready(function () {
    $('.select-box').select2();
    $('.level1 select').change(function(){ 
        var id = $(this).children('option:selected').val();
        $.post("{:U('Ask/getSubclass')}", { id: id },function(data){
            if (data) {
                $(".level2").css("visibility","inherit");
                $('.level2 select').select2();
                $(".level2 select").empty();
                $(".level2 select").append(data);
            }else {
                $(".level2").css("visibility","hidden");
                $(".level2 select").empty();
            }
        });
    });

    var wait=60;
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");           
            o.text="获取短信验证码";
            wait = 60;
        } else {
            if(wait==60)
            {
                var tel = $("input[name='tel']").val();
                if(tel=="")
                {
                    alert("请输入手机号码!");
                    tip($("input[name='tel']"));
                    return false;
                }
            
                get_message(tel);
            }
            
            o.setAttribute("disabled", true);
            o.text="重新发送(" + wait + ")";
            wait--;
            setTimeout(function() {
                time(o)
            },
            1000)
        }
    }
    function get_message(tel){
        $.ajax({
            type : 'POST',
            url : "/Ask/get_message.html",
            data : {
                tel : tel
            },
            success : function (response , status , xhr) {
                if(response.error==true || response.error==false)
                {
                    alert(response.msg);
                    return false;
                }
                else
                {
                    alert("系统繁忙，请稍候再试");
                    return false;
                }
            },
            complete : function(){
                $('#yzm').show();
            }
        });
    }
    $("#yzm").click(function () {
        if ($("#yzm").attr("disabled")) {
            return;
        }else {
            time(this);
        }
    })
})
