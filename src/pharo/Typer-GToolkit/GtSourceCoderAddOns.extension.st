Extension { #name : #GtSourceCoderAddOns }

{ #category : #'*Typer-GToolkit' }
GtSourceCoderAddOns >> typGtReplaceStylerOfType: aClass with: aStyler [
	<typTypeArgument: 1 as: 'GtCoderBodyStyler class'>
	| i |
	i := stylers detectIndex: [ :e | e class == aClass ].
	stylers at: i put: aStyler.
	modified add: #stylers
]
