Extension { #name : #TypFunctionType }

{ #category : #'*Typer-GToolkit' }
TypFunctionType >> typGtAsResultRopedText [
	signalsAlways
		ifNotNil: [ ^ signalsAlways typGtAsRopedText
				foreground: BrGlamorousColors errorBackgroundColor ].
	signalsMaybe ifNotNil: [  ].
	^ self result typGtAsRopedText
		, (signalsMaybe
				ifNil: [ '' asRopedText ]
				ifNotNil: [ '/' asRopedText , signalsMaybe typGtAsRopedText
						foreground: BrGlamorousColors errorBackgroundColor ])
]

{ #category : #'*Typer-GToolkit' }
TypFunctionType >> typGtAsRopedText [
	^ (('(' , (',' join: (self arguments collect: #asString)) , ')->') asRopedText
		foreground: BrGlamorousColors fadedTextColor) , self typGtAsResultRopedText
]
