Extension { #name : 'GtTextualCoderAddOns' }

{ #category : '*Typer-GToolkit' }
GtTextualCoderAddOns >> typGtReplaceStylerOfType: aClass with: aStyler [
	<typPraArguments: 'GtCoderBodyStyler class,?'>
	| i |
	i := stylers detectIndex: [ :e | e class == aClass ].
	stylers at: i put: aStyler
]
