Extension { #name : #TypFunctionType }

{ #category : #'*Typer-GToolkit' }
TypFunctionType >> typGtAsResultRopedText [
	^ signalsAlways
		ifNil: [ self result typGtAsRopedText ]
		ifNotNil: [ signalsAlways typGtAsRopedText
				foreground: BrGlamorousColors errorBackgroundColor ]
]

{ #category : #'*Typer-GToolkit' }
TypFunctionType >> typGtAsRopedText [
	^ (('(' , (',' join: (self arguments collect: #asString)) , ')->') asRopedText
		foreground: BrGlamorousColors fadedTextColor) , self typGtAsResultRopedText
]
