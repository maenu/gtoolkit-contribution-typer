Extension { #name : #GtMethodCoderAddOns }

{ #category : #'*Typer-GToolkit' }
GtMethodCoderAddOns >> typGtRemoveStylerOfType: aClass [
	<typTypeArgument: 1 as: 'GtCoderBodyStyler class'>
	| styler |
	styler := stylers detect: [ :e | e class == aClass ] ifNone: [  ].
	styler isNil
		ifTrue: [ ^ self ].
	stylers remove: styler.
	modified add: #stylers
]
