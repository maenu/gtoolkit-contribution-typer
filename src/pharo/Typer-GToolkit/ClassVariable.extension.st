Extension { #name : #ClassVariable }

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtCanType [

	<typPraResult: 'Boolean'>
	^ true
]

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShadowMethod [

	| shadow |
	self assert: [ self typGtCanType ].
	shadow := (TypShaShadow typGtShadowFor: definingClass)
		          ifEmpty: [ TypShaShadow typGtNewShadowFor: definingClass ]
		          ifNotEmpty: #first.
	^ shadow
		  typGtShadowVariable: name asSymbol
		  type: value typInfType
		  in: shadow class
]
