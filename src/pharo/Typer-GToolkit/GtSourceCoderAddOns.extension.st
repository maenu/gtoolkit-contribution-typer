Extension { #name : #GtSourceCoderAddOns }

{ #category : #'*Typer-GToolkit' }
GtSourceCoderAddOns >> typGtModified [
	^ modified
]

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

{ #category : #'*Typer-GToolkit' }
GtSourceCoderAddOns >> typGtReplaceStylerOfType: aClass with: aStyler [
	<typTypeArgument: 1 as: 'GtCoderBodyStyler class'>
	| i |
	i := stylers detectIndex: [ :e | e class == aClass ].
	stylers at: i put: aStyler.
	modified add: #stylers
]
