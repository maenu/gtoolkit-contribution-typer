Extension { #name : #GtSourceCoderAddOns }

{ #category : #'*Typer-GToolkit' }
GtSourceCoderAddOns >> typGtRemoveStylerOfType: aClass [
	<typTypeArgument: 1 as: 'GtCoderBodyStyler class'>
	| styler |
	styler := stylers detect: [ :e | e class == aClass ] ifNone: [  ].
	styler isNil
		ifTrue: [ ^ self ].
	stylers remove: styler.
	modified add: #stylers
]
