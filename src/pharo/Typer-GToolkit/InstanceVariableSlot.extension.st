Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtCanTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtShadowMethodIn: aContext [
	| shadow |
	self flag: 'FIXME'.
	self assert: [ self typGtCanTypeIn: nil ].
	shadow := (TypShaShadow typGtShadowFor: owningClass instanceSide)
			ifEmpty: [ TypShaShadow typGtNewShadowFor: owningClass ]
			ifNotEmpty: #first.
	^ shadow
		typGtShadowVariable: name asSymbol
		type: (owningClass typAsType lookupVariable: name asSymbol)
		in: (owningClass isInstanceSide ifTrue: [ shadow ] ifFalse: [ shadow class ])
]
