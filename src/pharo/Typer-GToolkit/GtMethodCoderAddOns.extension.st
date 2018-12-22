Extension { #name : #GtMethodCoderAddOns }

{ #category : #'*Typer-GToolkit' }
GtMethodCoderAddOns >> typGtRemoveStylerOfType: aClass [
	| styler |
	styler := stylers detect: [ :each | each class == aClass ] ifNone: [  ].
	styler isNil
		ifTrue: [ ^ self ].
	stylers remove: styler.
	modified add: #stylers
]
