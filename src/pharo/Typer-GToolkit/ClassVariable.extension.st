Extension { #name : #ClassVariable }

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtCanTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShadowMethodIn: aContext [
	| shadow |
	self flag: 'FIXME'.
	self assert: [ self typGtCanTypeIn: nil ].
	shadow := (TypShaShadow typGtShadowFor: definingClass)
			ifEmpty: [ TypShaShadow typGtNewShadowFor: definingClass ]
			ifNotEmpty: #first.
	^ shadow
		typGtShadowVariable: name asSymbol
		type: value typInfType
		in: shadow class
]
