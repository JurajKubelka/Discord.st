ui
specModelWithToolbar
	"Get Spec model that represents a dialog where someone can write email and password.
	This model includes a toobar with Login and Cancel buttons that closes the UI on click."
	| model layout |
	model := self basicSpecModel.
	model assign: OkCancelToolbar new to: #toolbar.
	model toolbar okButton label: 'Login'.
	model toolbar okAction: [ self sendAction value: model ].
	model extent: 400 @ (model class inputTextHeight * 4.2).
	layout := self basicSpecLayout
		newRow: [ :row | row add: #toolbar ] height: model class inputTextHeight;
    	yourself.
	model layout: layout.
	^ model