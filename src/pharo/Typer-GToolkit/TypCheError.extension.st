Extension { #name : #TypCheError }

{ #category : #'*Typer-GToolkit' }
TypCheError >> typGtAsAttribute [
	^ TypGtCheAttribute
		object: self
		color: self typGtColor
		message: self messageText
]

{ #category : #'*Typer-GToolkit' }
TypCheError >> typGtColor [
	self subclassResponsibility
]
