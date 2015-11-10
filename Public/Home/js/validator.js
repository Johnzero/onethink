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
