tests
testSend
	command := self newCommand.
	command 
		client: self newClient;
		text: self anyString;
		fileName: self anyStringTwo;
		channel: (DSGuildTextChannel new id: self anyString; yourself).
	self should: [ command send ] raise: DSTokenRequiredError