instance creation
fromJsonObject: jsonObject api: restApi
	"Return an instance from a JSON object.
	Resolve if it is a Voice or Text Channel.
	See https://discordapp.com/developers/docs/resources/channel#guild-channel-object
	jsonObject is a Dictionary."
	| theClass |
	(jsonObject at: 'type') = 'text'
		ifTrue: [ theClass := DSGuildTextChannel ].
	(jsonObject at: 'type') = 0
		ifTrue: [ theClass := DSGuildTextChannel ].
	(jsonObject at: 'type') = 'voice'
		ifTrue: [ theClass := DSGuildVoiceChannel ].
	(jsonObject at: 'type') = 2
		ifTrue: [ theClass := DSGuildVoiceChannel ].
	theClass ifNotNil: [ 
		^ theClass new 
			api: restApi; 
			initializeUsingJsonObject: jsonObject; 
			yourself ].
	"The Discord API defines only text and voice."
	^ self shouldNotImplement 