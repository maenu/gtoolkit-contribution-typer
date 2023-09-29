Extension { #name : #ClassVariable }

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShaCanTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShaMethodIn: aContext [
	| shadow |
	self flag: 'FIXME'.
	self assert: [ self typGtShaCanTypeIn: nil ].
	shadow := (TypShaShadow typGtShaFor: definingClass)
			ifEmpty: [ TypShaShadow typGtShaNewFor: definingClass ]
			ifNotEmpty: #first.
	^ shadow
		typGtShaVariable: name asSymbol
		type: value typInfType
		in: shadow class
]
