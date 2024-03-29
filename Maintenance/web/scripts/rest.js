/**
 * api for RESTful operation
 */

/**
 * use case: <a href="/user/12" onclick="doRestDelete(this,'confirm delete?');return false;">delete</a>
 */
function doRestDelete(anchor,confirmMsg) {
	if (confirmMsg && confirm(confirmMsg)) {
		var f = document.createElement("form");
		f.style.display = "none";
		anchor.parentNode.appendChild(f);
		f.method = "POST";
		f.action = anchor.href;
		var m = document.createElement("input");
		m.setAttribute("type", "hidden");
		m.setAttribute("name", "_method");
		m.setAttribute("value", "delete");
		f.appendChild(m);
		f.submit();
	}
}

function doRestBatchDelete(action,checkboxName,form) {
	if (!hasOneChecked(checkboxName)) {
		alert("Please select objects to delete !");
		return;
	}
	if (confirm("Are you sure to delete?")) {
		form.action = action;
		form.method = 'POST';
		
		var m = document.createElement("input");
		m.setAttribute("type", "hidden");
		m.setAttribute("name", "_method");
		m.setAttribute("value", "delete");
		form.appendChild(m);
		
		form.submit();
	}
}

