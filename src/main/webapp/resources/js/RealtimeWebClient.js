RealtimeWebClient = {};

RealtimeWebClient.sock = undefined;
RealtimeWebClient.connected = false;
RealtimeWebClient.readyJoins = [];
RealtimeWebClient.handlers = {};

RealtimeWebClient.init = function(sock) {
	sock.onopen = function() {
		
		RealtimeWebClient.sock = sock;
		RealtimeWebClient.connected = true;
		
		if (console !== undefined && console.log !== undefined) {
			console.log('=== RealtimeWeb Server에 접속되었습니다. ===');
		}
		
		for (var i in RealtimeWebClient.readyJoins) {
			RealtimeWebClient.send(RealtimeWebClient.readyJoins[i]);
		}
	};
	
	// 등록된 핸들러 실행
	sock.onmessage = function(e) {
		var data = JSON.parse(e.data);
		var namespace = data.namespace;
		var id = data.id;
		var handlerName = data.handlerName;
		var object = data.object;
		
		if (RealtimeWebClient.handlers[namespace] != undefined) {
			if (RealtimeWebClient.handlers[namespace][id] != undefined) {
				if (RealtimeWebClient.handlers[namespace][id][handlerName] != undefined) {
					RealtimeWebClient.handlers[namespace][id][handlerName](object);
				}	
			}
		}
	};
};

RealtimeWebClient.send = function(data) {
	if (RealtimeWebClient.connected) {
		RealtimeWebClient.sock.send(JSON.stringify(data));
	}
};

RealtimeWebClient.join = function(namespace, id) {
	var d = {
		namespace: namespace
		, id: id
	};
	
	if (RealtimeWebClient.connected) {
		RealtimeWebClient.send(d);
	} else {
		RealtimeWebClient.readyJoins.push(d);
	}
};

// 핸들러 등록
RealtimeWebClient.setHandler = function(namespace, id, handlerName, handler) {
	if (RealtimeWebClient.handlers[namespace] == undefined) {
		RealtimeWebClient.handlers[namespace] = {};
	}
	if (RealtimeWebClient.handlers[namespace][id] == undefined) {
		RealtimeWebClient.handlers[namespace][id] = {};
	}
	RealtimeWebClient.handlers[namespace][id][handlerName] = handler;
};